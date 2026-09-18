import { createFileRoute } from "@tanstack/react-router";
import { useCallback, useEffect, useMemo, useState } from "react";
import { Loader2, Pencil, Plus, Trash2, Upload } from "lucide-react";
import { toast } from "sonner";
import {
  QUESTION_TYPES,
  deleteAdminQuestions,
  getAdminTaxonomy,
  importAdminQuestions,
  listAdminQuestions,
  listQuestionSets,
  resolveImportTaxonomy,
  saveAdminQuestion,
  type AdminQuestionInput,
} from "@/lib/admin.functions";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Checkbox } from "@/components/ui/checkbox";
import { Badge } from "@/components/ui/badge";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";

export const Route = createFileRoute("/admin/questions")({
  head: () => ({
    meta: [
      { title: "Question Database | ExamPathway Admin" },
      {
        name: "description",
        content:
          "Add, edit, delete and bulk import exam questions across courses, subjects, chapters, topics and question sets.",
      },
      { property: "og:title", content: "ExamPathway question database" },
      { property: "og:description", content: "Manage and import questions for every course." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: AdminQuestions,
});

interface Taxonomy {
  courses: { id: string; name: string; slug: string }[];
  subjects: { id: string; name: string; course_id: string }[];
  chapters: { id: string; name: string; subject_id: string }[];
  topics: { id: string; name: string; chapter_id: string }[];
}

interface QuestionSet {
  id: string;
  name: string;
  kind: string;
  target_count: number;
  filled: number;
  chapter_id: string | null;
  topic_id: string | null;
  subject_id: string;
}

interface QuestionRow {
  id: string;
  question_text: string;
  difficulty: string;
  question_type: string;
  exam_year: number | null;
  is_pyq: boolean;
  explanation: string | null;
  course_id: string;
  subject_id: string;
  chapter_id: string | null;
  topic_id: string | null;
  question_set_id: string | null;
  question_number: number | null;
  marks: number | null;
  negative_marks: number | null;
  is_active: boolean;
  question_options: {
    id: string;
    label: string;
    option_text: string;
    is_correct: boolean;
    sort_order: number;
  }[];
}

const DIFFICULTIES = ["Easy", "Medium", "Hard"];
const LETTERS = ["A", "B", "C", "D"];
const selectClass = "h-10 rounded-md border border-input bg-background px-3 text-sm";

const emptyDraft = (courseId: string, subjectId: string): AdminQuestionInput => ({
  course_id: courseId,
  subject_id: subjectId,
  chapter_id: null,
  topic_id: null,
  question_set_id: null,
  question_number: null,
  question_text: "",
  difficulty: "Medium",
  question_type: "Single Correct MCQ",
  exam_year: null,
  is_pyq: false,
  explanation: "",
  marks: 4,
  negative_marks: 1,
  is_active: true,
  options: LETTERS.map((label) => ({ label, option_text: "", is_correct: false })),
});

function parseCsv(text: string): string[][] {
  const rows: string[][] = [];
  let row: string[] = [];
  let field = "";
  let quoted = false;
  for (let i = 0; i < text.length; i += 1) {
    const char = text[i];
    if (quoted) {
      if (char === '"' && text[i + 1] === '"') {
        field += '"';
        i += 1;
      } else if (char === '"') quoted = false;
      else field += char;
    } else if (char === '"') quoted = true;
    else if (char === ",") {
      row.push(field);
      field = "";
    } else if (char === "\n") {
      row.push(field);
      rows.push(row);
      row = [];
      field = "";
    } else if (char !== "\r") field += char;
  }
  if (field || row.length) {
    row.push(field);
    rows.push(row);
  }
  return rows.filter((r) => r.some((cell) => cell.trim()));
}

/** Loads the question sets that belong to the given node of the hierarchy. */
function useQuestionSets(
  courseId: string,
  subjectId: string,
  chapterId: string | null,
  topicId: string | null,
) {
  const [sets, setSets] = useState<QuestionSet[]>([]);
  useEffect(() => {
    if (!courseId || !subjectId) {
      setSets([]);
      return;
    }
    let cancelled = false;
    void listQuestionSets({
      data: { courseId, subjectId, chapterId: chapterId || null, topicId: topicId || null },
    })
      .then((data) => {
        if (!cancelled) setSets(data as unknown as QuestionSet[]);
      })
      .catch(() => {
        if (!cancelled) setSets([]);
      });
    return () => {
      cancelled = true;
    };
  }, [courseId, subjectId, chapterId, topicId]);
  return sets;
}

function AdminQuestions() {
  const [taxonomy, setTaxonomy] = useState<Taxonomy | null>(null);
  const [rows, setRows] = useState<QuestionRow[]>([]);
  const [total, setTotal] = useState(0);
  const [page, setPage] = useState(1);
  const [courseId, setCourseId] = useState("");
  const [subjectId, setSubjectId] = useState("");
  const [chapterId, setChapterId] = useState("");
  const [topicId, setTopicId] = useState("");
  const [setId, setSetId] = useState("");
  const [search, setSearch] = useState("");
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [selected, setSelected] = useState<string[]>([]);
  const [draft, setDraft] = useState<AdminQuestionInput | null>(null);
  const [saving, setSaving] = useState(false);
  const [importOpen, setImportOpen] = useState(false);
  const pageSize = 20;

  useEffect(() => {
    void getAdminTaxonomy()
      .then((data) => setTaxonomy(data as Taxonomy))
      .catch((err: unknown) =>
        setError(err instanceof Error ? err.message : "Could not load courses."),
      );
  }, []);

  const load = useCallback(async () => {
    setLoading(true);
    try {
      const result = await listAdminQuestions({
        data: {
          courseId: courseId || null,
          subjectId: subjectId || null,
          chapterId: chapterId || null,
          topicId: topicId || null,
          setId: setId || null,
          search,
          page,
          pageSize,
        },
      });
      setRows(result.rows as unknown as QuestionRow[]);
      setTotal(result.total);
      setSelected([]);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Could not load questions.");
    } finally {
      setLoading(false);
    }
  }, [courseId, subjectId, chapterId, topicId, setId, search, page]);

  useEffect(() => {
    void load();
  }, [load]);

  const subjectsForCourse = useMemo(
    () => (taxonomy?.subjects ?? []).filter((s) => !courseId || s.course_id === courseId),
    [taxonomy, courseId],
  );
  const chaptersForSubject = useMemo(
    () => (taxonomy?.chapters ?? []).filter((c) => c.subject_id === subjectId),
    [taxonomy, subjectId],
  );
  const topicsForChapter = useMemo(
    () => (taxonomy?.topics ?? []).filter((t) => t.chapter_id === chapterId),
    [taxonomy, chapterId],
  );
  const filterSets = useQuestionSets(courseId, subjectId, chapterId || null, topicId || null);
  const activeSet = filterSets.find((set) => set.id === setId);

  const nameById = useMemo(() => {
    const map = new Map<string, string>();
    taxonomy?.courses.forEach((c) => map.set(c.id, c.name));
    taxonomy?.subjects.forEach((s) => map.set(s.id, s.name));
    taxonomy?.chapters.forEach((c) => map.set(c.id, c.name));
    taxonomy?.topics.forEach((t) => map.set(t.id, t.name));
    return map;
  }, [taxonomy]);

  const openNew = () => {
    const course = courseId || taxonomy?.courses[0]?.id || "";
    const subject = subjectId || (taxonomy?.subjects.find((s) => s.course_id === course)?.id ?? "");
    const base = emptyDraft(course, subject);
    setDraft({
      ...base,
      chapter_id: chapterId || null,
      topic_id: topicId || null,
      question_set_id: setId || null,
    });
  };

  const openEdit = (row: QuestionRow) => {
    setDraft({
      id: row.id,
      course_id: row.course_id,
      subject_id: row.subject_id,
      chapter_id: row.chapter_id,
      topic_id: row.topic_id,
      question_set_id: row.question_set_id,
      question_number: row.question_number,
      question_text: row.question_text,
      difficulty: row.difficulty,
      question_type: row.question_type,
      exam_year: row.exam_year,
      is_pyq: row.is_pyq,
      explanation: row.explanation ?? "",
      marks: row.marks ?? 4,
      negative_marks: row.negative_marks ?? 1,
      is_active: row.is_active,
      options: [...row.question_options]
        .sort((a, b) => a.sort_order - b.sort_order)
        .map((o) => ({ label: o.label, option_text: o.option_text, is_correct: o.is_correct })),
    });
  };

  const save = async () => {
    if (!draft) return;
    setSaving(true);
    try {
      await saveAdminQuestion({ data: draft });
      toast.success(draft.id ? "Question updated" : "Question added");
      setDraft(null);
      await load();
    } catch (err) {
      toast.error(err instanceof Error ? err.message : "Could not save question.");
    } finally {
      setSaving(false);
    }
  };

  const remove = async (ids: string[]) => {
    if (!ids.length) return;
    if (!window.confirm(`Delete ${ids.length} question(s)? This cannot be undone.`)) return;
    try {
      await deleteAdminQuestions({ data: { ids } });
      toast.success("Deleted");
      await load();
    } catch (err) {
      toast.error(err instanceof Error ? err.message : "Could not delete.");
    }
  };

  if (error) return <p className="text-sm text-destructive">{error}</p>;

  const totalPages = Math.max(1, Math.ceil(total / pageSize));

  return (
    <div className="space-y-4">
      <div className="flex flex-wrap items-center gap-2">
        <h2 className="mr-auto text-lg font-semibold">
          Question database{" "}
          <span className="text-sm font-normal text-muted-foreground">({total})</span>
        </h2>
        <Button variant="outline" onClick={() => setImportOpen(true)}>
          <Upload className="size-4" /> Import
        </Button>
        <Button onClick={openNew} disabled={!taxonomy?.courses.length}>
          <Plus className="size-4" /> Add question
        </Button>
      </div>

      <div className="grid gap-2 sm:grid-cols-2 xl:grid-cols-3">
        <select
          className={selectClass}
          value={courseId}
          onChange={(event) => {
            setCourseId(event.target.value);
            setSubjectId("");
            setChapterId("");
            setTopicId("");
            setSetId("");
            setPage(1);
          }}
        >
          <option value="">All courses</option>
          {taxonomy?.courses.map((course) => (
            <option key={course.id} value={course.id}>
              {course.name}
            </option>
          ))}
        </select>
        <select
          className={selectClass}
          value={subjectId}
          onChange={(event) => {
            setSubjectId(event.target.value);
            setChapterId("");
            setTopicId("");
            setSetId("");
            setPage(1);
          }}
        >
          <option value="">All subjects</option>
          {subjectsForCourse.map((subject) => (
            <option key={subject.id} value={subject.id}>
              {subject.name}
            </option>
          ))}
        </select>
        <select
          className={selectClass}
          value={chapterId}
          disabled={!subjectId}
          onChange={(event) => {
            setChapterId(event.target.value);
            setTopicId("");
            setSetId("");
            setPage(1);
          }}
        >
          <option value="">All chapters</option>
          {chaptersForSubject.map((chapter) => (
            <option key={chapter.id} value={chapter.id}>
              {chapter.name}
            </option>
          ))}
        </select>
        <select
          className={selectClass}
          value={topicId}
          disabled={!chapterId}
          onChange={(event) => {
            setTopicId(event.target.value);
            setSetId("");
            setPage(1);
          }}
        >
          <option value="">All topics</option>
          {topicsForChapter.map((topic) => (
            <option key={topic.id} value={topic.id}>
              {topic.name}
            </option>
          ))}
        </select>
        <select
          className={selectClass}
          value={setId}
          disabled={!subjectId}
          onChange={(event) => {
            setSetId(event.target.value);
            setPage(1);
          }}
        >
          <option value="">All question sets</option>
          {filterSets.map((set) => (
            <option key={set.id} value={set.id}>
              {set.name} ({set.filled}/{set.target_count})
            </option>
          ))}
        </select>
        <Input
          placeholder="Search question text"
          value={search}
          onChange={(event) => {
            setSearch(event.target.value);
            setPage(1);
          }}
        />
      </div>

      {subjectId && filterSets.length ? (
        <div className="rounded-xl border border-border bg-card p-3">
          <p className="mb-2 text-xs uppercase tracking-wide text-muted-foreground">
            {topicId ? "Topic sets" : chapterId ? "Chapter sets" : "Subject practice modules"}
          </p>
          <div className="flex flex-wrap gap-2">
            {filterSets.map((set) => (
              <button
                key={set.id}
                type="button"
                onClick={() => {
                  setSetId(set.id === setId ? "" : set.id);
                  setPage(1);
                }}
                className={`rounded-lg border px-3 py-1.5 text-xs ${
                  set.id === setId ? "border-primary bg-primary/10" : "border-border"
                }`}
              >
                {set.name} — {set.filled} / {set.target_count} questions
              </button>
            ))}
          </div>
          {activeSet ? (
            <p className="mt-2 text-xs text-muted-foreground">
              {activeSet.name}: {activeSet.filled} / {activeSet.target_count} questions added
              {activeSet.filled >= activeSet.target_count ? " — complete" : ""}
            </p>
          ) : null}
        </div>
      ) : null}

      {selected.length ? (
        <div className="flex items-center gap-3 rounded-lg border border-border bg-card px-3 py-2 text-sm">
          <span>{selected.length} selected</span>
          <Button size="sm" variant="destructive" onClick={() => void remove(selected)}>
            <Trash2 className="size-4" /> Delete selected
          </Button>
        </div>
      ) : null}

      <div className="overflow-x-auto rounded-2xl border border-border bg-card">
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead className="w-10">
                <Checkbox
                  checked={selected.length > 0 && selected.length === rows.length}
                  onCheckedChange={(value) => setSelected(value ? rows.map((row) => row.id) : [])}
                  aria-label="Select all"
                />
              </TableHead>
              <TableHead className="min-w-64">Question</TableHead>
              <TableHead>Course</TableHead>
              <TableHead>Subject</TableHead>
              <TableHead>Chapter / Topic</TableHead>
              <TableHead>Difficulty</TableHead>
              <TableHead className="text-right">Actions</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {loading ? (
              <TableRow>
                <TableCell colSpan={7} className="py-10 text-center text-muted-foreground">
                  <Loader2 className="mx-auto size-5 animate-spin" />
                </TableCell>
              </TableRow>
            ) : rows.length === 0 ? (
              <TableRow>
                <TableCell colSpan={7} className="py-10 text-center text-muted-foreground">
                  No questions yet. Add one or import a batch.
                </TableCell>
              </TableRow>
            ) : (
              rows.map((row) => (
                <TableRow key={row.id}>
                  <TableCell>
                    <Checkbox
                      checked={selected.includes(row.id)}
                      onCheckedChange={(value) =>
                        setSelected((prev) =>
                          value ? [...prev, row.id] : prev.filter((id) => id !== row.id),
                        )
                      }
                      aria-label="Select question"
                    />
                  </TableCell>
                  <TableCell className="max-w-md">
                    <p className="line-clamp-2 text-sm">{row.question_text}</p>
                    <p className="mt-1 text-xs text-muted-foreground">
                      {row.question_type} · {row.question_options.length} options
                      {row.is_pyq ? " · PYQ" : ""}
                      {row.exam_year ? ` · ${row.exam_year}` : ""}
                      {row.is_active ? "" : " · inactive"}
                    </p>
                  </TableCell>
                  <TableCell className="text-sm">{nameById.get(row.course_id) ?? "—"}</TableCell>
                  <TableCell className="text-sm">{nameById.get(row.subject_id) ?? "—"}</TableCell>
                  <TableCell className="text-xs text-muted-foreground">
                    {row.chapter_id ? nameById.get(row.chapter_id) : "—"}
                    {row.topic_id ? ` / ${nameById.get(row.topic_id)}` : ""}
                  </TableCell>
                  <TableCell>
                    <Badge variant="secondary">{row.difficulty}</Badge>
                  </TableCell>
                  <TableCell className="text-right">
                    <Button variant="ghost" size="icon" onClick={() => openEdit(row)}>
                      <Pencil className="size-4" />
                    </Button>
                    <Button variant="ghost" size="icon" onClick={() => void remove([row.id])}>
                      <Trash2 className="size-4 text-destructive" />
                    </Button>
                  </TableCell>
                </TableRow>
              ))
            )}
          </TableBody>
        </Table>
      </div>

      <div className="flex items-center justify-between text-sm text-muted-foreground">
        <span>
          Page {page} of {totalPages}
        </span>
        <div className="flex gap-2">
          <Button
            variant="outline"
            size="sm"
            disabled={page <= 1}
            onClick={() => setPage((prev) => prev - 1)}
          >
            Previous
          </Button>
          <Button
            variant="outline"
            size="sm"
            disabled={page >= totalPages}
            onClick={() => setPage((prev) => prev + 1)}
          >
            Next
          </Button>
        </div>
      </div>

      <QuestionDialog
        draft={draft}
        setDraft={setDraft}
        taxonomy={taxonomy}
        saving={saving}
        onSave={save}
      />
      <ImportDialog
        open={importOpen}
        onOpenChange={setImportOpen}
        taxonomy={taxonomy}
        onDone={load}
      />
    </div>
  );
}

function QuestionDialog({
  draft,
  setDraft,
  taxonomy,
  saving,
  onSave,
}: {
  draft: AdminQuestionInput | null;
  setDraft: (draft: AdminQuestionInput | null) => void;
  taxonomy: Taxonomy | null;
  saving: boolean;
  onSave: () => void;
}) {
  const sets = useQuestionSets(
    draft?.course_id ?? "",
    draft?.subject_id ?? "",
    draft?.chapter_id ?? null,
    draft?.topic_id ?? null,
  );
  if (!draft) return null;
  const subjects = (taxonomy?.subjects ?? []).filter((s) => s.course_id === draft.course_id);
  const chapters = (taxonomy?.chapters ?? []).filter((c) => c.subject_id === draft.subject_id);
  const topics = (taxonomy?.topics ?? []).filter((t) => t.chapter_id === draft.chapter_id);
  const update = (patch: Partial<AdminQuestionInput>) => setDraft({ ...draft, ...patch });
  const chosenSet = sets.find((set) => set.id === draft.question_set_id);

  return (
    <Dialog open onOpenChange={(open) => (!open ? setDraft(null) : null)}>
      <DialogContent className="max-h-[90vh] overflow-y-auto sm:max-w-2xl">
        <DialogHeader>
          <DialogTitle>{draft.id ? "Edit question" : "Add question"}</DialogTitle>
          <DialogDescription>
            Pick course, subject, chapter, topic and question set — each list is filtered by the
            choice above it.
          </DialogDescription>
        </DialogHeader>

        <div className="grid gap-4">
          <div className="grid gap-3 sm:grid-cols-2">
            <div className="grid gap-1.5">
              <Label>Course</Label>
              <select
                className={selectClass}
                value={draft.course_id}
                onChange={(event) =>
                  update({
                    course_id: event.target.value,
                    subject_id: "",
                    chapter_id: null,
                    topic_id: null,
                    question_set_id: null,
                  })
                }
              >
                <option value="">Select course</option>
                {taxonomy?.courses.map((course) => (
                  <option key={course.id} value={course.id}>
                    {course.name}
                  </option>
                ))}
              </select>
            </div>
            <div className="grid gap-1.5">
              <Label>Subject</Label>
              <select
                className={selectClass}
                value={draft.subject_id}
                disabled={!draft.course_id}
                onChange={(event) =>
                  update({
                    subject_id: event.target.value,
                    chapter_id: null,
                    topic_id: null,
                    question_set_id: null,
                  })
                }
              >
                <option value="">Select subject</option>
                {subjects.map((subject) => (
                  <option key={subject.id} value={subject.id}>
                    {subject.name}
                  </option>
                ))}
              </select>
            </div>
            <div className="grid gap-1.5">
              <Label>Chapter</Label>
              <select
                className={selectClass}
                value={draft.chapter_id ?? ""}
                disabled={!draft.subject_id}
                onChange={(event) =>
                  update({
                    chapter_id: event.target.value || null,
                    topic_id: null,
                    question_set_id: null,
                  })
                }
              >
                <option value="">Select chapter</option>
                {chapters.map((chapter) => (
                  <option key={chapter.id} value={chapter.id}>
                    {chapter.name}
                  </option>
                ))}
              </select>
            </div>
            <div className="grid gap-1.5">
              <Label>Topic</Label>
              <select
                className={selectClass}
                value={draft.topic_id ?? ""}
                disabled={!draft.chapter_id}
                onChange={(event) =>
                  update({ topic_id: event.target.value || null, question_set_id: null })
                }
              >
                <option value="">Select topic</option>
                {topics.map((topic) => (
                  <option key={topic.id} value={topic.id}>
                    {topic.name}
                  </option>
                ))}
              </select>
            </div>
            <div className="grid gap-1.5">
              <Label>Question set</Label>
              <select
                className={selectClass}
                value={draft.question_set_id ?? ""}
                disabled={!draft.subject_id}
                onChange={(event) => update({ question_set_id: event.target.value || null })}
              >
                <option value="">Select question set</option>
                {sets.map((set) => (
                  <option key={set.id} value={set.id}>
                    {set.name} ({set.filled}/{set.target_count})
                  </option>
                ))}
              </select>
              {chosenSet ? (
                <p className="text-xs text-muted-foreground">
                  {chosenSet.filled} / {chosenSet.target_count} questions added
                </p>
              ) : null}
            </div>
            <div className="grid gap-1.5">
              <Label>Question number</Label>
              <Input
                type="number"
                value={draft.question_number ?? ""}
                onChange={(event) =>
                  update({
                    question_number: event.target.value ? Number(event.target.value) : null,
                  })
                }
              />
            </div>
          </div>

          <div className="grid gap-1.5">
            <Label>Question text</Label>
            <Textarea
              rows={3}
              value={draft.question_text}
              onChange={(event) => update({ question_text: event.target.value })}
            />
          </div>

          <div className="grid gap-1.5">
            <Label>Question type</Label>
            <select
              className={selectClass}
              value={draft.question_type}
              onChange={(event) => update({ question_type: event.target.value })}
            >
              {QUESTION_TYPES.map((type) => (
                <option key={type} value={type}>
                  {type}
                </option>
              ))}
            </select>
          </div>

          <div className="grid gap-2">
            <Label>
              {draft.question_type === "Numerical Answer"
                ? "Answer (add one option with the correct value)"
                : "Options (tick every correct one)"}
            </Label>
            {draft.options.map((option, index) => (
              <div key={index} className="flex items-center gap-2">
                <Checkbox
                  checked={option.is_correct}
                  onCheckedChange={(value) =>
                    update({
                      options: draft.options.map((item, i) =>
                        i === index ? { ...item, is_correct: Boolean(value) } : item,
                      ),
                    })
                  }
                  aria-label={`Option ${option.label} correct`}
                />
                <span className="w-5 text-sm font-medium">{option.label || LETTERS[index]}</span>
                <Input
                  value={option.option_text}
                  placeholder={`Option ${LETTERS[index] ?? index + 1}`}
                  onChange={(event) =>
                    update({
                      options: draft.options.map((item, i) =>
                        i === index ? { ...item, option_text: event.target.value } : item,
                      ),
                    })
                  }
                />
              </div>
            ))}
            <Button
              type="button"
              variant="outline"
              size="sm"
              className="w-fit"
              onClick={() =>
                update({
                  options: [
                    ...draft.options,
                    {
                      label: LETTERS[draft.options.length] ?? String(draft.options.length + 1),
                      option_text: "",
                      is_correct: false,
                    },
                  ],
                })
              }
            >
              <Plus className="size-4" /> Add option
            </Button>
          </div>

          <div className="grid gap-1.5">
            <Label>Explanation (optional)</Label>
            <Textarea
              rows={2}
              value={draft.explanation ?? ""}
              onChange={(event) => update({ explanation: event.target.value })}
            />
          </div>

          <div className="grid gap-3 sm:grid-cols-3">
            <div className="grid gap-1.5">
              <Label>Difficulty</Label>
              <select
                className={selectClass}
                value={draft.difficulty}
                onChange={(event) => update({ difficulty: event.target.value })}
              >
                {DIFFICULTIES.map((level) => (
                  <option key={level} value={level}>
                    {level}
                  </option>
                ))}
              </select>
            </div>
            <div className="grid gap-1.5">
              <Label>Marks</Label>
              <Input
                type="number"
                step="0.5"
                value={draft.marks ?? 4}
                onChange={(event) => update({ marks: Number(event.target.value) })}
              />
            </div>
            <div className="grid gap-1.5">
              <Label>Negative marks</Label>
              <Input
                type="number"
                step="0.5"
                value={draft.negative_marks ?? 1}
                onChange={(event) => update({ negative_marks: Number(event.target.value) })}
              />
            </div>
            <div className="grid gap-1.5">
              <Label>Exam year</Label>
              <Input
                type="number"
                value={draft.exam_year ?? ""}
                onChange={(event) =>
                  update({ exam_year: event.target.value ? Number(event.target.value) : null })
                }
              />
            </div>
            <div className="flex items-end gap-2 pb-2">
              <Checkbox
                id="is-pyq"
                checked={draft.is_pyq}
                onCheckedChange={(value) => update({ is_pyq: Boolean(value) })}
              />
              <Label htmlFor="is-pyq">Previous year question</Label>
            </div>
            <div className="flex items-end gap-2 pb-2">
              <Checkbox
                id="is-active"
                checked={draft.is_active ?? true}
                onCheckedChange={(value) => update({ is_active: Boolean(value) })}
              />
              <Label htmlFor="is-active">Active</Label>
            </div>
          </div>
        </div>

        <DialogFooter>
          <Button variant="outline" onClick={() => setDraft(null)}>
            Cancel
          </Button>
          <Button
            onClick={onSave}
            disabled={
              saving || !draft.course_id || !draft.subject_id || !draft.question_text.trim()
            }
          >
            {saving ? <Loader2 className="size-4 animate-spin" /> : null} Save question
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}

const SAMPLE_CSV =
  "course,subject,chapter,topic,set,question,optionA,optionB,optionC,optionD,correct,explanation,difficulty,question_type,marks,negative_marks,exam_year,is_pyq";

function ImportDialog({
  open,
  onOpenChange,
  taxonomy,
  onDone,
}: {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  taxonomy: Taxonomy | null;
  onDone: () => Promise<void>;
}) {
  const [courseId, setCourseId] = useState("");
  const [subjectId, setSubjectId] = useState("");
  const [chapterId, setChapterId] = useState("");
  const [topicId, setTopicId] = useState("");
  const [setId, setSetId] = useState("");
  const [text, setText] = useState("");
  const [busy, setBusy] = useState(false);
  const subjects = (taxonomy?.subjects ?? []).filter((s) => s.course_id === courseId);
  const chapters = (taxonomy?.chapters ?? []).filter((c) => c.subject_id === subjectId);
  const topics = (taxonomy?.topics ?? []).filter((t) => t.chapter_id === chapterId);
  const sets = useQuestionSets(courseId, subjectId, chapterId || null, topicId || null);

  const buildQuestions = async (): Promise<AdminQuestionInput[]> => {
    const trimmed = text.trim();
    if (!trimmed) return [];
    const fallback = {
      course_id: courseId,
      subject_id: subjectId,
      chapter_id: chapterId || null,
      topic_id: topicId || null,
      question_set_id: setId || null,
    };

    if (trimmed.startsWith("[")) {
      const parsed = JSON.parse(trimmed) as any[];
      return parsed.map((item) => ({
        ...fallback,
        question_text: String(item.question ?? item.question_text ?? ""),
        difficulty: String(item.difficulty ?? "Medium"),
        question_type: String(item.question_type ?? "Single Correct MCQ"),
        exam_year: item.exam_year ? Number(item.exam_year) : null,
        is_pyq: Boolean(item.is_pyq),
        explanation: item.explanation ? String(item.explanation) : null,
        marks: item.marks ? Number(item.marks) : 4,
        negative_marks: item.negative_marks ? Number(item.negative_marks) : 1,
        question_number: item.question_number ? Number(item.question_number) : null,
        options: (item.options ?? []).map((option: any, index: number) => ({
          label: String(option.label ?? LETTERS[index] ?? index + 1),
          option_text: String(option.option_text ?? option.text ?? option),
          is_correct:
            typeof option === "object"
              ? Boolean(option.is_correct)
              : String(item.correct ?? "").toUpperCase() === (LETTERS[index] ?? ""),
        })),
      }));
    }

    const rows = parseCsv(trimmed);
    const header = rows[0] ?? [];
    const body = rows.slice(1);
    const index = (name: string) => header.findIndex((cell) => cell.trim().toLowerCase() === name);
    const cell = (row: string[], name: string) => (row[index(name)] ?? "").trim();

    // Rows may name their own course/subject/chapter/topic; resolve those to ids.
    const named = body.map((row) => ({
      course: cell(row, "course"),
      subject: cell(row, "subject"),
      chapter: cell(row, "chapter"),
      topic: cell(row, "topic"),
      set: cell(row, "set"),
    }));
    const hasNames = named.some((row) => row.course && row.subject);
    const resolved = hasNames
      ? ((await resolveImportTaxonomy({ data: { rows: named } })) as {
          course_id: string | null;
          subject_id: string | null;
          chapter_id: string | null;
          topic_id: string | null;
        }[])
      : [];

    return body.map((row, i) => {
      const correct = cell(row, "correct").toUpperCase();
      const options = LETTERS.map((letter) => ({
        label: letter,
        option_text: cell(row, `option${letter.toLowerCase()}`),
        is_correct: correct.split(/[,\s]+/).includes(letter),
      })).filter((option) => option.option_text);
      const year = cell(row, "exam_year");
      const marks = cell(row, "marks");
      const negative = cell(row, "negative_marks");
      const match = resolved[i];
      return {
        course_id: match?.course_id ?? fallback.course_id,
        subject_id: match?.subject_id ?? fallback.subject_id,
        chapter_id: match?.chapter_id ?? fallback.chapter_id,
        topic_id: match?.topic_id ?? fallback.topic_id,
        question_set_id: fallback.question_set_id,
        question_number: null,
        question_text: cell(row, "question"),
        difficulty: cell(row, "difficulty") || "Medium",
        question_type: cell(row, "question_type") || "Single Correct MCQ",
        exam_year: year ? Number(year) : null,
        is_pyq: cell(row, "is_pyq").toLowerCase() === "true",
        explanation: cell(row, "explanation") || null,
        marks: marks ? Number(marks) : 4,
        negative_marks: negative ? Number(negative) : 1,
        is_active: true,
        options,
      };
    });
  };

  const runImport = async () => {
    setBusy(true);
    try {
      const questions = await buildQuestions();
      if (!questions.length) throw new Error("Nothing to import.");
      const result = await importAdminQuestions({ data: { questions } });
      toast.success(`Imported ${result.imported} question(s)`);
      if (result.errors.length) toast.error(result.errors[0]!);
      setText("");
      onOpenChange(false);
      await onDone();
    } catch (err) {
      toast.error(err instanceof Error ? err.message : "Import failed.");
    } finally {
      setBusy(false);
    }
  };

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="max-h-[90vh] overflow-y-auto sm:max-w-2xl">
        <DialogHeader>
          <DialogTitle>Import questions</DialogTitle>
          <DialogDescription>
            Upload a CSV file or paste CSV / JSON below. Rows can name their own course, subject,
            chapter and topic; anything missing falls back to the selection here.
          </DialogDescription>
        </DialogHeader>

        <div className="grid gap-3 sm:grid-cols-2">
          <select
            className={selectClass}
            value={courseId}
            onChange={(event) => {
              setCourseId(event.target.value);
              setSubjectId("");
              setChapterId("");
              setTopicId("");
              setSetId("");
            }}
          >
            <option value="">Select course</option>
            {taxonomy?.courses.map((course) => (
              <option key={course.id} value={course.id}>
                {course.name}
              </option>
            ))}
          </select>
          <select
            className={selectClass}
            value={subjectId}
            disabled={!courseId}
            onChange={(event) => {
              setSubjectId(event.target.value);
              setChapterId("");
              setTopicId("");
              setSetId("");
            }}
          >
            <option value="">Select subject</option>
            {subjects.map((subject) => (
              <option key={subject.id} value={subject.id}>
                {subject.name}
              </option>
            ))}
          </select>
          <select
            className={selectClass}
            value={chapterId}
            disabled={!subjectId}
            onChange={(event) => {
              setChapterId(event.target.value);
              setTopicId("");
              setSetId("");
            }}
          >
            <option value="">Select chapter</option>
            {chapters.map((chapter) => (
              <option key={chapter.id} value={chapter.id}>
                {chapter.name}
              </option>
            ))}
          </select>
          <select
            className={selectClass}
            value={topicId}
            disabled={!chapterId}
            onChange={(event) => {
              setTopicId(event.target.value);
              setSetId("");
            }}
          >
            <option value="">Select topic</option>
            {topics.map((topic) => (
              <option key={topic.id} value={topic.id}>
                {topic.name}
              </option>
            ))}
          </select>
          <select
            className={`${selectClass} sm:col-span-2`}
            value={setId}
            disabled={!subjectId}
            onChange={(event) => setSetId(event.target.value)}
          >
            <option value="">Question set (optional)</option>
            {sets.map((set) => (
              <option key={set.id} value={set.id}>
                {set.name} ({set.filled}/{set.target_count})
              </option>
            ))}
          </select>
        </div>

        <div className="grid gap-2">
          <Label htmlFor="import-file">CSV or JSON file</Label>
          <Input
            id="import-file"
            type="file"
            accept=".csv,.json,text/csv,application/json"
            onChange={async (event) => {
              const file = event.target.files?.[0];
              if (file) setText(await file.text());
            }}
          />
          <Label htmlFor="import-text">or paste data</Label>
          <Textarea
            id="import-text"
            rows={8}
            value={text}
            placeholder={SAMPLE_CSV}
            onChange={(event) => setText(event.target.value)}
          />
          <p className="text-xs text-muted-foreground">Columns: {SAMPLE_CSV}</p>
        </div>

        <DialogFooter>
          <Button variant="outline" onClick={() => onOpenChange(false)}>
            Cancel
          </Button>
          <Button onClick={runImport} disabled={busy || !text.trim() || (!courseId && !text.includes("course"))}>
            {busy ? <Loader2 className="size-4 animate-spin" /> : null} Import
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}

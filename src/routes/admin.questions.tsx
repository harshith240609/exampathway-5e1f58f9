import { createFileRoute } from "@tanstack/react-router";
import { useCallback, useEffect, useMemo, useState } from "react";
import { Loader2, Pencil, Plus, Trash2, Upload } from "lucide-react";
import { toast } from "sonner";
import {
  deleteAdminQuestions,
  getAdminTaxonomy,
  importAdminQuestions,
  listAdminQuestions,
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
        content: "Add, edit, delete and bulk import exam questions in the ExamPathway question bank.",
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

const emptyDraft = (courseId: string, subjectId: string): AdminQuestionInput => ({
  course_id: courseId,
  subject_id: subjectId,
  chapter_id: null,
  topic_id: null,
  question_text: "",
  difficulty: "Medium",
  question_type: "MCQ",
  exam_year: null,
  is_pyq: false,
  explanation: "",
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

function AdminQuestions() {
  const [taxonomy, setTaxonomy] = useState<Taxonomy | null>(null);
  const [rows, setRows] = useState<QuestionRow[]>([]);
  const [total, setTotal] = useState(0);
  const [page, setPage] = useState(1);
  const [courseId, setCourseId] = useState("");
  const [subjectId, setSubjectId] = useState("");
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
        data: { courseId: courseId || null, subjectId: subjectId || null, search, page, pageSize },
      });
      setRows(result.rows as unknown as QuestionRow[]);
      setTotal(result.total);
      setSelected([]);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Could not load questions.");
    } finally {
      setLoading(false);
    }
  }, [courseId, subjectId, search, page]);

  useEffect(() => {
    void load();
  }, [load]);

  const subjectsForCourse = useMemo(
    () => (taxonomy?.subjects ?? []).filter((s) => !courseId || s.course_id === courseId),
    [taxonomy, courseId],
  );
  const nameById = useMemo(() => {
    const map = new Map<string, string>();
    taxonomy?.courses.forEach((c) => map.set(c.id, c.name));
    taxonomy?.subjects.forEach((s) => map.set(s.id, s.name));
    taxonomy?.chapters.forEach((c) => map.set(c.id, c.name));
    return map;
  }, [taxonomy]);

  const openNew = () => {
    const course = courseId || taxonomy?.courses[0]?.id || "";
    const subject =
      subjectId || (taxonomy?.subjects.find((s) => s.course_id === course)?.id ?? "");
    setDraft(emptyDraft(course, subject));
  };

  const openEdit = (row: QuestionRow) => {
    setDraft({
      id: row.id,
      course_id: row.course_id,
      subject_id: row.subject_id,
      chapter_id: row.chapter_id,
      topic_id: row.topic_id,
      question_text: row.question_text,
      difficulty: row.difficulty,
      question_type: row.question_type,
      exam_year: row.exam_year,
      is_pyq: row.is_pyq,
      explanation: row.explanation ?? "",
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

      <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-4">
        <select
          className="h-10 rounded-md border border-input bg-background px-3 text-sm"
          value={courseId}
          onChange={(event) => {
            setCourseId(event.target.value);
            setSubjectId("");
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
          className="h-10 rounded-md border border-input bg-background px-3 text-sm"
          value={subjectId}
          onChange={(event) => {
            setSubjectId(event.target.value);
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
        <Input
          placeholder="Search question text"
          value={search}
          onChange={(event) => {
            setSearch(event.target.value);
            setPage(1);
          }}
          className="lg:col-span-2"
        />
      </div>

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
                  onCheckedChange={(value) =>
                    setSelected(value ? rows.map((row) => row.id) : [])
                  }
                  aria-label="Select all"
                />
              </TableHead>
              <TableHead className="min-w-64">Question</TableHead>
              <TableHead>Course</TableHead>
              <TableHead>Subject</TableHead>
              <TableHead>Difficulty</TableHead>
              <TableHead className="text-right">Actions</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {loading ? (
              <TableRow>
                <TableCell colSpan={6} className="py-10 text-center text-muted-foreground">
                  <Loader2 className="mx-auto size-5 animate-spin" />
                </TableCell>
              </TableRow>
            ) : rows.length === 0 ? (
              <TableRow>
                <TableCell colSpan={6} className="py-10 text-center text-muted-foreground">
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
                      {row.question_options.length} options
                      {row.is_pyq ? " · PYQ" : ""}
                      {row.exam_year ? ` · ${row.exam_year}` : ""}
                    </p>
                  </TableCell>
                  <TableCell className="text-sm">{nameById.get(row.course_id) ?? "—"}</TableCell>
                  <TableCell className="text-sm">{nameById.get(row.subject_id) ?? "—"}</TableCell>
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
  if (!draft) return null;
  const subjects = (taxonomy?.subjects ?? []).filter((s) => s.course_id === draft.course_id);
  const chapters = (taxonomy?.chapters ?? []).filter((c) => c.subject_id === draft.subject_id);
  const topics = (taxonomy?.topics ?? []).filter((t) => t.chapter_id === draft.chapter_id);
  const update = (patch: Partial<AdminQuestionInput>) => setDraft({ ...draft, ...patch });

  return (
    <Dialog open onOpenChange={(open) => (!open ? setDraft(null) : null)}>
      <DialogContent className="max-h-[90vh] overflow-y-auto sm:max-w-2xl">
        <DialogHeader>
          <DialogTitle>{draft.id ? "Edit question" : "Add question"}</DialogTitle>
          <DialogDescription>
            Questions are stored in the live question bank immediately after saving.
          </DialogDescription>
        </DialogHeader>

        <div className="grid gap-4">
          <div className="grid gap-3 sm:grid-cols-2">
            <div className="grid gap-1.5">
              <Label>Course</Label>
              <select
                className="h-10 rounded-md border border-input bg-background px-3 text-sm"
                value={draft.course_id}
                onChange={(event) =>
                  update({ course_id: event.target.value, subject_id: "", chapter_id: null, topic_id: null })
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
                className="h-10 rounded-md border border-input bg-background px-3 text-sm"
                value={draft.subject_id}
                onChange={(event) =>
                  update({ subject_id: event.target.value, chapter_id: null, topic_id: null })
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
              <Label>Chapter (optional)</Label>
              <select
                className="h-10 rounded-md border border-input bg-background px-3 text-sm"
                value={draft.chapter_id ?? ""}
                onChange={(event) =>
                  update({ chapter_id: event.target.value || null, topic_id: null })
                }
              >
                <option value="">None</option>
                {chapters.map((chapter) => (
                  <option key={chapter.id} value={chapter.id}>
                    {chapter.name}
                  </option>
                ))}
              </select>
            </div>
            <div className="grid gap-1.5">
              <Label>Topic (optional)</Label>
              <select
                className="h-10 rounded-md border border-input bg-background px-3 text-sm"
                value={draft.topic_id ?? ""}
                onChange={(event) => update({ topic_id: event.target.value || null })}
              >
                <option value="">None</option>
                {topics.map((topic) => (
                  <option key={topic.id} value={topic.id}>
                    {topic.name}
                  </option>
                ))}
              </select>
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

          <div className="grid gap-2">
            <Label>Options (tick the correct one)</Label>
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

          <div className="grid gap-3 sm:grid-cols-3">
            <div className="grid gap-1.5">
              <Label>Difficulty</Label>
              <select
                className="h-10 rounded-md border border-input bg-background px-3 text-sm"
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
          </div>

          <div className="grid gap-1.5">
            <Label>Explanation (optional)</Label>
            <Textarea
              rows={2}
              value={draft.explanation ?? ""}
              onChange={(event) => update({ explanation: event.target.value })}
            />
          </div>
        </div>

        <DialogFooter>
          <Button variant="outline" onClick={() => setDraft(null)}>
            Cancel
          </Button>
          <Button
            onClick={onSave}
            disabled={saving || !draft.course_id || !draft.subject_id || !draft.question_text.trim()}
          >
            {saving ? <Loader2 className="size-4 animate-spin" /> : null} Save question
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}

const SAMPLE_CSV =
  "question,optionA,optionB,optionC,optionD,correct,difficulty,explanation,exam_year,is_pyq\n" +
  "What is 2+2?,2,3,4,5,C,Easy,Simple addition,2024,true";

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
  const [text, setText] = useState("");
  const [busy, setBusy] = useState(false);
  const subjects = (taxonomy?.subjects ?? []).filter((s) => s.course_id === courseId);
  const chapters = (taxonomy?.chapters ?? []).filter((c) => c.subject_id === subjectId);

  const buildQuestions = (): AdminQuestionInput[] => {
    const trimmed = text.trim();
    if (!trimmed) return [];
    if (trimmed.startsWith("[")) {
      const parsed = JSON.parse(trimmed) as any[];
      return parsed.map((item) => ({
        course_id: courseId,
        subject_id: subjectId,
        chapter_id: chapterId || null,
        topic_id: null,
        question_text: String(item.question ?? item.question_text ?? ""),
        difficulty: String(item.difficulty ?? "Medium"),
        question_type: String(item.question_type ?? "MCQ"),
        exam_year: item.exam_year ? Number(item.exam_year) : null,
        is_pyq: Boolean(item.is_pyq),
        explanation: item.explanation ? String(item.explanation) : null,
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
    const index = (name: string) =>
      header.findIndex((cell) => cell.trim().toLowerCase() === name);

    const qi = index("question");
    return body.map((row) => {
      const correct = (row[index("correct")] ?? "").trim().toUpperCase();
      const options = LETTERS.map((letter) => ({
        label: letter,
        option_text: (row[index(`option${letter.toLowerCase()}`)] ?? "").trim(),
        is_correct: correct === letter,
      })).filter((option) => option.option_text);
      const year = (row[index("exam_year")] ?? "").trim();
      return {
        course_id: courseId,
        subject_id: subjectId,
        chapter_id: chapterId || null,
        topic_id: null,
        question_text: (row[qi] ?? "").trim(),
        difficulty: (row[index("difficulty")] ?? "Medium").trim() || "Medium",
        question_type: "MCQ",
        exam_year: year ? Number(year) : null,
        is_pyq: (row[index("is_pyq")] ?? "").trim().toLowerCase() === "true",
        explanation: (row[index("explanation")] ?? "").trim() || null,
        options,
      };
    });
  };

  const runImport = async () => {
    setBusy(true);
    try {
      const questions = buildQuestions();
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
            Upload a CSV file or paste CSV / JSON below. Every imported question is filed under the
            course and subject you pick here.
          </DialogDescription>
        </DialogHeader>

        <div className="grid gap-3 sm:grid-cols-3">
          <select
            className="h-10 rounded-md border border-input bg-background px-3 text-sm"
            value={courseId}
            onChange={(event) => {
              setCourseId(event.target.value);
              setSubjectId("");
              setChapterId("");
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
            className="h-10 rounded-md border border-input bg-background px-3 text-sm"
            value={subjectId}
            onChange={(event) => {
              setSubjectId(event.target.value);
              setChapterId("");
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
            className="h-10 rounded-md border border-input bg-background px-3 text-sm"
            value={chapterId}
            onChange={(event) => setChapterId(event.target.value)}
          >
            <option value="">Chapter (optional)</option>
            {chapters.map((chapter) => (
              <option key={chapter.id} value={chapter.id}>
                {chapter.name}
              </option>
            ))}
          </select>
        </div>

        <div className="grid gap-1.5">
          <Label htmlFor="import-file">CSV file</Label>
          <Input
            id="import-file"
            type="file"
            accept=".csv,.json,text/csv,application/json"
            onChange={async (event) => {
              const file = event.target.files?.[0];
              if (file) setText(await file.text());
            }}
          />
        </div>

        <div className="grid gap-1.5">
          <Label htmlFor="import-text">Or paste data</Label>
          <Textarea
            id="import-text"
            rows={8}
            className="font-mono text-xs"
            placeholder={SAMPLE_CSV}
            value={text}
            onChange={(event) => setText(event.target.value)}
          />
          <p className="text-xs text-muted-foreground">
            CSV header: question, optionA, optionB, optionC, optionD, correct, difficulty,
            explanation, exam_year, is_pyq. JSON: an array of objects with question, options and
            correct.
          </p>
        </div>

        <DialogFooter>
          <Button variant="outline" onClick={() => onOpenChange(false)}>
            Cancel
          </Button>
          <Button onClick={runImport} disabled={busy || !courseId || !subjectId || !text.trim()}>
            {busy ? <Loader2 className="size-4 animate-spin" /> : <Upload className="size-4" />}{" "}
            Import
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}

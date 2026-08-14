import { createServerFn } from "@tanstack/react-start";
import { requireSupabaseAuth } from "@/integrations/supabase/auth-middleware";
import { OPTION_LETTERS as LETTERS, assertAdmin } from "./admin-helpers.server";

export interface AdminOption {
  label: string;
  option_text: string;
  is_correct: boolean;
}

export interface AdminQuestionInput {
  id?: string;
  course_id: string;
  subject_id: string;
  chapter_id?: string | null;
  topic_id?: string | null;
  question_set_id?: string | null;
  question_number?: number | null;
  question_text: string;
  difficulty: string;
  question_type: string;
  exam_year?: number | null;
  is_pyq: boolean;
  explanation?: string | null;
  marks?: number | null;
  negative_marks?: number | null;
  is_active?: boolean;
  options: AdminOption[];
}

export const QUESTION_TYPES = [
  "Single Correct MCQ",
  "Multiple Correct",
  "Numerical Answer",
  "Match the Following",
  "Assertion and Reason",
];

/**
 * Validates that a question's taxonomy actually belongs together:
 * chapter -> subject, topic -> chapter, set -> the same node.
 */
async function assertValidHierarchy(supabase: any, input: AdminQuestionInput) {
  const { data: subject } = await supabase
    .from("subjects")
    .select("id, course_id")
    .eq("id", input.subject_id)
    .maybeSingle();
  if (!subject || subject.course_id !== input.course_id) {
    throw new Error("The selected subject does not belong to the selected course.");
  }
  if (input.chapter_id) {
    const { data: chapter } = await supabase
      .from("chapters")
      .select("id, subject_id")
      .eq("id", input.chapter_id)
      .maybeSingle();
    if (!chapter || chapter.subject_id !== input.subject_id) {
      throw new Error("The selected chapter does not belong to the selected subject.");
    }
  }
  if (input.topic_id) {
    if (!input.chapter_id) throw new Error("Pick a chapter before picking a topic.");
    const { data: topic } = await supabase
      .from("topics")
      .select("id, chapter_id")
      .eq("id", input.topic_id)
      .maybeSingle();
    if (!topic || topic.chapter_id !== input.chapter_id) {
      throw new Error("The selected topic does not belong to the selected chapter.");
    }
  }
  if (input.question_set_id) {
    const { data: set } = await supabase
      .from("question_sets")
      .select("id, course_id, subject_id, chapter_id, topic_id")
      .eq("id", input.question_set_id)
      .maybeSingle();
    if (
      !set ||
      set.course_id !== input.course_id ||
      set.subject_id !== input.subject_id ||
      (set.chapter_id && set.chapter_id !== input.chapter_id) ||
      (set.topic_id && set.topic_id !== input.topic_id)
    ) {
      throw new Error("The selected question set does not match the selected chapter/topic.");
    }
  }
}

/** Courses -> subjects -> chapters -> topics for the admin pickers. */
export const getAdminTaxonomy = createServerFn({ method: "GET" })
  .middleware([requireSupabaseAuth])
  .handler(async ({ context }) => {
    await assertAdmin(context);
    const { supabase } = context;
    const [{ data: courses }, { data: subjects }, { data: chapters }, { data: topics }] =
      await Promise.all([
        supabase.from("courses").select("id, name, slug").order("sort_order"),
        supabase.from("subjects").select("id, name, course_id").order("sort_order").limit(500),
        supabase.from("chapters").select("id, name, subject_id").order("sort_order").limit(5000),
        supabase.from("topics").select("id, name, chapter_id").order("sort_order").limit(10000),
      ]);
    return {
      courses: courses ?? [],
      subjects: subjects ?? [],
      chapters: chapters ?? [],
      topics: topics ?? [],
    };
  });

/** Question sets for a specific node of the hierarchy, with live fill counts. */
export const listQuestionSets = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator(
    (input: {
      courseId: string;
      subjectId?: string | null;
      chapterId?: string | null;
      topicId?: string | null;
    }) => input,
  )
  .handler(async ({ data, context }) => {
    await assertAdmin(context);
    const { supabase } = context;
    let query = supabase
      .from("question_sets")
      .select("id, name, kind, target_count, chapter_id, topic_id, subject_id, sort_order")
      .eq("course_id", data.courseId)
      .order("kind")
      .order("sort_order")
      .limit(200);
    if (data.subjectId) query = query.eq("subject_id", data.subjectId);
    if (data.topicId) query = query.eq("topic_id", data.topicId);
    else if (data.chapterId) query = query.eq("chapter_id", data.chapterId).is("topic_id", null);
    else query = query.is("chapter_id", null).is("topic_id", null);

    const { data: sets, error } = await query;
    if (error) throw new Error(error.message);

    const withCounts = await Promise.all(
      (sets ?? []).map(async (set) => {
        const { count } = await supabase
          .from("questions")
          .select("id", { count: "exact", head: true })
          .eq("question_set_id", set.id);
        return { ...set, filled: count ?? 0 };
      }),
    );
    return withCounts;
  });

export const listAdminQuestions = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator(
    (input: {
      courseId?: string | null;
      subjectId?: string | null;
      chapterId?: string | null;
      topicId?: string | null;
      setId?: string | null;
      search?: string | null;
      page?: number;
      pageSize?: number;
    }) => ({
      courseId: input.courseId ?? null,
      subjectId: input.subjectId ?? null,
      chapterId: input.chapterId ?? null,
      topicId: input.topicId ?? null,
      setId: input.setId ?? null,
      search: (input.search ?? "").trim().slice(0, 120),
      page: Math.max(1, input.page ?? 1),
      pageSize: Math.min(100, Math.max(5, input.pageSize ?? 20)),
    }),
  )
  .handler(async ({ data, context }) => {
    await assertAdmin(context);
    const from = (data.page - 1) * data.pageSize;
    let query = context.supabase
      .from("questions")
      .select(
        "id, question_text, difficulty, question_type, exam_year, is_pyq, explanation, course_id, subject_id, chapter_id, topic_id, question_set_id, question_number, marks, negative_marks, is_active, created_at, question_options(id, label, option_text, is_correct, sort_order)",
        { count: "exact" },
      )
      .order("created_at", { ascending: false })
      .range(from, from + data.pageSize - 1);

    if (data.courseId) query = query.eq("course_id", data.courseId);
    if (data.subjectId) query = query.eq("subject_id", data.subjectId);
    if (data.chapterId) query = query.eq("chapter_id", data.chapterId);
    if (data.topicId) query = query.eq("topic_id", data.topicId);
    if (data.setId) query = query.eq("question_set_id", data.setId);
    if (data.search) query = query.ilike("question_text", `%${data.search}%`);

    const { data: rows, count, error } = await query;
    if (error) throw new Error(error.message);
    return { rows: rows ?? [], total: count ?? 0, page: data.page, pageSize: data.pageSize };
  });

export const saveAdminQuestion = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((input: AdminQuestionInput) => input)
  .handler(async ({ data, context }) => {
    await assertAdmin(context);
    const { supabase } = context;
    if (!data.question_text?.trim()) throw new Error("Question text is required.");
    if (!data.course_id || !data.subject_id) throw new Error("Course and subject are required.");
    await assertValidHierarchy(supabase, data);

    const payload = {
      course_id: data.course_id,
      subject_id: data.subject_id,
      chapter_id: data.chapter_id || null,
      topic_id: data.topic_id || null,
      question_set_id: data.question_set_id || null,
      question_number: data.question_number ?? null,
      question_text: data.question_text.trim(),
      difficulty: data.difficulty,
      question_type: data.question_type,
      exam_year: data.exam_year ?? null,
      is_pyq: data.is_pyq,
      explanation: data.explanation?.trim() || null,
      marks: data.marks ?? 4,
      negative_marks: data.negative_marks ?? 1,
      is_active: data.is_active ?? true,
    };

    let questionId = data.id;
    if (questionId) {
      const { error } = await supabase.from("questions").update(payload).eq("id", questionId);
      if (error) throw new Error(error.message);
      await supabase.from("question_options").delete().eq("question_id", questionId);
    } else {
      const { data: inserted, error } = await supabase
        .from("questions")
        .insert(payload)
        .select("id")
        .single();
      if (error) throw new Error(error.message);
      questionId = inserted.id as string;
    }

    const options = data.options
      .filter((option) => option.option_text.trim())
      .map((option, index) => ({
        question_id: questionId!,
        label: option.label || LETTERS[index] || String(index + 1),
        option_text: option.option_text.trim(),
        is_correct: option.is_correct,
        sort_order: index,
      }));
    if (options.length) {
      const { error } = await supabase.from("question_options").insert(options);
      if (error) throw new Error(error.message);
    }
    return { id: questionId };
  });

export const deleteAdminQuestions = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((input: { ids: string[] }) => ({ ids: input.ids.filter(Boolean) }))
  .handler(async ({ data, context }) => {
    await assertAdmin(context);
    if (!data.ids.length) return { deleted: 0 };
    await context.supabase.from("question_options").delete().in("question_id", data.ids);
    await context.supabase.from("mock_test_questions").delete().in("question_id", data.ids);
    const { error } = await context.supabase.from("questions").delete().in("id", data.ids);
    if (error) throw new Error(error.message);
    return { deleted: data.ids.length };
  });

export const importAdminQuestions = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((input: { questions: AdminQuestionInput[] }) => input)
  .handler(async ({ data, context }) => {
    await assertAdmin(context);
    const { supabase } = context;
    let imported = 0;
    const errors: string[] = [];

    for (const [index, question] of data.questions.entries()) {
      if (!question.question_text?.trim()) {
        errors.push(`Row ${index + 1}: missing question text`);
        continue;
      }
      try {
        await assertValidHierarchy(supabase, question);
      } catch (err) {
        errors.push(`Row ${index + 1}: ${err instanceof Error ? err.message : "invalid taxonomy"}`);
        continue;
      }
      const { data: inserted, error } = await supabase
        .from("questions")
        .insert({
          course_id: question.course_id,
          subject_id: question.subject_id,
          chapter_id: question.chapter_id || null,
          topic_id: question.topic_id || null,
          question_set_id: question.question_set_id || null,
          question_number: question.question_number ?? null,
          question_text: question.question_text.trim(),
          difficulty: question.difficulty || "Medium",
          question_type: question.question_type || "Single Correct MCQ",
          exam_year: question.exam_year ?? null,
          is_pyq: Boolean(question.is_pyq),
          explanation: question.explanation?.trim() || null,
          marks: question.marks ?? 4,
          negative_marks: question.negative_marks ?? 1,
          is_active: question.is_active ?? true,
        })
        .select("id")
        .single();
      if (error) {
        errors.push(`Row ${index + 1}: ${error.message}`);
        continue;
      }
      const options = (question.options ?? [])
        .filter((option) => option.option_text?.trim())
        .map((option, i) => ({
          question_id: inserted.id as string,
          label: option.label || LETTERS[i] || String(i + 1),
          option_text: option.option_text.trim(),
          is_correct: Boolean(option.is_correct),
          sort_order: i,
        }));
      if (options.length) await supabase.from("question_options").insert(options);
      imported += 1;
    }
    return { imported, errors: errors.slice(0, 20) };
  });

/** Resolve names (course/subject/chapter/topic/set) to ids for bulk imports. */
export const resolveImportTaxonomy = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator(
    (input: { rows: { course: string; subject: string; chapter?: string; topic?: string; set?: string }[] }) =>
      input,
  )
  .handler(async ({ data, context }) => {
    await assertAdmin(context);
    const { supabase } = context;
    const [{ data: courses }, { data: subjects }, { data: chapters }, { data: topics }] =
      await Promise.all([
        supabase.from("courses").select("id, name, slug"),
        supabase.from("subjects").select("id, name, course_id").limit(500),
        supabase.from("chapters").select("id, name, subject_id").limit(5000),
        supabase.from("topics").select("id, name, chapter_id").limit(10000),
      ]);
    const norm = (value?: string) => (value ?? "").trim().toLowerCase();

    return data.rows.map((row) => {
      const course = (courses ?? []).find(
        (item) => norm(item.name) === norm(row.course) || norm(item.slug) === norm(row.course),
      );
      const subject = course
        ? (subjects ?? []).find(
            (item) => item.course_id === course.id && norm(item.name) === norm(row.subject),
          )
        : undefined;
      const chapter =
        subject && row.chapter
          ? (chapters ?? []).find(
              (item) => item.subject_id === subject.id && norm(item.name) === norm(row.chapter),
            )
          : undefined;
      const topic =
        chapter && row.topic
          ? (topics ?? []).find(
              (item) => item.chapter_id === chapter.id && norm(item.name) === norm(row.topic),
            )
          : undefined;
      return {
        course_id: course?.id ?? null,
        subject_id: subject?.id ?? null,
        chapter_id: chapter?.id ?? null,
        topic_id: topic?.id ?? null,
      };
    });
  });

/** Real content counters for the admin dashboard. */
export const getAdminContentStats = createServerFn({ method: "GET" })
  .middleware([requireSupabaseAuth])
  .handler(async ({ context }) => {
    await assertAdmin(context);
    const { supabaseAdmin } = await import("@/integrations/supabase/client.server");

    const { data, error } = await supabaseAdmin.rpc("exec_admin_stats" as never).then(
      (res) => res,
      () => ({ data: null, error: null }) as any,
    );
    if (data && !error) return data as unknown as AdminContentStats;

    // Fallback: compute with plain queries.
    const [{ data: courses }, { data: subjects }, { data: sets }] = await Promise.all([
      supabaseAdmin.from("courses").select("id, name").order("sort_order"),
      supabaseAdmin.from("subjects").select("id, name, course_id").limit(500),
      supabaseAdmin
        .from("question_sets")
        .select("id, name, kind, target_count, course_id, subject_id, chapter_id, topic_id")
        .limit(10000),
    ]);
    const { data: questions } = await supabaseAdmin
      .from("questions")
      .select("id, course_id, subject_id, chapter_id, topic_id, question_set_id")
      .limit(100000);

    const perSet = new Map<string, number>();
    for (const question of questions ?? []) {
      if (question.question_set_id)
        perSet.set(question.question_set_id, (perSet.get(question.question_set_id) ?? 0) + 1);
    }
    const complete = (sets ?? []).filter(
      (set) => (perSet.get(set.id) ?? 0) >= set.target_count,
    ).length;

    const byCourse = (courses ?? []).map((course) => ({
      id: course.id,
      name: course.name,
      questions: (questions ?? []).filter((q) => q.course_id === course.id).length,
      subjects: (subjects ?? [])
        .filter((subject) => subject.course_id === course.id)
        .map((subject) => ({
          id: subject.id,
          name: subject.name,
          questions: (questions ?? []).filter((q) => q.subject_id === subject.id).length,
        })),
    }));

    const { count: mockTests } = await supabaseAdmin
      .from("mock_tests")
      .select("id", { count: "exact", head: true });
    const { count: attempts } = await supabaseAdmin
      .from("mock_test_attempts")
      .select("id", { count: "exact", head: true })
      .not("submitted_at", "is", null);

    return {
      totalQuestions: (questions ?? []).length,
      totalSets: (sets ?? []).length,
      completeSets: complete,
      incompleteSets: (sets ?? []).length - complete,
      mockTests: mockTests ?? 0,
      completedAttempts: attempts ?? 0,
      byCourse,
    } satisfies AdminContentStats;
  });

export interface AdminContentStats {
  totalQuestions: number;
  totalSets: number;
  completeSets: number;
  incompleteSets: number;
  mockTests: number;
  completedAttempts: number;
  byCourse: {
    id: string;
    name: string;
    questions: number;
    subjects: { id: string; name: string; questions: number }[];
  }[];
}

/** Set-completion report (e.g. "Set 1 — 8 / 10 questions") for a chapter or topic. */
export const getSetProgress = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((input: { courseId: string; subjectId?: string | null; limit?: number }) => input)
  .handler(async ({ data, context }) => {
    await assertAdmin(context);
    const { supabase } = context;
    let query = supabase
      .from("question_sets")
      .select(
        "id, name, kind, target_count, subject_id, chapter_id, topic_id, chapters(name), topics(name), subjects(name)",
      )
      .eq("course_id", data.courseId)
      .order("kind")
      .order("sort_order")
      .limit(Math.min(data.limit ?? 200, 500));
    if (data.subjectId) query = query.eq("subject_id", data.subjectId);
    const { data: sets, error } = await query;
    if (error) throw new Error(error.message);

    const ids = (sets ?? []).map((set) => set.id);
    const counts = new Map<string, number>();
    if (ids.length) {
      const { data: rows } = await supabase
        .from("questions")
        .select("question_set_id")
        .in("question_set_id", ids)
        .limit(100000);
      for (const row of rows ?? []) {
        if (row.question_set_id)
          counts.set(row.question_set_id, (counts.get(row.question_set_id) ?? 0) + 1);
      }
    }
    return (sets ?? []).map((set) => ({
      id: set.id,
      name: set.name,
      kind: set.kind,
      target: set.target_count,
      filled: counts.get(set.id) ?? 0,
      subject: (set as any).subjects?.name ?? "",
      chapter: (set as any).chapters?.name ?? "",
      topic: (set as any).topics?.name ?? "",
    }));
  });

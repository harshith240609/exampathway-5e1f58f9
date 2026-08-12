import { createServerFn } from "@tanstack/react-start";
import { requireSupabaseAuth } from "@/integrations/supabase/auth-middleware";

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
  question_text: string;
  difficulty: string;
  question_type: string;
  exam_year?: number | null;
  is_pyq: boolean;
  explanation?: string | null;
  options: AdminOption[];
}

const LETTERS = ["A", "B", "C", "D", "E", "F"];

async function assertAdmin(context: { supabase: any; userId: string }) {
  const { data: isAdmin } = await context.supabase.rpc("has_role", {
    _user_id: context.userId,
    _role: "admin",
  });
  if (!isAdmin) throw new Error("Forbidden");
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
        supabase.from("subjects").select("id, name, course_id").order("sort_order"),
        supabase.from("chapters").select("id, name, subject_id").order("sort_order"),
        supabase.from("topics").select("id, name, chapter_id").order("sort_order"),
      ]);
    return {
      courses: courses ?? [],
      subjects: subjects ?? [],
      chapters: chapters ?? [],
      topics: topics ?? [],
    };
  });

export const listAdminQuestions = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator(
    (input: {
      courseId?: string | null;
      subjectId?: string | null;
      search?: string | null;
      page?: number;
      pageSize?: number;
    }) => ({
      courseId: input.courseId ?? null,
      subjectId: input.subjectId ?? null,
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
        "id, question_text, difficulty, question_type, exam_year, is_pyq, explanation, course_id, subject_id, chapter_id, topic_id, created_at, question_options(id, label, option_text, is_correct, sort_order)",
        { count: "exact" },
      )
      .order("created_at", { ascending: false })
      .range(from, from + data.pageSize - 1);

    if (data.courseId) query = query.eq("course_id", data.courseId);
    if (data.subjectId) query = query.eq("subject_id", data.subjectId);
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
    const payload = {
      course_id: data.course_id,
      subject_id: data.subject_id,
      chapter_id: data.chapter_id || null,
      topic_id: data.topic_id || null,
      question_text: data.question_text.trim(),
      difficulty: data.difficulty,
      question_type: data.question_type,
      exam_year: data.exam_year ?? null,
      is_pyq: data.is_pyq,
      explanation: data.explanation?.trim() || null,
    };
    if (!payload.question_text) throw new Error("Question text is required.");

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
      const { data: inserted, error } = await supabase
        .from("questions")
        .insert({
          course_id: question.course_id,
          subject_id: question.subject_id,
          chapter_id: question.chapter_id || null,
          topic_id: question.topic_id || null,
          question_text: question.question_text.trim(),
          difficulty: question.difficulty || "Medium",
          question_type: question.question_type || "MCQ",
          exam_year: question.exam_year ?? null,
          is_pyq: Boolean(question.is_pyq),
          explanation: question.explanation?.trim() || null,
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

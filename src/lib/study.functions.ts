import { createServerFn } from "@tanstack/react-start";
import { requireSupabaseAuth } from "@/integrations/supabase/auth-middleware";
import { FREE_QUESTIONS_PER_SUBJECT } from "./access";

export interface QuestionFilters {
  courseSlug: string;
  subjectId?: string | null;
  chapterId?: string | null;
  topicId?: string | null;
  difficulty?: string | null;
  questionType?: string | null;
  onlyPyq?: boolean;
  page?: number;
  pageSize?: number;
}

/** Profile, role and the courses the signed-in student actually has access to. */
export const getMyAccount = createServerFn({ method: "GET" })
  .middleware([requireSupabaseAuth])
  .handler(async ({ context }) => {
    const { supabase, userId } = context;
    const [{ data: profile }, { data: roles }, { data: subscriptions }] = await Promise.all([
      supabase.from("profiles").select("*").eq("id", userId).maybeSingle(),
      supabase.from("user_roles").select("role").eq("user_id", userId),
      supabase
        .from("subscriptions")
        .select("id, status, started_at, expires_at, plans(id, name, slug, price_inr)")
        .eq("user_id", userId)
        .order("created_at", { ascending: false }),
    ]);

    const active = (subscriptions ?? []).filter(
      (subscription) =>
        subscription.status === "active" &&
        (!subscription.expires_at || new Date(subscription.expires_at) > new Date()),
    );

    let courseSlugs: string[] = [];
    if (active.length) {
      const { data } = await supabase
        .from("plan_courses")
        .select("courses(slug)")
        .in(
          "plan_id",
          active.map((subscription) => subscription.plans?.id).filter(Boolean) as string[],
        );
      courseSlugs = Array.from(
        new Set((data ?? []).map((row) => row.courses?.slug).filter(Boolean) as string[]),
      );
    }

    return {
      profile,
      isAdmin: (roles ?? []).some((row) => row.role === "admin"),
      subscriptions: subscriptions ?? [],
      activeCourseSlugs: courseSlugs,
    };
  });

export const updateMyProfile = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((input: { full_name: string; class_level: string }) => ({
    full_name: input.full_name.trim().slice(0, 120),
    class_level: input.class_level.trim().slice(0, 40),
  }))
  .handler(async ({ data, context }) => {
    const { error } = await context.supabase
      .from("profiles")
      .update({ ...data, updated_at: new Date().toISOString() })
      .eq("id", context.userId);
    if (error) throw new Error(error.message);
    return { ok: true };
  });

/**
 * Question bank reads. The free tier limit is enforced here on the server:
 * a free student only ever receives the first N questions of each subject,
 * no matter what filters or page numbers the client sends.
 */
export const listQuestions = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((input: QuestionFilters) => input)
  .handler(async ({ data, context }) => {
    const { supabase, userId } = context;
    const pageSize = Math.min(Math.max(data.pageSize ?? 10, 1), 25);
    const page = Math.max(data.page ?? 1, 1);

    const { data: course } = await supabase
      .from("courses")
      .select("id, name, slug")
      .eq("slug", data.courseSlug)
      .maybeSingle();
    if (!course) return { questions: [], total: 0, locked: false, hasAccess: false, freeLimit: 0 };

    const hasAccess = await supabase
      .rpc("has_course_access", { _user_id: userId, _course_id: course.id })
      .then((res) => res.data === true);

    let allowedIds: string[] | null = null;
    if (!hasAccess) {
      const { data: subjects } = await supabase
        .from("subjects")
        .select("id")
        .eq("course_id", course.id);
      allowedIds = [];
      for (const subject of subjects ?? []) {
        const { data: free } = await supabase
          .from("questions")
          .select("id")
          .eq("course_id", course.id)
          .eq("subject_id", subject.id)
          .order("created_at", { ascending: true })
          .order("id", { ascending: true })
          .limit(FREE_QUESTIONS_PER_SUBJECT);
        allowedIds.push(...(free ?? []).map((row) => row.id));
      }
    }

    let query = supabase
      .from("questions")
      .select(
        "id, question_text, difficulty, question_type, exam_year, is_pyq, explanation, subject_id, chapter_id, topic_id, question_options(id, label, option_text, is_correct, sort_order)",
        { count: "exact" },
      )
      .eq("course_id", course.id);

    if (allowedIds) {
      if (allowedIds.length === 0) {
        return { questions: [], total: 0, locked: true, hasAccess, freeLimit: FREE_QUESTIONS_PER_SUBJECT };
      }
      query = query.in("id", allowedIds);
    }
    if (data.subjectId) query = query.eq("subject_id", data.subjectId);
    if (data.chapterId) query = query.eq("chapter_id", data.chapterId);
    if (data.topicId) query = query.eq("topic_id", data.topicId);
    if (data.difficulty) query = query.eq("difficulty", data.difficulty);
    if (data.questionType) query = query.eq("question_type", data.questionType);
    if (data.onlyPyq) query = query.eq("is_pyq", true);

    const from = (page - 1) * pageSize;
    const { data: questions, count } = await query
      .order("created_at", { ascending: true })
      .range(from, from + pageSize - 1);

    return {
      questions: questions ?? [],
      total: count ?? 0,
      locked: !hasAccess,
      hasAccess,
      freeLimit: FREE_QUESTIONS_PER_SUBJECT,
    };
  });

/** Mock tests for a course, with lock state resolved from the real subscription. */
export const listMockTests = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((courseSlug: string) => courseSlug)
  .handler(async ({ data: courseSlug, context }) => {
    const { supabase, userId } = context;
    const { data: course } = await supabase
      .from("courses")
      .select("id, name, slug")
      .eq("slug", courseSlug)
      .maybeSingle();
    if (!course) return { tests: [], hasAccess: false };

    const hasAccess = await supabase
      .rpc("has_course_access", { _user_id: userId, _course_id: course.id })
      .then((res) => res.data === true);
    const [{ data: tests }, { data: attempts }] = await Promise.all([
      supabase
        .from("mock_tests")
        .select("id, title, description, duration_minutes, total_marks, is_free")
        .eq("course_id", course.id)
        .eq("is_published", true)
        .order("sort_order"),
      supabase.from("mock_test_attempts").select("id, mock_test_id, score, submitted_at").eq("user_id", userId),
    ]);

    return {
      hasAccess,
      tests: (tests ?? []).map((test) => ({
        ...test,
        locked: !hasAccess && !test.is_free,
        attempts: (attempts ?? []).filter((attempt) => attempt.mock_test_id === test.id),
      })),
    };
  });

/** Starts an attempt. Access is re-checked server-side; free tier gets free tests only. */
export const startMockTestAttempt = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((mockTestId: string) => mockTestId)
  .handler(async ({ data: mockTestId, context }) => {
    const { supabase, userId } = context;
    const { data: test } = await supabase
      .from("mock_tests")
      .select("id, course_id, is_free, is_published")
      .eq("id", mockTestId)
      .maybeSingle();
    if (!test || !test.is_published) throw new Error("This mock test is not available.");

    const hasAccess = await supabase
      .rpc("has_course_access", { _user_id: userId, _course_id: test.course_id })
      .then((res) => res.data === true);
    if (!hasAccess && !test.is_free) {
      throw new Error("This mock test is part of a paid course. Please purchase access to continue.");
    }

    if (!hasAccess) {
      const { count } = await supabase
        .from("mock_test_attempts")
        .select("id", { count: "exact", head: true })
        .eq("user_id", userId)
        .eq("mock_test_id", test.id);
      if ((count ?? 0) >= 1) {
        throw new Error("You have already used your free attempt for this mock test.");
      }
    }

    const { data: attempt, error } = await supabase
      .from("mock_test_attempts")
      .insert({ user_id: userId, mock_test_id: test.id })
      .select("id")
      .single();
    if (error) throw new Error(error.message);
    return attempt;
  });

/**
 * Records the student's intent to buy a plan. Nothing is ever marked paid here —
 * a real payment gateway will confirm the payment and activate the subscription.
 */
export const requestPlanPurchase = createServerFn({ method: "POST" })
  .middleware([requireSupabaseAuth])
  .inputValidator((planSlug: string) => planSlug)
  .handler(async ({ data: planSlug, context }) => {
    const { supabase, userId } = context;
    const { data: plan } = await supabase
      .from("plans")
      .select("id, price_inr, name")
      .eq("slug", planSlug)
      .eq("is_active", true)
      .maybeSingle();
    if (!plan) throw new Error("Plan not found.");

    const { data: subscription, error: subError } = await supabase
      .from("subscriptions")
      .insert({ user_id: userId, plan_id: plan.id, status: "pending" })
      .select("id")
      .single();
    if (subError) throw new Error(subError.message);

    const { error } = await supabase.from("payments").insert({
      user_id: userId,
      plan_id: plan.id,
      subscription_id: subscription.id,
      amount_inr: plan.price_inr,
      status: "pending",
    });
    if (error) throw new Error(error.message);

    return { status: "pending" as const, planName: plan.name };
  });

/** Admin-only content counts. Returns real numbers straight from the database. */
export const getAdminOverview = createServerFn({ method: "GET" })
  .middleware([requireSupabaseAuth])
  .handler(async ({ context }) => {
    const { supabase, userId } = context;
    const { data: isAdmin } = await supabase.rpc("has_role", { _user_id: userId, _role: "admin" });
    if (!isAdmin) throw new Error("Forbidden");

    const tables = [
      "profiles",
      "courses",
      "subjects",
      "chapters",
      "topics",
      "questions",
      "mock_tests",
      "subscriptions",
      "payments",
    ] as const;

    const counts: Record<string, number> = {};
    for (const table of tables) {
      const { count } = await supabase.from(table).select("id", { count: "exact", head: true });
      counts[table] = count ?? 0;
    }
    return counts;
  });

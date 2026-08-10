import { createServerFn } from "@tanstack/react-start";
import { createPublicClient } from "./supabase-public.server";
import type { CourseSummary, PlanSummary } from "./access";

export const listCourses = createServerFn({ method: "GET" }).handler(
  async (): Promise<CourseSummary[]> => {
    const supabase = createPublicClient();
    const [{ data: courses }, { data: subjects }, { data: tests }] = await Promise.all([
      supabase
        .from("courses")
        .select("id, slug, name, category, description")
        .eq("is_active", true)
        .order("sort_order"),
      supabase.from("subjects").select("id, name, course_id").order("sort_order"),
      supabase.from("mock_tests").select("id, course_id").eq("is_published", true),
    ]);

    const counts = new Map<string, number>();
    for (const course of courses ?? []) {
      const { count } = await supabase
        .from("questions")
        .select("id", { count: "exact", head: true })
        .eq("course_id", course.id);
      counts.set(course.id, count ?? 0);
    }

    return (courses ?? []).map((course) => ({
      ...course,
      subjects: (subjects ?? [])
        .filter((subject) => subject.course_id === course.id)
        .map((subject) => ({ id: subject.id, name: subject.name })),
      questionCount: counts.get(course.id) ?? 0,
      mockTestCount: (tests ?? []).filter((test) => test.course_id === course.id).length,
    }));
  },
);

export const getCourse = createServerFn({ method: "GET" })
  .inputValidator((slug: string) => slug)
  .handler(async ({ data: slug }) => {
    const supabase = createPublicClient();
    const { data: course } = await supabase
      .from("courses")
      .select("id, slug, name, category, description")
      .eq("slug", slug)
      .maybeSingle();
    if (!course) return null;

    const [{ data: subjects }, { data: tests }] = await Promise.all([
      supabase.from("subjects").select("id, name").eq("course_id", course.id).order("sort_order"),
      supabase
        .from("mock_tests")
        .select("id, title, description, duration_minutes, total_marks, is_free")
        .eq("course_id", course.id)
        .eq("is_published", true)
        .order("sort_order"),
    ]);

    const chapters: { id: string; name: string; subject_id: string }[] = [];
    if (subjects?.length) {
      const { data } = await supabase
        .from("chapters")
        .select("id, name, subject_id")
        .in(
          "subject_id",
          subjects.map((subject) => subject.id),
        )
        .order("sort_order");
      chapters.push(...(data ?? []));
    }

    const { count } = await supabase
      .from("questions")
      .select("id", { count: "exact", head: true })
      .eq("course_id", course.id);

    return {
      ...course,
      subjects: (subjects ?? []).map((subject) => ({
        ...subject,
        chapters: chapters.filter((chapter) => chapter.subject_id === subject.id),
      })),
      mockTests: tests ?? [],
      questionCount: count ?? 0,
    };
  });

export const listPlans = createServerFn({ method: "GET" }).handler(
  async (): Promise<PlanSummary[]> => {
    const supabase = createPublicClient();
    const [{ data: plans }, { data: planCourses }, { data: courses }] = await Promise.all([
      supabase
        .from("plans")
        .select("id, slug, name, price_inr, kind")
        .eq("is_active", true)
        .order("sort_order"),
      supabase.from("plan_courses").select("plan_id, course_id"),
      supabase.from("courses").select("id, name"),
    ]);
    const nameById = new Map((courses ?? []).map((course) => [course.id, course.name]));
    return (plans ?? []).map((plan) => ({
      ...plan,
      courses: (planCourses ?? [])
        .filter((row) => row.plan_id === plan.id)
        .map((row) => nameById.get(row.course_id) ?? "")
        .filter(Boolean),
    }));
  },
);

export const searchCatalog = createServerFn({ method: "GET" })
  .inputValidator((term: string) => term.slice(0, 80))
  .handler(async ({ data: term }) => {
    const query = term.trim();
    if (query.length < 2) return { courses: [], subjects: [], chapters: [], topics: [], tests: [] };
    const supabase = createPublicClient();
    const like = `%${query}%`;

    const [courses, subjects, chapters, topics, tests] = await Promise.all([
      supabase.from("courses").select("id, slug, name").ilike("name", like).limit(10),
      supabase
        .from("subjects")
        .select("id, name, courses(slug, name)")
        .ilike("name", like)
        .limit(10),
      supabase
        .from("chapters")
        .select("id, name, subjects(name, courses(slug, name))")
        .ilike("name", like)
        .limit(15),
      supabase
        .from("topics")
        .select("id, name, chapters(name, subjects(name, courses(slug, name)))")
        .ilike("name", like)
        .limit(15),
      supabase
        .from("mock_tests")
        .select("id, title, courses(slug, name)")
        .eq("is_published", true)
        .ilike("title", like)
        .limit(10),
    ]);

    return {
      courses: courses.data ?? [],
      subjects: subjects.data ?? [],
      chapters: chapters.data ?? [],
      topics: topics.data ?? [],
      tests: tests.data ?? [],
    };
  });

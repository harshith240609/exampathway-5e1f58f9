import { createFileRoute, Link } from "@tanstack/react-router";
import { BookOpen, FileStack, LineChart, Timer } from "lucide-react";
import { useEffect, useState } from "react";
import { CourseCard } from "@/components/courses/course-card";
import { EmptyState } from "@/components/common/empty-state";
import { SectionHeading } from "@/components/common/section-heading";
import { SiteLayout } from "@/components/layout/site-layout";
import { Button } from "@/components/ui/button";
import type { CourseSummary } from "@/lib/access";
import { listCourses } from "@/lib/catalog.functions";

const benefits = [
  {
    icon: BookOpen,
    title: "Chapter-wise question bank",
    description:
      "Questions organised by subject, chapter and topic, each with a written solution.",
  },
  {
    icon: FileStack,
    title: "Previous year questions",
    description: "Practise real questions from past papers, tagged by exam and year.",
  },
  {
    icon: Timer,
    title: "Full-length mock tests",
    description: "Timed, exam-pattern tests with automatic scoring.",
  },
  {
    icon: LineChart,
    title: "Your own progress",
    description: "Track attempts and scores across every course you study.",
  },
];

export const Route = createFileRoute("/")({
  head: () => ({
    meta: [
      { title: "ExamPathway — Your Complete Entrance Exam Preparation Platform" },
      {
        name: "description",
        content:
          "Prepare for JEE Main, JEE Advanced, BITSAT, NEET and EAPCET with a chapter-wise question bank, previous year questions and full-length mock tests.",
      },
      { property: "og:title", content: "ExamPathway — Entrance Exam Preparation" },
      {
        property: "og:description",
        content: "Chapter-wise question bank, PYQs and mock tests for JEE, NEET, BITSAT and EAPCET.",
      },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  component: HomePage,
});

function HomePage() {
  const [courses, setCourses] = useState<CourseSummary[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    void listCourses().then((data) => {
      setCourses(data);
      setLoading(false);
    });
  }, []);

  return (
    <SiteLayout>
      <section className="border-b border-border bg-gradient-soft">
        <div className="section-container grid gap-10 py-16 lg:grid-cols-2 lg:items-center lg:py-24">
          <div className="space-y-6">
            <h1 className="text-4xl font-bold leading-tight sm:text-5xl">
              Your complete <span className="text-brand-orange">entrance exam</span> preparation
              platform
            </h1>
            <p className="max-w-xl text-base leading-relaxed text-muted-foreground">
              ExamPathway gives you a structured question bank, previous year questions and
              full-length mock tests for JEE Main, JEE Advanced, BITSAT, NEET and EAPCET.
            </p>
            <div className="flex flex-wrap gap-3">
              <Button asChild size="lg">
                <Link to="/register">Create free account</Link>
              </Button>
              <Button asChild size="lg" variant="outline">
                <Link to="/courses">Browse courses</Link>
              </Button>
            </div>
            <p className="text-sm text-muted-foreground">
              Free plan: 25 questions per subject and 1 mock test per course.
            </p>
          </div>
          <div className="grid gap-4 sm:grid-cols-2">
            {benefits.map((benefit) => (
              <div key={benefit.title} className="rounded-2xl border border-border bg-card p-5">
                <benefit.icon className="size-5 text-primary" />
                <h2 className="mt-3 text-base font-semibold">{benefit.title}</h2>
                <p className="mt-1 text-sm text-muted-foreground">{benefit.description}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      <section className="section-container space-y-8 py-16">
        <SectionHeading
          eyebrow="Courses"
          title="Pick your exam"
          description="Each course follows the same structure: subject, chapter, topic and question."
        />
        {loading ? (
          <p className="text-sm text-muted-foreground">Loading courses...</p>
        ) : courses.length === 0 ? (
          <EmptyState
            icon={BookOpen}
            title="No courses published yet"
            description="Courses will appear here as soon as they are published."
          />
        ) : (
          <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {courses.map((course) => (
              <CourseCard key={course.id} course={course} />
            ))}
          </div>
        )}
      </section>
    </SiteLayout>
  );
}

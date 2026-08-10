import { createFileRoute } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";
import { CourseCard } from "@/components/courses/course-card";
import { EmptyState } from "@/components/common/empty-state";
import { BookOpen } from "lucide-react";
import { listCourses } from "@/lib/catalog.functions";
import type { CourseSummary } from "@/lib/access";

export const Route = createFileRoute("/courses")({
  head: () => ({
    meta: [
      { title: "Entrance Exam Courses — JEE, NEET, BITSAT, EAPCET | ExamPathway" },
      {
        name: "description",
        content:
          "Browse ExamPathway courses for JEE Main, JEE Advanced, BITSAT, NEET and EAPCET with chapter-wise question banks and mock tests.",
      },
      { property: "og:title", content: "Entrance exam courses on ExamPathway" },
      { property: "og:description", content: "JEE Main, JEE Advanced, BITSAT, NEET and EAPCET." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: CoursesPage,
});

function CoursesPage() {
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
      <PageHeader
        title="Entrance exam courses"
        description="Every course follows the same structure: subject, chapter, topic and question — so you always know what to study next."
      />
      <section className="section-container py-12">
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

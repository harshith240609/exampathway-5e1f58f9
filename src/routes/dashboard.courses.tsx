import { createFileRoute } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { CourseCard } from "@/components/courses/course-card";
import { EmptyState } from "@/components/common/empty-state";
import { BookOpen } from "lucide-react";
import type { CourseSummary } from "@/lib/access";
import { listCourses } from "@/lib/catalog.functions";

export const Route = createFileRoute("/dashboard/courses")({
  head: () => ({
    meta: [
      { title: "My Courses | ExamPathway" },
      { name: "description", content: "Courses available in your ExamPathway account." },
      { property: "og:title", content: "My ExamPathway courses" },
      { property: "og:description", content: "Courses available in your account." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: DashboardCourses,
});

function DashboardCourses() {
  const [courses, setCourses] = useState<CourseSummary[]>([]);

  useEffect(() => {
    void listCourses().then(setCourses);
  }, []);

  return (
    <div className="space-y-6">
      <h2 className="text-lg font-semibold">Courses</h2>
      {courses.length === 0 ? (
        <EmptyState
          icon={BookOpen}
          title="No courses yet"
          description="Courses will appear here once published."
        />
      ) : (
        <div className="grid gap-6 sm:grid-cols-2 xl:grid-cols-3">
          {courses.map((course) => (
            <CourseCard key={course.id} course={course} />
          ))}
        </div>
      )}
    </div>
  );
}

import { createFileRoute } from "@tanstack/react-router";
import { CourseCard } from "@/components/courses/course-card";
import { courses } from "@/data/mock";

export const Route = createFileRoute("/dashboard/courses")({
  head: () => ({
    meta: [
      { title: "My Courses | ExamPathway Dashboard" },
      { name: "description", content: "All the exam tracks you are enrolled in." },
      { property: "og:title", content: "My Courses | ExamPathway" },
      { property: "og:description", content: "Continue where you left off in each course." },
    ],
  }),
  component: MyCoursesPage,
});

function MyCoursesPage() {
  return (
    <div className="space-y-6">
      <h2 className="text-xl font-semibold">My courses</h2>
      <div className="grid gap-6 sm:grid-cols-2 xl:grid-cols-3">
        {courses.slice(0, 3).map((course) => (
          <CourseCard key={course.id} course={course} />
        ))}
      </div>
    </div>
  );
}

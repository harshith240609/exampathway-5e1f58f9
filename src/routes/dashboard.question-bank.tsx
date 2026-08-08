import { createFileRoute } from "@tanstack/react-router";
import { QuestionBank } from "@/components/questions/question-bank";
import { courses, getSubjectsForCourse } from "@/data/mock";

export const Route = createFileRoute("/dashboard/question-bank")({
  head: () => ({
    meta: [
      { title: "Question Bank | ExamPathway Dashboard" },
      { name: "description", content: "Practise chapter-wise questions from your dashboard." },
      { property: "og:title", content: "Question Bank | ExamPathway Dashboard" },
      { property: "og:description", content: "Filtered practice with hints and solutions." },
    ],
  }),
  component: DashboardQuestionBank,
});

function DashboardQuestionBank() {
  const course = courses[0]!;
  const subjects = getSubjectsForCourse(course.slug);
  const chapters = [...new Set(subjects.flatMap((s) => s.chapters.map((c) => c.name)))];

  return (
    <div className="space-y-6">
      <h2 className="text-xl font-semibold">{course.name} question bank</h2>
      <QuestionBank courseSlug={course.slug} subjects={course.subjects} chapters={chapters} />
    </div>
  );
}

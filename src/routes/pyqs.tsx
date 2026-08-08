import { createFileRoute } from "@tanstack/react-router";
import { useState } from "react";
import { QuestionBank } from "@/components/questions/question-bank";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { courses, getSubjectsForCourse } from "@/data/mock";
import type { ExamSlug } from "@/types";

export const Route = createFileRoute("/pyqs")({
  head: () => ({
    meta: [
      { title: "Previous Year Questions (PYQs) by Exam, Year & Chapter | ExamPathway" },
      {
        name: "description",
        content:
          "Browse previous year entrance exam questions filtered by exam, year, subject, chapter and difficulty with complete solutions.",
      },
      { property: "og:title", content: "ExamPathway PYQ Archive" },
      {
        property: "og:description",
        content: "Ten years of previous year questions, sorted chapter by chapter.",
      },
    ],
  }),
  component: PyqPage,
});

function PyqPage() {
  const [slug, setSlug] = useState<ExamSlug>("jee-main");
  const course = courses.find((item) => item.slug === slug) ?? courses[0]!;
  const subjects = getSubjectsForCourse(slug);
  const chapters = [...new Set(subjects.flatMap((s) => s.chapters.map((c) => c.name)))];

  return (
    <SiteLayout>
      <PageHeader
        title="Previous Year Questions"
        description="Solve real questions from past papers, grouped by exam, year, subject and chapter so revision stays targeted."
      >
        <div className="w-full md:w-64">
          <Select value={slug} onValueChange={(value) => setSlug(value as ExamSlug)}>
            <SelectTrigger className="h-11 w-full">
              <SelectValue />
            </SelectTrigger>
            <SelectContent>
              {courses.map((item) => (
                <SelectItem key={item.slug} value={item.slug}>
                  {item.name}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>
      </PageHeader>

      <section className="section-container py-12">
        <QuestionBank
          courseSlug={slug}
          subjects={course.subjects}
          chapters={chapters}
          pyqMode
        />
      </section>
    </SiteLayout>
  );
}

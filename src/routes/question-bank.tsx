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

export const Route = createFileRoute("/question-bank")({
  head: () => ({
    meta: [
      { title: "Question Bank — 50,000+ Practice Questions | ExamPathway" },
      {
        name: "description",
        content:
          "Filter entrance exam questions by subject, chapter, difficulty, type and status. Solve with hints, solutions and analytics.",
      },
      { property: "og:title", content: "ExamPathway Question Bank" },
      {
        property: "og:description",
        content: "Chapter-wise practice questions for JEE, NEET, BITSAT, EAMCET and EAPCET.",
      },
    ],
  }),
  component: QuestionBankPage,
});

function QuestionBankPage() {
  const [slug, setSlug] = useState<ExamSlug>("jee-main");
  const course = courses.find((item) => item.slug === slug) ?? courses[0]!;
  const subjects = getSubjectsForCourse(slug);
  const chapters = [...new Set(subjects.flatMap((s) => s.chapters.map((c) => c.name)))];

  return (
    <SiteLayout>
      <PageHeader
        title="Question Bank"
        description="The heart of ExamPathway. Practise chapter by chapter with precise filters, hints, full solutions and accuracy tracking."
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
        <QuestionBank courseSlug={slug} subjects={course.subjects} chapters={chapters} />
      </section>
    </SiteLayout>
  );
}

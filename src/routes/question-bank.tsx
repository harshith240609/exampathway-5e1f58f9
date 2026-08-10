import { createFileRoute, Link } from "@tanstack/react-router";
import { BookOpen, Lock } from "lucide-react";
import { useEffect, useState } from "react";
import { EmptyState } from "@/components/common/empty-state";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { useAuth } from "@/contexts/auth-context";
import type { CourseSummary } from "@/lib/access";
import { listCourses } from "@/lib/catalog.functions";
import { listQuestions } from "@/lib/study.functions";

type QuestionResult = Awaited<ReturnType<typeof listQuestions>>;

export const Route = createFileRoute("/question-bank")({
  head: () => ({
    meta: [
      { title: "Chapter-wise Question Bank for JEE, NEET & More | ExamPathway" },
      {
        name: "description",
        content:
          "Practise chapter-wise questions with detailed solutions for JEE Main, JEE Advanced, BITSAT, NEET and EAPCET. 25 free questions per subject.",
      },
      { property: "og:title", content: "ExamPathway Question Bank" },
      { property: "og:description", content: "Chapter-wise practice with detailed solutions." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: QuestionBankPage,
});

function QuestionBankPage() {
  const { user, loading: authLoading } = useAuth();
  const [courses, setCourses] = useState<CourseSummary[]>([]);
  const [slug, setSlug] = useState("");
  const [subjectId, setSubjectId] = useState<string>("all");
  const [result, setResult] = useState<QuestionResult | null>(null);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    void listCourses().then((data) => {
      setCourses(data);
      if (data[0]) setSlug(data[0].slug);
    });
  }, []);

  useEffect(() => {
    if (!user || !slug) return;
    setLoading(true);
    void listQuestions({
      data: { courseSlug: slug, subjectId: subjectId === "all" ? null : subjectId, pageSize: 10 },
    })
      .then(setResult)
      .finally(() => setLoading(false));
  }, [user, slug, subjectId]);

  const course = courses.find((item) => item.slug === slug);

  return (
    <SiteLayout>
      <PageHeader
        title="Question bank"
        description="Chapter-wise practice with step-by-step solutions. Free accounts get 25 questions per subject."
      />

      <section className="section-container space-y-6 py-12">
        {!authLoading && !user ? (
          <div className="rounded-2xl border border-border bg-card p-6">
            <h2 className="text-lg font-semibold">Sign in to start practising</h2>
            <p className="mt-2 text-sm text-muted-foreground">
              Create a free account to access 25 questions per subject in every course.
            </p>
            <div className="mt-4 flex flex-wrap gap-2">
              <Button asChild>
                <Link to="/register">Create free account</Link>
              </Button>
              <Button asChild variant="outline">
                <Link to="/login">Sign in</Link>
              </Button>
            </div>
          </div>
        ) : (
          <>
            <div className="grid gap-3 sm:grid-cols-2 lg:max-w-2xl">
              <Select value={slug} onValueChange={setSlug}>
                <SelectTrigger aria-label="Select course">
                  <SelectValue placeholder="Select course" />
                </SelectTrigger>
                <SelectContent>
                  {courses.map((item) => (
                    <SelectItem key={item.id} value={item.slug}>
                      {item.name}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
              <Select value={subjectId} onValueChange={setSubjectId}>
                <SelectTrigger aria-label="Select subject">
                  <SelectValue placeholder="All subjects" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All subjects</SelectItem>
                  {(course?.subjects ?? []).map((subject) => (
                    <SelectItem key={subject.id} value={subject.id}>
                      {subject.name}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>

            {result?.locked ? (
              <p className="flex items-center gap-2 rounded-xl border border-border bg-secondary/50 p-4 text-sm">
                <Lock className="size-4 shrink-0" />
                Free plan: you can see the first {result.freeLimit} questions of each subject.
                <Link to="/pricing" className="font-semibold text-primary hover:underline">
                  Upgrade
                </Link>
              </p>
            ) : null}

            {loading ? (
              <p className="text-sm text-muted-foreground">Loading questions...</p>
            ) : (result?.questions.length ?? 0) === 0 ? (
              <EmptyState
                icon={BookOpen}
                title="No questions yet"
                description="Questions for this selection have not been published yet."
              />
            ) : (
              <ol className="space-y-4">
                {result?.questions.map((question, index) => (
                  <li key={question.id} className="rounded-2xl border border-border bg-card p-5">
                    <div className="flex flex-wrap items-center gap-2">
                      <Badge variant="secondary">Q{index + 1}</Badge>
                      <Badge variant="outline">{question.difficulty}</Badge>
                      <Badge variant="outline">{question.question_type}</Badge>
                      {question.is_pyq ? <Badge>PYQ {question.exam_year ?? ""}</Badge> : null}
                    </div>
                    <p className="mt-3 text-sm font-medium">{question.question_text}</p>
                    <ul className="mt-3 grid gap-2 sm:grid-cols-2">
                      {[...(question.question_options ?? [])]
                        .sort((a, b) => a.sort_order - b.sort_order)
                        .map((option) => (
                          <li
                            key={option.id}
                            className="rounded-lg border border-border px-3 py-2 text-sm"
                          >
                            <span className="font-semibold">{option.label}.</span>{" "}
                            {option.option_text}
                          </li>
                        ))}
                    </ul>
                    {question.explanation ? (
                      <details className="mt-3 text-sm">
                        <summary className="cursor-pointer font-medium text-primary">
                          View solution
                        </summary>
                        <p className="mt-2 text-muted-foreground">{question.explanation}</p>
                      </details>
                    ) : null}
                  </li>
                ))}
              </ol>
            )}
          </>
        )}
      </section>
    </SiteLayout>
  );
}

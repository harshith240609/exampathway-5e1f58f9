import { createFileRoute, Link } from "@tanstack/react-router";
import { Lock, Timer } from "lucide-react";
import { useEffect, useState } from "react";
import { toast } from "sonner";
import { CreateAccountNotice, VerifyEmailNotice } from "@/components/common/access-notices";
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
import { listMockTests, startMockTestAttempt } from "@/lib/study.functions";

type MockTestResult = Awaited<ReturnType<typeof listMockTests>>;

export const Route = createFileRoute("/mock-tests")({
  head: () => ({
    meta: [
      { title: "Full-Length Mock Tests for Entrance Exams | ExamPathway" },
      {
        name: "description",
        content:
          "Attempt exam-pattern mock tests for JEE Main, JEE Advanced, BITSAT, NEET and EAPCET. One mock test per course is free.",
      },
      { property: "og:title", content: "ExamPathway Mock Tests" },
      { property: "og:description", content: "Timed, exam-pattern mock tests with scoring." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: MockTestsPage,
});

function MockTestsPage() {
  const { user, emailVerified, loading: authLoading } = useAuth();
  const [courses, setCourses] = useState<CourseSummary[]>([]);
  const [slug, setSlug] = useState("");
  const [result, setResult] = useState<MockTestResult | null>(null);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    void listCourses().then((data) => {
      setCourses(data);
      if (data[0]) setSlug(data[0].slug);
    });
  }, []);

  useEffect(() => {
    if (!user || !emailVerified || !slug) return;
    setLoading(true);
    void listMockTests({ data: slug })
      .then(setResult)
      .finally(() => setLoading(false));
  }, [user, emailVerified, slug]);

  return (
    <SiteLayout>
      <PageHeader
        title="Mock tests"
        description="Timed, exam-pattern tests. Every course includes one free mock test."
      />

      <section className="section-container space-y-6 py-12">
        {!authLoading && !user ? (
          <CreateAccountNotice description="Verified free accounts get one free mock test in every course." />
        ) : !authLoading && !emailVerified ? (
          <VerifyEmailNotice />
        ) : (
          <>
            <Select value={slug} onValueChange={setSlug}>
              <SelectTrigger className="sm:max-w-xs" aria-label="Select course">
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

            {result && !result.hasAccess && result.freeMockUsed ? (
              <p className="rounded-xl border border-border bg-secondary/50 p-4 text-sm">
                You have used your free practice allocation for this course. Choose a paid plan to
                unlock the complete question bank and all mock tests.
              </p>
            ) : null}

            {loading ? (
              <p className="text-sm text-muted-foreground">Loading mock tests...</p>
            ) : (result?.tests.length ?? 0) === 0 ? (
              <EmptyState
                icon={Timer}
                title="No mock tests published"
                description="Mock tests for this course will appear here once published."
              />
            ) : (
              <div className="grid gap-4 md:grid-cols-2">
                {result?.tests.map((test) => (
                  <article
                    key={test.id}
                    className="flex flex-col gap-3 rounded-2xl border border-border bg-card p-5"
                  >
                    <div className="grid grid-cols-[minmax(0,1fr)_auto] items-start gap-3">
                      <h3 className="min-w-0 font-semibold">{test.title}</h3>
                      {test.is_free ? <Badge variant="secondary">Free</Badge> : null}
                    </div>
                    {test.description ? (
                      <p className="text-sm text-muted-foreground">{test.description}</p>
                    ) : null}
                    <p className="text-sm text-muted-foreground">
                      {test.duration_minutes} min · {test.total_marks} marks ·{" "}
                      {test.attempts.length} attempt(s)
                    </p>
                    {test.locked ? (
                      <Button asChild variant="outline" className="mt-auto">
                        <Link to="/pricing">
                          <Lock className="size-4" /> Unlock with a plan
                        </Link>
                      </Button>
                    ) : (
                      <Button
                        className="mt-auto"
                        onClick={async () => {
                          try {
                            await startMockTestAttempt({ data: test.id });
                            toast.success("Attempt started.");
                            const refreshed = await listMockTests({ data: slug });
                            setResult(refreshed);
                          } catch (error) {
                            toast.error(
                              error instanceof Error ? error.message : "Could not start attempt.",
                            );
                          }
                        }}
                      >
                        Start test
                      </Button>
                    )}
                  </article>
                ))}
              </div>
            )}
          </>
        )}
      </section>
    </SiteLayout>
  );
}

import { createFileRoute, Link } from "@tanstack/react-router";
import { BookOpen } from "lucide-react";
import { useEffect, useState } from "react";
import { EmptyState } from "@/components/common/empty-state";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { getCourse } from "@/lib/catalog.functions";

type CourseDetail = Awaited<ReturnType<typeof getCourse>>;

export const Route = createFileRoute("/course/$slug")({
  head: ({ params }) => ({
    meta: [
      { title: `${params.slug.toUpperCase()} Preparation Course | ExamPathway` },
      {
        name: "description",
        content: `Chapter-wise question bank, previous year questions and mock tests for ${params.slug} on ExamPathway.`,
      },
      { property: "og:title", content: `${params.slug} course on ExamPathway` },
      { property: "og:description", content: "Structured syllabus, question bank and mock tests." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: CourseDetailPage,
});

function CourseDetailPage() {
  const { slug } = Route.useParams();
  const [course, setCourse] = useState<CourseDetail>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setLoading(true);
    void getCourse({ data: slug }).then((data) => {
      setCourse(data);
      setLoading(false);
    });
  }, [slug]);

  if (loading) {
    return (
      <SiteLayout>
        <p className="section-container py-16 text-sm text-muted-foreground">Loading course...</p>
      </SiteLayout>
    );
  }

  if (!course) {
    return (
      <SiteLayout>
        <div className="section-container py-16">
          <EmptyState
            icon={BookOpen}
            title="Course not found"
            description="This course is not available. Browse the full course list instead."
          />
        </div>
      </SiteLayout>
    );
  }

  return (
    <SiteLayout>
      <PageHeader title={course.name} description={course.description}>
        <div className="flex flex-wrap gap-2">
          <Button asChild>
            <Link to="/question-bank">Practice questions</Link>
          </Button>
          <Button asChild variant="outline">
            <Link to="/mock-tests">Mock tests</Link>
          </Button>
        </div>
      </PageHeader>

      <section className="section-container grid gap-6 py-12 lg:grid-cols-3">
        <div className="space-y-6 lg:col-span-2">
          <h2 className="text-2xl font-bold">Syllabus structure</h2>
          {course.subjects.length === 0 ? (
            <EmptyState
              icon={BookOpen}
              title="Syllabus coming soon"
              description="Chapters for this course have not been published yet."
            />
          ) : (
            course.subjects.map((subject) => (
              <div key={subject.id} className="rounded-2xl border border-border bg-card p-5">
                <h3 className="text-lg font-semibold">{subject.name}</h3>
                {subject.chapters.length === 0 ? (
                  <p className="mt-2 text-sm text-muted-foreground">Chapters coming soon.</p>
                ) : (
                  <div className="mt-3 flex flex-wrap gap-2">
                    {subject.chapters.map((chapter) => (
                      <Badge key={chapter.id} variant="secondary">
                        {chapter.name}
                      </Badge>
                    ))}
                  </div>
                )}
              </div>
            ))
          )}
        </div>

        <aside className="space-y-4">
          <div className="rounded-2xl border border-border bg-card p-5">
            <h3 className="text-sm font-semibold uppercase tracking-wide text-muted-foreground">
              Course content
            </h3>
            <dl className="mt-3 space-y-2 text-sm">
              <div className="flex justify-between">
                <dt>Subjects</dt>
                <dd className="font-semibold">{course.subjects.length}</dd>
              </div>
              <div className="flex justify-between">
                <dt>Questions</dt>
                <dd className="font-semibold">{course.questionCount}</dd>
              </div>
              <div className="flex justify-between">
                <dt>Mock tests</dt>
                <dd className="font-semibold">{course.mockTests.length}</dd>
              </div>
            </dl>
          </div>
          <div className="rounded-2xl border border-border bg-card p-5 text-sm">
            <p className="font-semibold">Free access</p>
            <p className="mt-2 text-muted-foreground">
              25 questions per subject and 1 mock test for this course, at no cost.
            </p>
            <Button asChild className="mt-4 w-full">
              <Link to="/pricing">See plans</Link>
            </Button>
          </div>
        </aside>
      </section>
    </SiteLayout>
  );
}

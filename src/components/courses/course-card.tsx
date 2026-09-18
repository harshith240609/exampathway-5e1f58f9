import { Link } from "@tanstack/react-router";
import { BookOpen, FileStack, Layers } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import type { CourseSummary } from "@/lib/access";

export function CourseCard({
  course,
  comingSoon = false,
}: {
  course: CourseSummary;
  comingSoon?: boolean;
}) {
  return (
    <article className="card-hover flex h-full flex-col gap-4 rounded-2xl border border-border bg-card p-5 shadow-soft">
      <div className="grid grid-cols-[minmax(0,1fr)_auto] items-start gap-3">
        <h3 className="min-w-0 text-lg font-semibold sm:text-xl">{course.name}</h3>
        <Badge variant="secondary" className="shrink-0">
          {course.category}
        </Badge>
      </div>
      <p className="text-sm leading-relaxed text-muted-foreground">{course.description}</p>

      <div className="flex flex-wrap gap-2">
        {course.subjects.map((subject) => (
          <Badge key={subject.id} variant="outline">
            {subject.name}
          </Badge>
        ))}
      </div>

      <dl className="mt-auto grid grid-cols-3 gap-2 rounded-xl bg-secondary/60 p-3 text-center">
        <div>
          <dt className="text-[11px] uppercase tracking-wide text-muted-foreground">Questions</dt>
          <dd className="flex items-center justify-center gap-1 text-sm font-semibold">
            <BookOpen className="size-3.5" />
            {course.questionCount}
          </dd>
        </div>
        <div>
          <dt className="text-[11px] uppercase tracking-wide text-muted-foreground">Mocks</dt>
          <dd className="flex items-center justify-center gap-1 text-sm font-semibold">
            <FileStack className="size-3.5" />
            {course.mockTestCount}
          </dd>
        </div>
        <div>
          <dt className="text-[11px] uppercase tracking-wide text-muted-foreground">Subjects</dt>
          <dd className="flex items-center justify-center gap-1 text-sm font-semibold">
            <Layers className="size-3.5" />
            {course.subjects.length}
          </dd>
        </div>
      </dl>

      <Button asChild variant="outline" className="w-full">
        <Link to="/course/$slug" params={{ slug: course.slug }}>
          View course
        </Link>
      </Button>
    </article>
  );
}

import { Link } from "@tanstack/react-router";
import { BookOpen, FileStack, Star, Users } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import type { Course } from "@/types";

export function CourseCard({ course }: { course: Course }) {
  return (
    <article className="card-hover group flex h-full flex-col overflow-hidden rounded-2xl border border-border bg-card shadow-soft">
      <div className="relative h-40 overflow-hidden">
        <img
          src={course.image}
          alt={`${course.name} course cover`}
          loading="lazy"
          width={1024}
          height={640}
          className="size-full object-cover transition-transform duration-500 group-hover:scale-105"
        />
        <Badge className="absolute left-4 top-4 bg-card text-foreground">
          {course.category}
        </Badge>
      </div>
      <div className="flex flex-1 flex-col gap-4 p-5">
        <div className="flex items-start justify-between gap-3">
          <h3 className="text-xl font-semibold">{course.name}</h3>
          <span className="flex items-center gap-1 text-sm font-medium text-brand-orange">
            <Star className="size-4 fill-current" />
            {course.rating}
          </span>
        </div>
        <p className="text-sm leading-relaxed text-muted-foreground">{course.description}</p>

        <div className="flex flex-wrap gap-2">
          {course.subjects.map((subject) => (
            <Badge key={subject} variant="secondary">
              {subject}
            </Badge>
          ))}
        </div>

        <dl className="grid grid-cols-3 gap-3 rounded-xl bg-secondary/60 p-3 text-center">
          <div>
            <dt className="text-[11px] uppercase tracking-wide text-muted-foreground">
              Questions
            </dt>
            <dd className="text-sm font-semibold">
              {course.questionCount.toLocaleString("en-IN")}
            </dd>
          </div>
          <div>
            <dt className="text-[11px] uppercase tracking-wide text-muted-foreground">
              Mocks
            </dt>
            <dd className="text-sm font-semibold">{course.mockTestCount}</dd>
          </div>
          <div>
            <dt className="text-[11px] uppercase tracking-wide text-muted-foreground">
              Level
            </dt>
            <dd className="text-sm font-semibold">{course.difficulty}</dd>
          </div>
        </dl>

        <div className="mt-auto flex items-center justify-between gap-3 pt-1">
          <span className="flex items-center gap-1.5 text-xs text-muted-foreground">
            <Users className="size-3.5" />
            {course.students.toLocaleString("en-IN")} enrolled
          </span>
          <Button asChild size="sm">
            <Link to="/course/$slug" params={{ slug: course.slug }}>
              View course
            </Link>
          </Button>
        </div>
      </div>
    </article>
  );
}

export function CourseMetaStrip({ course }: { course: Course }) {
  return (
    <div className="flex flex-wrap gap-4 text-sm text-muted-foreground">
      <span className="flex items-center gap-2">
        <BookOpen className="size-4 text-primary" />
        {course.subjects.length} subjects
      </span>
      <span className="flex items-center gap-2">
        <FileStack className="size-4 text-primary" />
        {course.questionCount.toLocaleString("en-IN")} questions
      </span>
      <span className="flex items-center gap-2">
        <Users className="size-4 text-primary" />
        {course.students.toLocaleString("en-IN")} students
      </span>
    </div>
  );
}

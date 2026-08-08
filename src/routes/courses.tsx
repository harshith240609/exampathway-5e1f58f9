import { createFileRoute } from "@tanstack/react-router";
import { Search } from "lucide-react";
import { useMemo, useState } from "react";
import { FadeIn } from "@/components/common/motion";
import { SectionHeading } from "@/components/common/section-heading";
import { CourseCard } from "@/components/courses/course-card";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";
import { Input } from "@/components/ui/input";
import { courses } from "@/data/mock";

export const Route = createFileRoute("/courses")({
  head: () => ({
    meta: [
      { title: "Courses — JEE, NEET, BITSAT, EAMCET & EAPCET | ExamPathway" },
      {
        name: "description",
        content:
          "Explore ExamPathway courses for JEE Main, JEE Advanced, BITSAT, EAMCET, EAPCET and NEET with question banks, mock tests and analytics.",
      },
      { property: "og:title", content: "ExamPathway Courses" },
      {
        property: "og:description",
        content: "Dedicated preparation tracks for six major Indian entrance exams.",
      },
    ],
  }),
  component: CoursesPage,
});

function CoursesPage() {
  const [search, setSearch] = useState("");

  const grouped = useMemo(() => {
    const term = search.trim().toLowerCase();
    const filtered = term
      ? courses.filter(
          (course) =>
            course.name.toLowerCase().includes(term) ||
            course.description.toLowerCase().includes(term),
        )
      : courses;
    return {
      Engineering: filtered.filter((course) => course.category === "Engineering"),
      Medical: filtered.filter((course) => course.category === "Medical"),
    };
  }, [search]);

  return (
    <SiteLayout>
      <PageHeader
        title="Choose your exam track"
        description="Every course includes a chapter-wise question bank, previous year papers, mock test series, bookmarks and performance analytics."
      >
        <div className="relative w-full md:w-80">
          <Search className="pointer-events-none absolute left-3 top-1/2 size-4 -translate-y-1/2 text-muted-foreground" />
          <Input
            value={search}
            onChange={(event) => setSearch(event.target.value)}
            placeholder="Search courses"
            className="h-11 pl-9"
          />
        </div>
      </PageHeader>

      {(["Engineering", "Medical"] as const).map((category) => (
        <section key={category} className="section-container py-14">
          <SectionHeading
            eyebrow={category}
            title={`${category} entrance exams`}
            description={
              category === "Engineering"
                ? "National and state level engineering entrance preparation with Physics, Chemistry and Mathematics."
                : "NCERT-first medical entrance preparation covering Biology, Physics and Chemistry."
            }
          />
          <div className="mt-10 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {grouped[category].map((course, index) => (
              <FadeIn key={course.id} delay={index * 0.05}>
                <CourseCard course={course} />
              </FadeIn>
            ))}
          </div>
          {grouped[category].length === 0 ? (
            <p className="mt-6 text-sm text-muted-foreground">
              No {category.toLowerCase()} courses match your search.
            </p>
          ) : null}
        </section>
      ))}
    </SiteLayout>
  );
}

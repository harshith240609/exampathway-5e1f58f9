import { createFileRoute } from "@tanstack/react-router";
import { Download, FileText, Search } from "lucide-react";
import { useMemo, useState } from "react";
import { toast } from "sonner";
import { EmptyState } from "@/components/common/empty-state";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { courses, studyMaterials } from "@/data/mock";

export const Route = createFileRoute("/study-materials")({
  head: () => ({
    meta: [
      { title: "Study Materials — Notes, Formula Sheets & Solutions | ExamPathway" },
      {
        name: "description",
        content:
          "Download subject-wise notes, formula sheets, revision material and solution booklets for JEE, NEET and state entrance exams.",
      },
      { property: "og:title", content: "ExamPathway Study Materials" },
      {
        property: "og:description",
        content: "Curated notes and formula sheets mapped to the official syllabus.",
      },
    ],
  }),
  component: StudyMaterialsPage,
});

function StudyMaterialsPage() {
  const [search, setSearch] = useState("");
  const [slug, setSlug] = useState<string>("All");

  const filtered = useMemo(() => {
    const term = search.trim().toLowerCase();
    return studyMaterials.filter(
      (material) =>
        (slug === "All" || material.courseSlug === slug) &&
        (!term || material.title.toLowerCase().includes(term)),
    );
  }, [search, slug]);

  return (
    <SiteLayout>
      <PageHeader
        title="Study Materials"
        description="Condensed theory, formula sheets and worked solutions, organised by exam and subject."
      >
        <div className="flex w-full flex-col gap-3 sm:flex-row md:w-auto">
          <div className="relative sm:w-64">
            <Search className="pointer-events-none absolute left-3 top-1/2 size-4 -translate-y-1/2 text-muted-foreground" />
            <Input
              value={search}
              onChange={(event) => setSearch(event.target.value)}
              placeholder="Search materials"
              className="h-11 pl-9"
            />
          </div>
          <Select value={slug} onValueChange={setSlug}>
            <SelectTrigger className="h-11 sm:w-48">
              <SelectValue />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="All">All exams</SelectItem>
              {courses.map((course) => (
                <SelectItem key={course.slug} value={course.slug}>
                  {course.name}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>
      </PageHeader>

      <section className="section-container py-12">
        {filtered.length === 0 ? (
          <EmptyState
            icon={FileText}
            title="No materials found"
            description="Try a different exam filter or search term."
          />
        ) : (
          <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {filtered.map((material) => (
              <article
                key={material.id}
                className="card-hover flex h-full flex-col rounded-2xl border border-border bg-card p-5 shadow-soft"
              >
                <div className="flex items-center gap-2">
                  <span className="flex size-10 items-center justify-center rounded-xl bg-primary-soft text-accent-foreground">
                    <FileText className="size-5" />
                  </span>
                  <Badge variant="secondary">{material.type}</Badge>
                </div>
                <h2 className="mt-4 font-semibold">{material.title}</h2>
                <p className="mt-2 flex-1 text-sm leading-relaxed text-muted-foreground">
                  {material.description}
                </p>
                <div className="mt-4 flex items-center justify-between">
                  <span className="text-xs text-muted-foreground">
                    {material.pages} pages · {material.updatedAt}
                  </span>
                  <Button
                    size="sm"
                    variant="outline"
                    onClick={() => toast.info("Downloads unlock once you sign in.")}
                  >
                    <Download className="size-4" /> Download
                  </Button>
                </div>
              </article>
            ))}
          </div>
        )}
      </section>
    </SiteLayout>
  );
}

import { createFileRoute, Link } from "@tanstack/react-router";
import { SearchIcon } from "lucide-react";
import { useEffect, useState } from "react";
import { EmptyState } from "@/components/common/empty-state";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";
import { searchCatalog } from "@/lib/catalog.functions";

type Results = Awaited<ReturnType<typeof searchCatalog>>;

export const Route = createFileRoute("/search")({
  validateSearch: (search: Record<string, unknown>) => ({ q: String(search['q'] ?? "") }),
  head: () => ({
    meta: [
      { title: "Search Courses, Chapters and Tests | ExamPathway" },
      { name: "description", content: "Search ExamPathway courses, subjects, chapters, topics and mock tests." },
      { property: "og:title", content: "Search ExamPathway" },
      { property: "og:description", content: "Find courses, chapters, topics and mock tests." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: SearchPage,
});

function SearchPage() {
  const { q } = Route.useSearch();
  const [results, setResults] = useState<Results | null>(null);

  useEffect(() => {
    void searchCatalog({ data: q }).then(setResults);
  }, [q]);

  const empty =
    !results ||
    results.courses.length +
      results.subjects.length +
      results.chapters.length +
      results.topics.length +
      results.tests.length ===
      0;

  return (
    <SiteLayout>
      <PageHeader title="Search" description={q ? `Results for "${q}"` : "Type a search term in the header."} />
      <section className="section-container space-y-6 py-12">
        {empty ? (
          <EmptyState icon={SearchIcon} title="No matches" description="Try a different course, chapter or topic name." />
        ) : (
          <div className="space-y-6">
            {results.courses.length > 0 ? (
              <div>
                <h2 className="mb-3 text-lg font-semibold">Courses</h2>
                <ul className="space-y-2">
                  {results.courses.map((course) => (
                    <li key={course.id}>
                      <Link to="/course/$slug" params={{ slug: course.slug }} className="text-primary hover:underline">
                        {course.name}
                      </Link>
                    </li>
                  ))}
                </ul>
              </div>
            ) : null}
            {[
              { label: "Subjects", items: results.subjects.map((item) => item.name) },
              { label: "Chapters", items: results.chapters.map((item) => item.name) },
              { label: "Topics", items: results.topics.map((item) => item.name) },
              { label: "Mock tests", items: results.tests.map((item) => item.title) },
            ]
              .filter((group) => group.items.length > 0)
              .map((group) => (
                <div key={group.label}>
                  <h2 className="mb-3 text-lg font-semibold">{group.label}</h2>
                  <ul className="space-y-1 text-sm text-muted-foreground">
                    {group.items.map((name) => (
                      <li key={name}>{name}</li>
                    ))}
                  </ul>
                </div>
              ))}
          </div>
        )}
      </section>
    </SiteLayout>
  );
}

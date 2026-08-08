import { createFileRoute } from "@tanstack/react-router";
import { BookMarked } from "lucide-react";
import { EmptyState } from "@/components/common/empty-state";
import { Badge } from "@/components/ui/badge";
import { questions } from "@/data/mock";

export const Route = createFileRoute("/dashboard/bookmarks")({
  head: () => ({
    meta: [
      { title: "Bookmarked Questions | ExamPathway Dashboard" },
      { name: "description", content: "Every question you saved for later revision." },
      { property: "og:title", content: "Bookmarks | ExamPathway" },
      { property: "og:description", content: "Revisit your saved questions any time." },
    ],
  }),
  component: BookmarksPage,
});

function BookmarksPage() {
  const bookmarks = questions.filter((question) => question.bookmarked).slice(0, 12);

  return (
    <div className="space-y-6">
      <h2 className="text-xl font-semibold">Bookmarks</h2>
      {bookmarks.length === 0 ? (
        <EmptyState
          icon={BookMarked}
          title="No bookmarks yet"
          description="Tap the bookmark icon on any question to save it here."
        />
      ) : (
        <div className="space-y-4">
          {bookmarks.map((question) => (
            <article
              key={question.id}
              className="rounded-2xl border border-border bg-card p-5 shadow-soft"
            >
              <div className="flex flex-wrap items-center gap-2">
                <Badge variant="secondary">{question.subject}</Badge>
                <Badge variant="outline">{question.chapter}</Badge>
                <Badge variant="outline">{question.difficulty}</Badge>
              </div>
              <p className="mt-3 text-sm leading-relaxed">{question.text}</p>
            </article>
          ))}
        </div>
      )}
    </div>
  );
}

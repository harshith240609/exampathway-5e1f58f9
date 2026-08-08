import { createFileRoute } from "@tanstack/react-router";
import { Pin } from "lucide-react";
import { useState } from "react";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";
import { Badge } from "@/components/ui/badge";
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { announcements } from "@/data/mock";

const types = ["All", "Announcement", "Notice", "Exam Update", "Maintenance"] as const;

export const Route = createFileRoute("/announcements")({
  head: () => ({
    meta: [
      { title: "Announcements & Exam Updates | ExamPathway" },
      {
        name: "description",
        content:
          "Latest exam notifications, platform announcements, notices and maintenance updates for ExamPathway students.",
      },
      { property: "og:title", content: "ExamPathway Announcements" },
      {
        property: "og:description",
        content: "Stay updated with exam notifications and platform news.",
      },
    ],
  }),
  component: AnnouncementsPage,
});

function AnnouncementsPage() {
  const [type, setType] = useState<string>("All");
  const filtered =
    type === "All"
      ? announcements
      : announcements.filter((announcement) => announcement.type === type);

  return (
    <SiteLayout>
      <PageHeader
        title="Announcements"
        description="Exam notifications, new content drops and platform updates, all in one feed."
      />

      <section className="section-container py-12">
        <Tabs value={type} onValueChange={setType}>
          <TabsList className="flex-wrap">
            {types.map((item) => (
              <TabsTrigger key={item} value={item}>
                {item}
              </TabsTrigger>
            ))}
          </TabsList>
        </Tabs>

        <div className="mt-8 space-y-4">
          {filtered.map((announcement) => (
            <article
              key={announcement.id}
              className="card-hover rounded-2xl border border-border bg-card p-6 shadow-soft"
            >
              <div className="flex flex-wrap items-center gap-2">
                <Badge variant="secondary">{announcement.type}</Badge>
                {announcement.pinned ? (
                  <Badge className="gap-1">
                    <Pin className="size-3" /> Pinned
                  </Badge>
                ) : null}
                <span className="text-xs text-muted-foreground">
                  {announcement.publishedAt}
                </span>
              </div>
              <h2 className="mt-3 text-lg font-semibold">{announcement.title}</h2>
              <p className="mt-2 text-sm leading-relaxed text-muted-foreground">
                {announcement.body}
              </p>
            </article>
          ))}
        </div>
      </section>
    </SiteLayout>
  );
}

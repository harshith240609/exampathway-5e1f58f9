import { createFileRoute } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { getAdminOverview } from "@/lib/study.functions";

export const Route = createFileRoute("/admin/")({
  head: () => ({
    meta: [
      { title: "Admin Console | ExamPathway" },
      { name: "description", content: "Real content and user counts for the ExamPathway platform." },
      { property: "og:title", content: "ExamPathway admin console" },
      { property: "og:description", content: "Platform content and user counts." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: AdminOverview,
});

function AdminOverview() {
  const [counts, setCounts] = useState<Record<string, number> | null>(null);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    void getAdminOverview()
      .then(setCounts)
      .catch((err: unknown) =>
        setError(err instanceof Error ? err.message : "Could not load overview."),
      );
  }, []);

  if (error) return <p className="text-sm text-destructive">{error}</p>;
  if (!counts) return <p className="text-sm text-muted-foreground">Loading overview...</p>;

  return (
    <div className="space-y-4">
      <Link
        to="/admin/questions"
        className="inline-flex items-center rounded-xl bg-primary px-4 py-2 text-sm font-medium text-primary-foreground"
      >
        Manage question database
      </Link>
      <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-3">
      {Object.entries(counts).map(([table, count]) => (

        <div key={table} className="rounded-2xl border border-border bg-card p-5">
          <p className="text-xs uppercase tracking-wide text-muted-foreground">
            {table.replace(/_/g, " ")}
          </p>
          <p className="mt-2 text-3xl font-bold">{count}</p>
        </div>
      ))}
    </div>
  );
}

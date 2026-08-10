import { createFileRoute, Link } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { Button } from "@/components/ui/button";
import { getMyAccount } from "@/lib/study.functions";

type Account = Awaited<ReturnType<typeof getMyAccount>>;

export const Route = createFileRoute("/dashboard/")({
  head: () => ({
    meta: [
      { title: "Student Dashboard | ExamPathway" },
      { name: "description", content: "Your ExamPathway plan, courses and study shortcuts." },
      { property: "og:title", content: "ExamPathway student dashboard" },
      { property: "og:description", content: "Your plan, courses and study shortcuts." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: DashboardHome,
});

function DashboardHome() {
  const [account, setAccount] = useState<Account | null>(null);

  useEffect(() => {
    void getMyAccount().then(setAccount);
  }, []);

  const activeCourses = account?.activeCourseSlugs ?? [];

  return (
    <div className="space-y-6">
      <div className="rounded-2xl border border-border bg-card p-5">
        <h2 className="text-lg font-semibold">
          Welcome{account?.profile?.full_name ? `, ${account.profile.full_name}` : ""}
        </h2>
        <p className="mt-1 text-sm text-muted-foreground">
          {activeCourses.length > 0
            ? `You have full access to ${activeCourses.length} course(s).`
            : "You are on the free plan: 25 questions per subject and 1 mock test per course."}
        </p>
        <div className="mt-4 flex flex-wrap gap-2">
          <Button asChild>
            <Link to="/question-bank">Practise questions</Link>
          </Button>
          <Button asChild variant="outline">
            <Link to="/mock-tests">Mock tests</Link>
          </Button>
          {activeCourses.length === 0 ? (
            <Button asChild variant="ghost">
              <Link to="/pricing">See plans</Link>
            </Button>
          ) : null}
        </div>
      </div>

      <div className="rounded-2xl border border-border bg-card p-5">
        <h3 className="text-sm font-semibold uppercase tracking-wide text-muted-foreground">
          Your plan
        </h3>
        {(account?.subscriptions.length ?? 0) === 0 ? (
          <p className="mt-2 text-sm text-muted-foreground">
            No paid plan yet. Your free access is active.
          </p>
        ) : (
          <ul className="mt-3 space-y-2 text-sm">
            {account?.subscriptions.map((subscription) => (
              <li key={subscription.id} className="flex justify-between gap-3">
                <span className="truncate">{subscription.plans?.name ?? "Plan"}</span>
                <span className="shrink-0 capitalize text-muted-foreground">
                  {subscription.status}
                </span>
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  );
}

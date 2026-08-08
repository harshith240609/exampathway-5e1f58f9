import { createFileRoute, Link } from "@tanstack/react-router";
import { Activity, Flame, Percent, Target, Timer } from "lucide-react";
import {
  Area,
  AreaChart,
  CartesianGrid,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from "recharts";
import { StatCard } from "@/components/common/stat-card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";
import { mockTests, performanceTrend, progressData, results } from "@/data/mock";

export const Route = createFileRoute("/dashboard/")({
  head: () => ({
    meta: [
      { title: "Student Dashboard | ExamPathway" },
      {
        name: "description",
        content: "Track progress, accuracy, weak chapters and upcoming tests in one place.",
      },
      { property: "og:title", content: "Student Dashboard | ExamPathway" },
      { property: "og:description", content: "Your preparation overview at a glance." },
    ],
  }),
  component: DashboardOverview,
});

function DashboardOverview() {
  const strong = [...progressData].sort((a, b) => b.accuracy - a.accuracy);
  const weak = [...strong].reverse();

  return (
    <div className="space-y-6">
      <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
        <StatCard icon={Target} label="Overall completion" value="72%" hint="Across 3 subjects" />
        <StatCard icon={Percent} label="Average accuracy" value="68%" hint="+4% this week" />
        <StatCard icon={Timer} label="Average score" value="212/300" hint="Last 5 mocks" />
        <StatCard icon={Flame} label="Streak" value="24 days" hint="Personal best 31" />
      </div>

      <div className="grid gap-6 xl:grid-cols-[1.5fr_1fr]">
        <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
          <h2 className="text-lg font-semibold">Performance trend</h2>
          <div className="mt-6 h-64">
            <ResponsiveContainer width="100%" height="100%">
              <AreaChart data={performanceTrend}>
                <defs>
                  <linearGradient id="score" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="0%" stopColor="var(--chart-1)" stopOpacity={0.4} />
                    <stop offset="100%" stopColor="var(--chart-1)" stopOpacity={0} />
                  </linearGradient>
                </defs>
                <CartesianGrid strokeDasharray="3 3" stroke="var(--border)" />
                <XAxis dataKey="label" stroke="var(--muted-foreground)" fontSize={12} />
                <YAxis stroke="var(--muted-foreground)" fontSize={12} />
                <Tooltip
                  contentStyle={{
                    background: "var(--card)",
                    border: "1px solid var(--border)",
                    borderRadius: "12px",
                  }}
                />
                <Area
                  type="monotone"
                  dataKey="score"
                  stroke="var(--chart-1)"
                  fill="url(#score)"
                  strokeWidth={2}
                />
                <Area
                  type="monotone"
                  dataKey="accuracy"
                  stroke="var(--chart-2)"
                  fill="transparent"
                  strokeWidth={2}
                />
              </AreaChart>
            </ResponsiveContainer>
          </div>
        </div>

        <div className="space-y-6">
          <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
            <h2 className="text-lg font-semibold">Today&apos;s practice</h2>
            <p className="mt-1 text-sm text-muted-foreground">14 of 25 questions solved</p>
            <Progress value={56} className="mt-4 h-3" />
            <Button asChild className="mt-4 w-full">
              <Link to="/daily-practice">Continue practice</Link>
            </Button>
          </div>

          <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
            <h2 className="text-lg font-semibold">Upcoming tests</h2>
            <ul className="mt-4 space-y-3">
              {mockTests.slice(0, 3).map((test) => (
                <li key={test.id} className="rounded-xl bg-secondary/60 px-4 py-3 text-sm">
                  <p className="font-medium">{test.title}</p>
                  <p className="text-xs text-muted-foreground">
                    {test.durationMinutes} min · {test.totalMarks} marks
                  </p>
                </li>
              ))}
            </ul>
          </div>
        </div>
      </div>

      <div className="grid gap-6 lg:grid-cols-3">
        <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
          <h2 className="text-lg font-semibold">Subject progress</h2>
          <div className="mt-5 space-y-4">
            {progressData.map((item) => (
              <div key={item.subject}>
                <div className="flex justify-between text-sm">
                  <span className="font-medium">{item.subject}</span>
                  <span className="text-muted-foreground">{item.completion}%</span>
                </div>
                <Progress value={item.completion} className="mt-2 h-2" />
              </div>
            ))}
          </div>
        </div>

        <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
          <h2 className="text-lg font-semibold">Strong &amp; weak areas</h2>
          <div className="mt-4 space-y-3 text-sm">
            <p className="text-xs uppercase tracking-wide text-muted-foreground">Strong</p>
            {strong.slice(0, 2).map((item) => (
              <div key={item.subject} className="flex items-center justify-between">
                <span>{item.subject}</span>
                <Badge variant="secondary">{item.accuracy}%</Badge>
              </div>
            ))}
            <p className="pt-2 text-xs uppercase tracking-wide text-muted-foreground">Weak</p>
            {weak.slice(0, 2).map((item) => (
              <div key={item.subject} className="flex items-center justify-between">
                <span>{item.subject}</span>
                <Badge variant="outline">{item.accuracy}%</Badge>
              </div>
            ))}
          </div>
        </div>

        <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
          <h2 className="flex items-center gap-2 text-lg font-semibold">
            <Activity className="size-5 text-primary" /> Recent activity
          </h2>
          <ul className="mt-4 space-y-3 text-sm">
            {results.slice(0, 4).map((result) => (
              <li key={result.id} className="flex items-center justify-between gap-3">
                <span className="truncate">{result.testTitle}</span>
                <span className="shrink-0 text-muted-foreground">
                  {result.score}/{result.totalMarks}
                </span>
              </li>
            ))}
          </ul>
        </div>
      </div>
    </div>
  );
}

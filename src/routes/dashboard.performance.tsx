import { createFileRoute } from "@tanstack/react-router";
import {
  Bar,
  BarChart,
  CartesianGrid,
  Line,
  LineChart,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from "recharts";
import { performanceTrend, progressData } from "@/data/mock";

export const Route = createFileRoute("/dashboard/performance")({
  head: () => ({
    meta: [
      { title: "Performance Analytics | ExamPathway Dashboard" },
      {
        name: "description",
        content: "Accuracy trends, subject strength and score progression across your attempts.",
      },
      { property: "og:title", content: "Performance Analytics | ExamPathway" },
      { property: "og:description", content: "Know exactly which chapter to fix next." },
    ],
  }),
  component: PerformancePage,
});

const tooltipStyle = {
  background: "var(--card)",
  border: "1px solid var(--border)",
  borderRadius: "12px",
};

function PerformancePage() {
  return (
    <div className="space-y-6">
      <h2 className="text-xl font-semibold">Performance analytics</h2>

      <div className="grid gap-6 xl:grid-cols-2">
        <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
          <h3 className="font-semibold">Accuracy over time</h3>
          <div className="mt-5 h-64">
            <ResponsiveContainer width="100%" height="100%">
              <LineChart data={performanceTrend}>
                <CartesianGrid strokeDasharray="3 3" stroke="var(--border)" />
                <XAxis dataKey="label" stroke="var(--muted-foreground)" fontSize={12} />
                <YAxis stroke="var(--muted-foreground)" fontSize={12} />
                <Tooltip contentStyle={tooltipStyle} />
                <Line
                  type="monotone"
                  dataKey="accuracy"
                  stroke="var(--chart-1)"
                  strokeWidth={2}
                />
              </LineChart>
            </ResponsiveContainer>
          </div>
        </div>

        <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
          <h3 className="font-semibold">Subject completion</h3>
          <div className="mt-5 h-64">
            <ResponsiveContainer width="100%" height="100%">
              <BarChart data={progressData}>
                <CartesianGrid strokeDasharray="3 3" stroke="var(--border)" />
                <XAxis dataKey="subject" stroke="var(--muted-foreground)" fontSize={12} />
                <YAxis stroke="var(--muted-foreground)" fontSize={12} />
                <Tooltip contentStyle={tooltipStyle} />
                <Bar dataKey="completion" fill="var(--chart-1)" radius={[8, 8, 0, 0]} />
                <Bar dataKey="accuracy" fill="var(--chart-2)" radius={[8, 8, 0, 0]} />
              </BarChart>
            </ResponsiveContainer>
          </div>
        </div>
      </div>
    </div>
  );
}

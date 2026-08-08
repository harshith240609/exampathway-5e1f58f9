import { createFileRoute } from "@tanstack/react-router";
import { Progress } from "@/components/ui/progress";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { results } from "@/data/mock";

export const Route = createFileRoute("/dashboard/mock-tests")({
  head: () => ({
    meta: [
      { title: "My Mock Tests | ExamPathway Dashboard" },
      { name: "description", content: "Review your attempted mock tests, scores and ranks." },
      { property: "og:title", content: "My Mock Tests | ExamPathway" },
      { property: "og:description", content: "Scores, accuracy and rank for every attempt." },
    ],
  }),
  component: DashboardMockTests,
});

function DashboardMockTests() {
  return (
    <div className="space-y-6">
      <h2 className="text-xl font-semibold">Mock test history</h2>
      <div className="overflow-hidden rounded-2xl border border-border bg-card shadow-soft">
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead>Test</TableHead>
              <TableHead>Date</TableHead>
              <TableHead>Score</TableHead>
              <TableHead>Accuracy</TableHead>
              <TableHead className="text-right">Rank</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {results.map((result) => (
              <TableRow key={result.id}>
                <TableCell className="max-w-[240px] truncate font-medium">
                  {result.testTitle}
                </TableCell>
                <TableCell>{result.takenAt}</TableCell>
                <TableCell>
                  {result.score}/{result.totalMarks}
                </TableCell>
                <TableCell>
                  <div className="flex items-center gap-2">
                    <Progress value={result.accuracy} className="h-2 w-16" />
                    {result.accuracy}%
                  </div>
                </TableCell>
                <TableCell className="text-right">#{result.rank}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </div>
    </div>
  );
}

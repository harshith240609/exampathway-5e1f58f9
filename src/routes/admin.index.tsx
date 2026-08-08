import { createFileRoute } from "@tanstack/react-router";
import { BookOpen, Megaphone, Timer, Users } from "lucide-react";
import { StatCard } from "@/components/common/stat-card";
import { Badge } from "@/components/ui/badge";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { announcements, mockTests, questions } from "@/data/mock";

export const Route = createFileRoute("/admin/")({
  head: () => ({
    meta: [
      { title: "Admin Console | ExamPathway" },
      {
        name: "description",
        content: "Manage questions, mock tests, announcements and students on ExamPathway.",
      },
      { property: "og:title", content: "Admin Console | ExamPathway" },
      { property: "og:description", content: "Platform overview for administrators." },
    ],
  }),
  component: AdminOverview,
});

function AdminOverview() {
  return (
    <div className="space-y-6">
      <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
        <StatCard icon={Users} label="Active students" value="10,482" hint="+312 this week" />
        <StatCard icon={BookOpen} label="Questions" value={`${questions.length}+`} hint="Across all courses" />
        <StatCard icon={Timer} label="Mock tests" value={String(mockTests.length)} hint="Published" />
        <StatCard icon={Megaphone} label="Announcements" value={String(announcements.length)} hint="Live" />
      </div>

      <div className="overflow-hidden rounded-2xl border border-border bg-card shadow-soft">
        <div className="border-b border-border px-6 py-4">
          <h2 className="font-semibold">Recently added questions</h2>
        </div>
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead>Question</TableHead>
              <TableHead>Subject</TableHead>
              <TableHead>Chapter</TableHead>
              <TableHead className="text-right">Difficulty</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {questions.slice(0, 8).map((question) => (
              <TableRow key={question.id}>
                <TableCell className="max-w-[320px] truncate">{question.text}</TableCell>
                <TableCell>{question.subject}</TableCell>
                <TableCell>{question.chapter}</TableCell>
                <TableCell className="text-right">
                  <Badge variant="outline">{question.difficulty}</Badge>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </div>
    </div>
  );
}

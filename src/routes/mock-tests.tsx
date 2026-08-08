import { createFileRoute } from "@tanstack/react-router";
import { CheckCircle2, ListChecks, PlayCircle, Timer, Trophy } from "lucide-react";
import { useState } from "react";
import { toast } from "sonner";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { Progress } from "@/components/ui/progress";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { courses, leaderboard, mockTests, results } from "@/data/mock";
import type { MockTest } from "@/types";

export const Route = createFileRoute("/mock-tests")({
  head: () => ({
    meta: [
      { title: "Mock Tests — Exam-Accurate Test Series | ExamPathway" },
      {
        name: "description",
        content:
          "Attempt full syllabus and sectional mock tests for JEE, NEET, BITSAT, EAMCET and EAPCET with instant analysis and all-India ranking.",
      },
      { property: "og:title", content: "ExamPathway Mock Tests" },
      {
        property: "og:description",
        content: "500+ mock tests with real exam interface, timers and detailed analysis.",
      },
    ],
  }),
  component: MockTestsPage,
});

function MockTestsPage() {
  const [active, setActive] = useState<MockTest | null>(null);

  return (
    <SiteLayout>
      <PageHeader
        title="Mock Test Series"
        description="Simulate the real exam: same duration, marking scheme and interface. Get section-wise analysis and all-India rank within hours."
      />

      <section className="section-container py-12">
        <Tabs defaultValue={courses[0]!.slug}>
          <TabsList className="flex flex-wrap">
            {courses.map((course) => (
              <TabsTrigger key={course.slug} value={course.slug}>
                {course.name}
              </TabsTrigger>
            ))}
          </TabsList>

          {courses.map((course) => (
            <TabsContent key={course.slug} value={course.slug} className="mt-8 space-y-4">
              {mockTests
                .filter((test) => test.courseSlug === course.slug)
                .map((test) => (
                  <article
                    key={test.id}
                    className="card-hover flex flex-col gap-4 rounded-2xl border border-border bg-card p-5 shadow-soft md:flex-row md:items-center"
                  >
                    <div className="flex-1 space-y-2">
                      <div className="flex flex-wrap items-center gap-2">
                        <h3 className="font-semibold">{test.title}</h3>
                        <Badge variant={test.published ? "secondary" : "outline"}>
                          {test.published ? "Live" : "Coming soon"}
                        </Badge>
                      </div>
                      <p className="flex flex-wrap gap-4 text-sm text-muted-foreground">
                        <span className="flex items-center gap-1.5">
                          <Timer className="size-4" /> {test.durationMinutes} min
                        </span>
                        <span className="flex items-center gap-1.5">
                          <ListChecks className="size-4" /> {test.questionCount} questions
                        </span>
                        <span className="flex items-center gap-1.5">
                          <Trophy className="size-4" /> {test.totalMarks} marks
                        </span>
                        <span>{test.attempts.toLocaleString("en-IN")} attempts</span>
                      </p>
                    </div>
                    <div className="flex gap-2">
                      <Button onClick={() => setActive(test)} disabled={!test.published}>
                        <PlayCircle className="size-4" /> Start test
                      </Button>
                      <Button
                        variant="outline"
                        onClick={() => toast.info("Resume is available for saved attempts.")}
                      >
                        Resume
                      </Button>
                    </div>
                  </article>
                ))}
            </TabsContent>
          ))}
        </Tabs>
      </section>

      <section className="section-container pb-12">
        <div className="grid gap-6 lg:grid-cols-[1.4fr_1fr]">
          <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
            <h2 className="text-lg font-semibold">Your recent attempts</h2>
            <Table className="mt-4">
              <TableHeader>
                <TableRow>
                  <TableHead>Test</TableHead>
                  <TableHead>Score</TableHead>
                  <TableHead>Accuracy</TableHead>
                  <TableHead className="text-right">Rank</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {results.slice(0, 6).map((result) => (
                  <TableRow key={result.id}>
                    <TableCell className="max-w-[220px] truncate font-medium">
                      {result.testTitle}
                    </TableCell>
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

          <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
            <h2 className="text-lg font-semibold">Test leaderboard</h2>
            <div className="mt-4 space-y-3">
              {leaderboard.slice(0, 6).map((entry) => (
                <div key={entry.id} className="flex items-center gap-3">
                  <span className="flex size-8 items-center justify-center rounded-lg bg-primary-soft text-sm font-bold text-accent-foreground">
                    {entry.rank}
                  </span>
                  <span className="flex-1 truncate text-sm font-medium">{entry.name}</span>
                  <span className="text-sm text-muted-foreground">
                    {entry.accuracy.toFixed(1)}%
                  </span>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      <Dialog open={Boolean(active)} onOpenChange={(open) => !open && setActive(null)}>
        <DialogContent>
          <DialogHeader>
            <DialogTitle>{active?.title}</DialogTitle>
            <DialogDescription>
              Read the instructions carefully before you begin.
            </DialogDescription>
          </DialogHeader>
          <ul className="space-y-2.5">
            {active?.instructions.map((instruction) => (
              <li key={instruction} className="flex gap-2 text-sm text-muted-foreground">
                <CheckCircle2 className="mt-0.5 size-4 shrink-0 text-success" />
                {instruction}
              </li>
            ))}
          </ul>
          <DialogFooter>
            <Button variant="outline" onClick={() => setActive(null)}>
              Cancel
            </Button>
            <Button
              onClick={() => {
                toast.success("Test started. Good luck!");
                setActive(null);
              }}
            >
              Start now
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </SiteLayout>
  );
}

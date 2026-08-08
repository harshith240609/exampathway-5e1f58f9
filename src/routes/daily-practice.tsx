import { createFileRoute } from "@tanstack/react-router";
import { CalendarCheck, Flame, Sparkles, Target, Trophy } from "lucide-react";
import { useState } from "react";
import { toast } from "sonner";
import { StatCard } from "@/components/common/stat-card";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";
import { questions } from "@/data/mock";

const badges = [
  { label: "7 day streak", earned: true },
  { label: "500 questions", earned: true },
  { label: "Accuracy 80%+", earned: true },
  { label: "Full syllabus mock", earned: false },
  { label: "30 day streak", earned: false },
];

export const Route = createFileRoute("/daily-practice")({
  head: () => ({
    meta: [
      { title: "Daily Practice — Streaks, XP & Daily Targets | ExamPathway" },
      {
        name: "description",
        content:
          "Build consistency with a daily quiz, streak counter, XP rewards and a personalised daily question target.",
      },
      { property: "og:title", content: "Daily Practice on ExamPathway" },
      {
        property: "og:description",
        content: "A calibrated daily target that keeps your preparation on track.",
      },
    ],
  }),
  component: DailyPracticePage,
});

function DailyPracticePage() {
  const [solved, setSolved] = useState(14);
  const target = 25;
  const todayQuestions = questions.slice(0, 5);

  return (
    <SiteLayout>
      <PageHeader
        title="Daily Practice"
        description="Twenty five questions a day beats a twelve hour weekend cram. Keep the streak alive and watch your accuracy climb."
      />

      <section className="section-container py-12 space-y-10">
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          <StatCard icon={Flame} label="Current streak" value="24 days" hint="Personal best: 31" />
          <StatCard icon={Sparkles} label="Total XP" value="12,480" hint="+180 today" />
          <StatCard icon={Target} label="Daily target" value={`${solved}/${target}`} />
          <StatCard icon={Trophy} label="Weekly rank" value="#182" hint="Up 34 places" />
        </div>

        <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
          <div className="flex flex-wrap items-center justify-between gap-3">
            <div>
              <h2 className="text-lg font-semibold">Today&apos;s progress</h2>
              <p className="text-sm text-muted-foreground">
                {target - solved > 0
                  ? `${target - solved} questions left to complete today's target.`
                  : "Target complete. Excellent work!"}
              </p>
            </div>
            <Button
              onClick={() => {
                setSolved((current) => Math.min(target, current + 1));
                toast.success("+20 XP earned");
              }}
            >
              Solve next question
            </Button>
          </div>
          <Progress value={(solved / target) * 100} className="mt-5 h-3" />
        </div>

        <div className="grid gap-6 lg:grid-cols-[1.4fr_1fr]">
          <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
            <h2 className="text-lg font-semibold">Today&apos;s quiz</h2>
            <div className="mt-4 space-y-3">
              {todayQuestions.map((question, index) => (
                <div
                  key={question.id}
                  className="flex items-start gap-3 rounded-xl border border-border p-4"
                >
                  <span className="flex size-7 shrink-0 items-center justify-center rounded-lg bg-primary-soft text-xs font-bold text-accent-foreground">
                    {index + 1}
                  </span>
                  <div>
                    <p className="text-sm font-medium leading-relaxed">{question.text}</p>
                    <p className="mt-1 text-xs text-muted-foreground">
                      {question.subject} · {question.chapter} · {question.difficulty}
                    </p>
                  </div>
                </div>
              ))}
            </div>
          </div>

          <div className="space-y-6">
            <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
              <h2 className="flex items-center gap-2 text-lg font-semibold">
                <CalendarCheck className="size-5 text-primary" /> Study planner
              </h2>
              <ul className="mt-4 space-y-3 text-sm">
                {[
                  "Physics · Rotational Motion revision",
                  "Chemistry · Coordination Compounds practice",
                  "Mathematics · Probability PYQs",
                ].map((item) => (
                  <li key={item} className="rounded-xl bg-secondary/60 px-4 py-3">
                    {item}
                  </li>
                ))}
              </ul>
            </div>

            <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
              <h2 className="text-lg font-semibold">Achievement badges</h2>
              <div className="mt-4 flex flex-wrap gap-2">
                {badges.map((badge) => (
                  <Badge
                    key={badge.label}
                    variant={badge.earned ? "default" : "outline"}
                    className={badge.earned ? "" : "opacity-60"}
                  >
                    {badge.label}
                  </Badge>
                ))}
              </div>
            </div>
          </div>
        </div>
      </section>
    </SiteLayout>
  );
}

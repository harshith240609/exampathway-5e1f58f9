import { createFileRoute } from "@tanstack/react-router";
import { Award, Flame, Medal, Star, Target, Zap } from "lucide-react";

const achievements = [
  { icon: Flame, title: "24 day streak", description: "Practised every day for 24 days.", earned: true },
  { icon: Target, title: "1,000 questions", description: "Solved 1,000 practice questions.", earned: true },
  { icon: Star, title: "Accuracy 80%+", description: "Maintained 80% accuracy for a week.", earned: true },
  { icon: Medal, title: "Top 200 weekly", description: "Finished inside the weekly top 200.", earned: true },
  { icon: Zap, title: "Speed demon", description: "Averaged under 60 seconds per question.", earned: false },
  { icon: Award, title: "Mock marathon", description: "Complete 10 full syllabus mocks.", earned: false },
];

export const Route = createFileRoute("/dashboard/achievements")({
  head: () => ({
    meta: [
      { title: "Achievements & Badges | ExamPathway Dashboard" },
      { name: "description", content: "Badges you have earned and milestones still ahead." },
      { property: "og:title", content: "Achievements | ExamPathway" },
      { property: "og:description", content: "Track streaks, milestones and badges." },
    ],
  }),
  component: AchievementsPage,
});

function AchievementsPage() {
  return (
    <div className="space-y-6">
      <h2 className="text-xl font-semibold">Achievements</h2>
      <div className="grid gap-5 sm:grid-cols-2 xl:grid-cols-3">
        {achievements.map((achievement) => (
          <div
            key={achievement.title}
            className={
              achievement.earned
                ? "rounded-2xl border border-border bg-card p-6 shadow-soft"
                : "rounded-2xl border border-dashed border-border bg-card/60 p-6 opacity-70"
            }
          >
            <span className="flex size-11 items-center justify-center rounded-xl bg-primary-soft text-accent-foreground">
              <achievement.icon className="size-5" />
            </span>
            <h3 className="mt-4 font-semibold">{achievement.title}</h3>
            <p className="mt-1 text-sm text-muted-foreground">{achievement.description}</p>
          </div>
        ))}
      </div>
    </div>
  );
}

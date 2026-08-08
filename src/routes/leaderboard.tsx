import { createFileRoute } from "@tanstack/react-router";
import { Medal } from "lucide-react";
import { useState } from "react";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";
import { Avatar, AvatarFallback } from "@/components/ui/avatar";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { leaderboard } from "@/data/mock";

const scopes = ["Weekly", "Monthly", "Overall"] as const;

export const Route = createFileRoute("/leaderboard")({
  head: () => ({
    meta: [
      { title: "Leaderboard — Weekly, Monthly & Overall Rankings | ExamPathway" },
      {
        name: "description",
        content:
          "See the top performing aspirants by XP, tests attempted and accuracy across weekly, monthly and all-time leaderboards.",
      },
      { property: "og:title", content: "ExamPathway Leaderboard" },
      {
        property: "og:description",
        content: "Compete with thousands of aspirants and track your rank.",
      },
    ],
  }),
  component: LeaderboardPage,
});

function LeaderboardPage() {
  const [scope, setScope] = useState<string>("Weekly");
  const multiplier = scope === "Weekly" ? 1 : scope === "Monthly" ? 3.4 : 9.6;

  return (
    <SiteLayout>
      <PageHeader
        title="Leaderboard"
        description="Rankings update every hour based on XP earned, tests attempted and answer accuracy."
      />

      <section className="section-container py-12">
        <Tabs value={scope} onValueChange={setScope}>
          <TabsList>
            {scopes.map((item) => (
              <TabsTrigger key={item} value={item}>
                {item}
              </TabsTrigger>
            ))}
          </TabsList>
        </Tabs>

        <div className="mt-8 grid gap-4 sm:grid-cols-3">
          {leaderboard.slice(0, 3).map((entry) => (
            <div
              key={entry.id}
              className="rounded-2xl border border-border bg-card p-6 text-center shadow-soft"
            >
              <Medal
                className={
                  entry.rank === 1
                    ? "mx-auto size-8 text-brand-orange"
                    : "mx-auto size-8 text-muted-foreground"
                }
              />
              <p className="mt-3 font-semibold">{entry.name}</p>
              <p className="text-sm text-muted-foreground">Rank #{entry.rank}</p>
              <p className="mt-3 text-2xl font-bold text-primary">
                {Math.round(entry.xp * multiplier).toLocaleString("en-IN")} XP
              </p>
            </div>
          ))}
        </div>

        <div className="mt-8 overflow-hidden rounded-2xl border border-border bg-card shadow-soft">
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead className="w-16">Rank</TableHead>
                <TableHead>Student</TableHead>
                <TableHead>XP</TableHead>
                <TableHead>Tests</TableHead>
                <TableHead className="text-right">Accuracy</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {leaderboard.map((entry) => (
                <TableRow key={entry.id}>
                  <TableCell className="font-semibold">#{entry.rank}</TableCell>
                  <TableCell>
                    <div className="flex items-center gap-3">
                      <Avatar className="size-8">
                        <AvatarFallback className="text-xs">
                          {entry.name
                            .split(" ")
                            .map((part) => part[0])
                            .join("")}
                        </AvatarFallback>
                      </Avatar>
                      <span className="font-medium">{entry.name}</span>
                    </div>
                  </TableCell>
                  <TableCell>
                    {Math.round(entry.xp * multiplier).toLocaleString("en-IN")}
                  </TableCell>
                  <TableCell>{entry.testsAttempted}</TableCell>
                  <TableCell className="text-right">{entry.accuracy.toFixed(1)}%</TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </div>
      </section>
    </SiteLayout>
  );
}

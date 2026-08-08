import { createFileRoute } from "@tanstack/react-router";
import { toast } from "sonner";
import { Button } from "@/components/ui/button";
import { Label } from "@/components/ui/label";
import { Switch } from "@/components/ui/switch";
import { useTheme } from "@/contexts/theme-context";

export const Route = createFileRoute("/dashboard/settings")({
  head: () => ({
    meta: [
      { title: "Settings | ExamPathway Dashboard" },
      { name: "description", content: "Manage appearance, notifications and account settings." },
      { property: "og:title", content: "Settings | ExamPathway" },
      { property: "og:description", content: "Control how ExamPathway works for you." },
    ],
  }),
  component: SettingsPage,
});

function SettingsPage() {
  const { theme, toggleTheme } = useTheme();

  return (
    <div className="max-w-2xl space-y-6">
      <h2 className="text-xl font-semibold">Settings</h2>
      <div className="space-y-5 rounded-2xl border border-border bg-card p-6 shadow-soft">
        <div className="flex items-center justify-between">
          <Label htmlFor="dark">Dark mode</Label>
          <Switch id="dark" checked={theme === "dark"} onCheckedChange={toggleTheme} />
        </div>
        <div className="flex items-center justify-between">
          <Label htmlFor="reminders">Daily practice reminders</Label>
          <Switch id="reminders" defaultChecked />
        </div>
        <div className="flex items-center justify-between">
          <Label htmlFor="emails">Exam update emails</Label>
          <Switch id="emails" defaultChecked />
        </div>
        <Button variant="outline" onClick={() => toast.success("Preferences saved")}>
          Save preferences
        </Button>
      </div>
    </div>
  );
}

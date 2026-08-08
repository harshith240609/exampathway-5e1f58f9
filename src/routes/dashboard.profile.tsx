import { createFileRoute } from "@tanstack/react-router";
import { toast } from "sonner";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { useAuth } from "@/contexts/auth-context";

export const Route = createFileRoute("/dashboard/profile")({
  head: () => ({
    meta: [
      { title: "My Profile | ExamPathway Dashboard" },
      { name: "description", content: "Update your name, email and target exam details." },
      { property: "og:title", content: "My Profile | ExamPathway" },
      { property: "og:description", content: "Manage your student profile." },
    ],
  }),
  component: ProfilePage,
});

function ProfilePage() {
  const { user } = useAuth();

  return (
    <div className="max-w-2xl space-y-6">
      <h2 className="text-xl font-semibold">Profile</h2>
      <form
        className="space-y-5 rounded-2xl border border-border bg-card p-6 shadow-soft"
        onSubmit={(event) => {
          event.preventDefault();
          toast.success("Profile updated");
        }}
      >
        <div className="space-y-2">
          <Label htmlFor="name">Full name</Label>
          <Input id="name" defaultValue={user?.name ?? ""} />
        </div>
        <div className="space-y-2">
          <Label htmlFor="email">Email</Label>
          <Input id="email" type="email" defaultValue={user?.email ?? ""} />
        </div>
        <div className="space-y-2">
          <Label htmlFor="target">Target exam</Label>
          <Input id="target" defaultValue="JEE Main 2027" />
        </div>
        <Button type="submit">Save changes</Button>
      </form>
    </div>
  );
}

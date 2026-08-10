import { createFileRoute } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { toast } from "sonner";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { useAuth } from "@/contexts/auth-context";
import { updateMyProfile } from "@/lib/study.functions";
import { CLASS_LEVELS } from "@/types";

export const Route = createFileRoute("/dashboard/profile")({
  head: () => ({
    meta: [
      { title: "My Profile | ExamPathway" },
      { name: "description", content: "Update your ExamPathway name and class." },
      { property: "og:title", content: "My ExamPathway profile" },
      { property: "og:description", content: "Update your name and class." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: ProfilePage,
});

function ProfilePage() {
  const { user, profile, refreshProfile } = useAuth();
  const [form, setForm] = useState({ full_name: "", class_level: "" });
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    if (profile) {
      setForm({ full_name: profile.full_name ?? "", class_level: profile.class_level ?? "" });
    }
  }, [profile]);

  return (
    <form
      className="max-w-xl space-y-5 rounded-2xl border border-border bg-card p-5"
      onSubmit={async (event) => {
        event.preventDefault();
        setSaving(true);
        try {
          await updateMyProfile({ data: form });
          await refreshProfile();
          toast.success("Profile updated.");
        } catch (error) {
          toast.error(error instanceof Error ? error.message : "Could not update profile.");
        } finally {
          setSaving(false);
        }
      }}
    >
      <div className="space-y-2">
        <Label htmlFor="full_name">Full name</Label>
        <Input
          id="full_name"
          required
          maxLength={120}
          value={form.full_name}
          onChange={(event) => setForm({ ...form, full_name: event.target.value })}
        />
      </div>
      <div className="space-y-2">
        <Label htmlFor="class_level">Class</Label>
        <Select
          value={form.class_level}
          onValueChange={(value) => setForm({ ...form, class_level: value })}
        >
          <SelectTrigger id="class_level">
            <SelectValue placeholder="Select your class" />
          </SelectTrigger>
          <SelectContent>
            {CLASS_LEVELS.map((level) => (
              <SelectItem key={level} value={level}>
                {level}
              </SelectItem>
            ))}
          </SelectContent>
        </Select>
      </div>
      <div className="space-y-2">
        <Label htmlFor="email">Email</Label>
        <Input id="email" value={user?.email ?? ""} readOnly disabled />
      </div>
      <Button type="submit" disabled={saving}>
        {saving ? "Saving..." : "Save changes"}
      </Button>
    </form>
  );
}

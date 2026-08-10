import { createFileRoute, Link, useNavigate } from "@tanstack/react-router";
import { useState } from "react";
import { toast } from "sonner";
import { AuthLayout, GoogleButton } from "@/components/layout/auth-layout";
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
import { CLASS_LEVELS } from "@/types";

export const Route = createFileRoute("/register")({
  head: () => ({
    meta: [
      { title: "Create Your Free ExamPathway Account" },
      {
        name: "description",
        content:
          "Sign up free for chapter-wise question banks, previous year questions and mock tests for JEE Main, JEE Advanced, BITSAT, NEET and EAPCET.",
      },
      { property: "og:title", content: "Register on ExamPathway" },
      { property: "og:description", content: "Start preparing with a free student account." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: RegisterPage,
});

function RegisterPage() {
  const { signUp, signInWithGoogle } = useAuth();
  const navigate = useNavigate();
  const [form, setForm] = useState({
    fullName: "",
    classLevel: "",
    email: "",
    password: "",
  });
  const [loading, setLoading] = useState(false);

  return (
    <AuthLayout
      title="Create your account"
      description="Free plan: 25 questions per subject and one mock test per course."
      footer={
        <>
          Already registered?{" "}
          <Link to="/login" className="font-semibold text-primary hover:underline">
            Sign in
          </Link>
        </>
      }
    >
      <div className="space-y-5">
        <GoogleButton
          label="Sign up with Google"
          disabled={loading}
          onClick={async () => {
            const { error } = await signInWithGoogle();
            if (error) toast.error(error);
          }}
        />
        <div className="flex items-center gap-3 text-xs uppercase text-muted-foreground">
          <span className="h-px flex-1 bg-border" /> or <span className="h-px flex-1 bg-border" />
        </div>

        <form
          className="space-y-5"
          onSubmit={async (event) => {
            event.preventDefault();
            if (!form.classLevel) {
              toast.error("Please select your class.");
              return;
            }
            setLoading(true);
            const { error, needsConfirmation } = await signUp(form);
            setLoading(false);
            if (error) {
              toast.error(error);
              return;
            }
            if (needsConfirmation) {
              toast.success("Check your email to confirm your account.");
              return;
            }
            toast.success("Account created. Welcome to ExamPathway!");
            void navigate({ to: "/dashboard" });
          }}
        >
          <div className="space-y-2">
            <Label htmlFor="name">Full name</Label>
            <Input
              id="name"
              required
              maxLength={120}
              value={form.fullName}
              onChange={(event) => setForm({ ...form, fullName: event.target.value })}
            />
          </div>
          <div className="space-y-2">
            <Label htmlFor="class">Class</Label>
            <Select
              value={form.classLevel}
              onValueChange={(value) => setForm({ ...form, classLevel: value })}
            >
              <SelectTrigger id="class">
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
            <Input
              id="email"
              type="email"
              required
              autoComplete="email"
              value={form.email}
              onChange={(event) => setForm({ ...form, email: event.target.value })}
            />
          </div>
          <div className="space-y-2">
            <Label htmlFor="password">Password</Label>
            <Input
              id="password"
              type="password"
              required
              minLength={6}
              autoComplete="new-password"
              value={form.password}
              onChange={(event) => setForm({ ...form, password: event.target.value })}
            />
          </div>
          <Button type="submit" size="lg" className="w-full" disabled={loading}>
            {loading ? "Creating account..." : "Create account"}
          </Button>
        </form>
      </div>
    </AuthLayout>
  );
}

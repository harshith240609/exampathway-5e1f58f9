import { createFileRoute, Link, useNavigate } from "@tanstack/react-router";
import { useState } from "react";
import { toast } from "sonner";
import { AuthLayout, GoogleButton } from "@/components/layout/auth-layout";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { useAuth } from "@/contexts/auth-context";

export const Route = createFileRoute("/login")({
  head: () => ({
    meta: [
      { title: "Sign In to ExamPathway" },
      {
        name: "description",
        content:
          "Sign in to ExamPathway to continue your JEE, NEET, BITSAT or EAPCET preparation with chapter-wise questions and mock tests.",
      },
      { property: "og:title", content: "Sign in to ExamPathway" },
      { property: "og:description", content: "Continue your entrance exam preparation." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: LoginPage,
});

function LoginPage() {
  const { signIn, signInWithGoogle } = useAuth();
  const navigate = useNavigate();
  const [form, setForm] = useState({ email: "", password: "" });
  const [loading, setLoading] = useState(false);

  return (
    <AuthLayout
      title="Welcome back"
      description="Sign in to continue your preparation."
      footer={
        <>
          New to ExamPathway?{" "}
          <Link to="/register" className="font-semibold text-primary hover:underline">
            Create a free account
          </Link>
        </>
      }
    >
      <div className="space-y-5">
        <GoogleButton
          label="Continue with Google"
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
            setLoading(true);
            const { error } = await signIn(form.email, form.password);
            setLoading(false);
            if (error) {
              toast.error(error);
              return;
            }
            toast.success("Signed in.");
            void navigate({ to: "/dashboard" });
          }}
        >
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
            <div className="flex items-center justify-between">
              <Label htmlFor="password">Password</Label>
              <Link to="/forgot-password" className="text-xs text-primary hover:underline">
                Forgot password?
              </Link>
            </div>
            <Input
              id="password"
              type="password"
              required
              autoComplete="current-password"
              value={form.password}
              onChange={(event) => setForm({ ...form, password: event.target.value })}
            />
          </div>
          <Button type="submit" size="lg" className="w-full" disabled={loading}>
            {loading ? "Signing in..." : "Sign in"}
          </Button>
        </form>
      </div>
    </AuthLayout>
  );
}

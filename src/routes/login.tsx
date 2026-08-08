import { createFileRoute, Link, useNavigate } from "@tanstack/react-router";
import { useState } from "react";
import { toast } from "sonner";
import { AuthLayout } from "@/components/layout/auth-layout";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { useAuth } from "@/contexts/auth-context";

export const Route = createFileRoute("/login")({
  head: () => ({
    meta: [
      { title: "Student Login | ExamPathway" },
      {
        name: "description",
        content:
          "Sign in to your ExamPathway account to continue practising, attempt mock tests and track your performance.",
      },
      { property: "og:title", content: "Login to ExamPathway" },
      { property: "og:description", content: "Access your question bank, mocks and analytics." },
    ],
  }),
  component: LoginPage,
});

function LoginPage() {
  const { login } = useAuth();
  const navigate = useNavigate();
  const [email, setEmail] = useState("student@exampathway.com");
  const [password, setPassword] = useState("password");
  const [loading, setLoading] = useState(false);

  return (
    <AuthLayout
      title="Welcome back"
      description="Sign in to continue your preparation."
      footer={
        <>
          New to ExamPathway?{" "}
          <Link to="/register" className="font-semibold text-primary hover:underline">
            Create an account
          </Link>
        </>
      }
    >
      <form
        className="space-y-5"
        onSubmit={async (event) => {
          event.preventDefault();
          setLoading(true);
          const result = await login({ email, password });
          setLoading(false);
          if (result.error || !result.user) {
            toast.error(result.error ?? "Unable to sign in.");
            return;
          }
          toast.success(`Welcome back, ${result.user.name}`);
          void navigate({ to: result.user.role === "admin" ? "/admin" : "/dashboard" });
        }}
      >
        <div className="space-y-2">
          <Label htmlFor="email">Email</Label>
          <Input
            id="email"
            type="email"
            required
            value={email}
            onChange={(event) => setEmail(event.target.value)}
          />
        </div>
        <div className="space-y-2">
          <div className="flex items-center justify-between">
            <Label htmlFor="password">Password</Label>
            <Link
              to="/forgot-password"
              className="text-xs font-medium text-primary hover:underline"
            >
              Forgot password?
            </Link>
          </div>
          <Input
            id="password"
            type="password"
            required
            value={password}
            onChange={(event) => setPassword(event.target.value)}
          />
        </div>
        <Button type="submit" size="lg" className="w-full" disabled={loading}>
          {loading ? "Signing in..." : "Sign in"}
        </Button>
      </form>

      <div className="mt-6 rounded-xl border border-dashed border-border p-4 text-xs text-muted-foreground">
        <p className="font-semibold text-foreground">Demo accounts</p>
        <p className="mt-1">Student: student@exampathway.com</p>
        <p>Admin: admin@exampathway.com</p>
      </div>
    </AuthLayout>
  );
}

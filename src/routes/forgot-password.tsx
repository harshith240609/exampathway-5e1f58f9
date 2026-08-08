import { createFileRoute, Link } from "@tanstack/react-router";
import { useState } from "react";
import { toast } from "sonner";
import { AuthLayout } from "@/components/layout/auth-layout";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { useAuth } from "@/contexts/auth-context";

export const Route = createFileRoute("/forgot-password")({
  head: () => ({
    meta: [
      { title: "Reset Your ExamPathway Password" },
      {
        name: "description",
        content:
          "Enter your registered email address and we will send you a secure link to reset your ExamPathway password.",
      },
      { property: "og:title", content: "Reset password — ExamPathway" },
      { property: "og:description", content: "Recover access to your student account." },
    ],
  }),
  component: ForgotPasswordPage,
});

function ForgotPasswordPage() {
  const { forgotPassword } = useAuth();
  const [email, setEmail] = useState("");
  const [sent, setSent] = useState(false);
  const [loading, setLoading] = useState(false);

  return (
    <AuthLayout
      title="Forgot your password?"
      description="We will email you a secure reset link."
      footer={
        <>
          Remembered it?{" "}
          <Link to="/login" className="font-semibold text-primary hover:underline">
            Back to login
          </Link>
        </>
      }
    >
      {sent ? (
        <div className="rounded-2xl border border-border bg-card p-6 text-sm text-muted-foreground">
          If an account exists for <span className="font-medium text-foreground">{email}</span>,
          a reset link is on its way. Check your inbox and spam folder.
        </div>
      ) : (
        <form
          className="space-y-5"
          onSubmit={async (event) => {
            event.preventDefault();
            setLoading(true);
            const message = await forgotPassword(email);
            setLoading(false);
            setSent(true);
            toast.success(message);
          }}
        >
          <div className="space-y-2">
            <Label htmlFor="email">Registered email</Label>
            <Input
              id="email"
              type="email"
              required
              value={email}
              onChange={(event) => setEmail(event.target.value)}
            />
          </div>
          <Button type="submit" size="lg" className="w-full" disabled={loading}>
            {loading ? "Sending link..." : "Send reset link"}
          </Button>
        </form>
      )}
    </AuthLayout>
  );
}

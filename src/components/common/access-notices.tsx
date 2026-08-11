import { Link } from "@tanstack/react-router";
import { MailCheck, UserPlus } from "lucide-react";
import { useState } from "react";
import { toast } from "sonner";
import { Button } from "@/components/ui/button";
import { useAuth } from "@/contexts/auth-context";

/** Prompts an anonymous visitor to create a free account. */
export function CreateAccountNotice({ description }: { description: string }) {
  return (
    <div className="rounded-2xl border border-border bg-card p-6">
      <span className="flex size-11 items-center justify-center rounded-xl bg-primary-soft text-accent-foreground">
        <UserPlus className="size-5" />
      </span>
      <h2 className="mt-4 text-lg font-semibold">Create your free account to access free practice.</h2>
      <p className="mt-2 text-sm text-muted-foreground">{description}</p>
      <div className="mt-4 flex flex-wrap gap-2">
        <Button asChild>
          <Link to="/register">Create free account</Link>
        </Button>
        <Button asChild variant="outline">
          <Link to="/login">Sign in</Link>
        </Button>
      </div>
    </div>
  );
}

/** Blocks free content until the signed-in student confirms their email address. */
export function VerifyEmailNotice() {
  const { resendVerification } = useAuth();
  const [sending, setSending] = useState(false);

  return (
    <div className="rounded-2xl border border-border bg-card p-6">
      <span className="flex size-11 items-center justify-center rounded-xl bg-primary-soft text-accent-foreground">
        <MailCheck className="size-5" />
      </span>
      <h2 className="mt-4 text-lg font-semibold">
        Please verify your email address to activate your free ExamPathway account.
      </h2>
      <p className="mt-2 text-sm text-muted-foreground">
        We sent you a verification link. Open it, then return here — your free practice allocation
        activates immediately.
      </p>
      <Button
        className="mt-4"
        variant="outline"
        disabled={sending}
        onClick={async () => {
          setSending(true);
          const { error } = await resendVerification();
          setSending(false);
          if (error) toast.error(error);
          else toast.success("Verification email sent.");
        }}
      >
        {sending ? "Sending..." : "Resend verification email"}
      </Button>
    </div>
  );
}

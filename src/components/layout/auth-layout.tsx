import { Link } from "@tanstack/react-router";
import { GraduationCap } from "lucide-react";
import type { ReactNode } from "react";
import { PageTransition } from "@/components/common/motion";

export function AuthLayout({
  title,
  description,
  children,
  footer,
}: {
  title: string;
  description: string;
  children: ReactNode;
  footer: ReactNode;
}) {
  return (
    <div className="grid min-h-screen lg:grid-cols-2">
      <div className="relative hidden flex-col justify-between bg-gradient-hero p-12 text-primary-foreground lg:flex">
        <Link to="/" className="flex items-center gap-2">
          <span className="flex size-9 items-center justify-center rounded-xl bg-primary-foreground/15">
            <GraduationCap className="size-5" />
          </span>
          <span className="text-lg font-bold">ExamPathway</span>
        </Link>
        <div className="space-y-4">
          <h2 className="text-4xl font-bold leading-tight">
            Your complete entrance exam preparation platform
          </h2>
          <p className="max-w-md text-sm opacity-90">
            Chapter-wise question banks, previous year questions and full-length mock tests for
            JEE Main, JEE Advanced, BITSAT, NEET and EAPCET.
          </p>
        </div>
        <p className="text-xs opacity-75">
          Free plan includes 25 questions per subject and one mock test per course.
        </p>
      </div>

      <div className="flex items-center justify-center px-5 py-10 sm:px-6 sm:py-12">
        <PageTransition>
          <div className="w-full max-w-md">
            <Link to="/" className="mb-8 flex items-center gap-2 lg:hidden">
              <span className="flex size-9 items-center justify-center rounded-xl bg-gradient-hero text-primary-foreground">
                <GraduationCap className="size-5" />
              </span>
              <span className="text-lg font-bold">ExamPathway</span>
            </Link>
            <h1 className="text-2xl font-bold sm:text-3xl">{title}</h1>
            <p className="mt-2 text-sm text-muted-foreground">{description}</p>
            <div className="mt-8">{children}</div>
            <div className="mt-6 text-sm text-muted-foreground">{footer}</div>
          </div>
        </PageTransition>
      </div>
    </div>
  );
}

export function GoogleButton({
  onClick,
  disabled,
  label,
}: {
  onClick: () => void;
  disabled?: boolean;
  label: string;
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      disabled={disabled}
      className="flex w-full items-center justify-center gap-3 rounded-lg border border-border bg-card px-4 py-2.5 text-sm font-medium transition-colors hover:bg-secondary disabled:opacity-60"
    >
      <svg viewBox="0 0 24 24" className="size-4" aria-hidden="true">
        <path
          fill="#4285F4"
          d="M23.5 12.3c0-.8-.1-1.6-.2-2.3H12v4.5h6.5a5.6 5.6 0 0 1-2.4 3.7v3h3.9c2.3-2.1 3.5-5.2 3.5-8.9z"
        />
        <path
          fill="#34A853"
          d="M12 24c3.2 0 6-1.1 8-2.9l-3.9-3c-1.1.7-2.5 1.2-4.1 1.2-3.1 0-5.8-2.1-6.7-5H1.3v3.1A12 12 0 0 0 12 24z"
        />
        <path fill="#FBBC05" d="M5.3 14.3a7.2 7.2 0 0 1 0-4.6V6.6H1.3a12 12 0 0 0 0 10.8l4-3.1z" />
        <path
          fill="#EA4335"
          d="M12 4.8c1.8 0 3.3.6 4.6 1.8l3.4-3.4A12 12 0 0 0 1.3 6.6l4 3.1c.9-2.9 3.6-4.9 6.7-4.9z"
        />
      </svg>
      {label}
    </button>
  );
}

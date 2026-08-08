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
            50,000+ curated questions, 500+ exam-accurate mock tests and analytics that show
            you exactly what to fix next.
          </p>
        </div>
        <p className="text-xs opacity-75">
          Trusted by 10,000+ JEE, NEET and state exam aspirants.
        </p>
      </div>

      <div className="flex items-center justify-center px-6 py-12">
        <PageTransition>
          <div className="w-full max-w-md">
            <Link to="/" className="mb-8 flex items-center gap-2 lg:hidden">
              <span className="flex size-9 items-center justify-center rounded-xl bg-gradient-hero text-primary-foreground">
                <GraduationCap className="size-5" />
              </span>
              <span className="text-lg font-bold">ExamPathway</span>
            </Link>
            <h1 className="text-3xl font-bold">{title}</h1>
            <p className="mt-2 text-sm text-muted-foreground">{description}</p>
            <div className="mt-8">{children}</div>
            <div className="mt-6 text-sm text-muted-foreground">{footer}</div>
          </div>
        </PageTransition>
      </div>
    </div>
  );
}

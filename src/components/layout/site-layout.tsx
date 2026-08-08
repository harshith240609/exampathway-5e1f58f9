import type { ReactNode } from "react";
import { PageTransition } from "@/components/common/motion";
import { SiteFooter } from "@/components/layout/site-footer";
import { SiteHeader } from "@/components/layout/site-header";

export function SiteLayout({ children }: { children: ReactNode }) {
  return (
    <div className="flex min-h-screen flex-col">
      <SiteHeader />
      <main className="flex-1">
        <PageTransition>{children}</PageTransition>
      </main>
      <SiteFooter />
    </div>
  );
}

export function PageHeader({
  title,
  description,
  children,
}: {
  title: string;
  description: string;
  children?: ReactNode;
}) {
  return (
    <section className="border-b border-border bg-gradient-soft">
      <div className="section-container flex flex-col gap-6 py-14 md:flex-row md:items-end md:justify-between">
        <div className="max-w-2xl space-y-3">
          <h1 className="text-4xl font-bold sm:text-5xl">{title}</h1>
          <p className="text-base leading-relaxed text-muted-foreground">{description}</p>
        </div>
        {children}
      </div>
    </section>
  );
}

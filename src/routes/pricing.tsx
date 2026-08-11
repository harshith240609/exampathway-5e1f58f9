import { createFileRoute, Link, useNavigate } from "@tanstack/react-router";
import { Check } from "lucide-react";
import { useEffect, useState } from "react";
import { toast } from "sonner";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";
import { Button } from "@/components/ui/button";
import { useAuth } from "@/contexts/auth-context";
import { formatINR, type PlanSummary } from "@/lib/access";
import { listPlans } from "@/lib/catalog.functions";
import { requestPlanPurchase } from "@/lib/study.functions";

export const Route = createFileRoute("/pricing")({
  head: () => ({
    meta: [
      { title: "Pricing — Individual and Combination Plans | ExamPathway" },
      {
        name: "description",
        content:
          "Monthly plans for JEE Main, JEE Advanced, BITSAT, EAPCET and NEET. Individual courses from ₹200/month and combination plans from ₹300/month.",
      },
      { property: "og:title", content: "ExamPathway Pricing" },
      {
        property: "og:description",
        content: "Individual course plans from ₹200/month, combination plans from ₹300/month.",
      },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
    ],
  }),
  component: PricingPage,
});

function PlanGrid({
  plans,
  onChoose,
  busySlug,
}: {
  plans: PlanSummary[];
  onChoose: (plan: PlanSummary) => void;
  busySlug: string | null;
}) {
  return (
    <div className="grid gap-5 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
      {plans.map((plan) => (
        <div
          key={plan.id}
          className="flex flex-col rounded-2xl border border-border bg-card p-6 shadow-soft"
        >
          <h3 className="text-base font-semibold">{plan.name}</h3>
          <p className="mt-3 flex items-baseline gap-1">
            <span className="text-3xl font-bold">{formatINR(plan.price_inr)}</span>
            <span className="text-sm text-muted-foreground">/month</span>
          </p>
          <p className="mt-5 text-xs font-semibold uppercase tracking-wider text-muted-foreground">
            Courses included
          </p>
          <ul className="mt-3 flex-1 space-y-2">
            {plan.courses.map((course) => (
              <li key={course} className="flex gap-2 text-sm">
                <Check className="mt-0.5 size-4 shrink-0 text-success" />
                {course}
              </li>
            ))}
          </ul>
          <Button
            className="mt-6 w-full"
            disabled={busySlug === plan.slug}
            onClick={() => onChoose(plan)}
          >
            {busySlug === plan.slug ? "Please wait..." : "Choose plan"}
          </Button>
        </div>
      ))}
    </div>
  );
}

function PricingPage() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const [plans, setPlans] = useState<PlanSummary[]>([]);
  const [loading, setLoading] = useState(true);
  const [busySlug, setBusySlug] = useState<string | null>(null);

  useEffect(() => {
    void listPlans()
      .then(setPlans)
      .finally(() => setLoading(false));
  }, []);

  const choose = async (plan: PlanSummary) => {
    if (!user) {
      void navigate({ to: "/register" });
      return;
    }
    setBusySlug(plan.slug);
    try {
      await requestPlanPurchase({ data: plan.slug });
      toast.success(
        `${plan.name} request recorded. Online payments are not live yet — our team will contact you to complete activation.`,
      );
    } catch (error) {
      toast.error(error instanceof Error ? error.message : "Could not record your request.");
    } finally {
      setBusySlug(null);
    }
  };

  const individual = plans.filter((plan) => plan.kind === "individual");
  const combo = plans.filter((plan) => plan.kind !== "individual");

  return (
    <SiteLayout>
      <PageHeader
        title="Pricing"
        description="Monthly plans per exam course. Every account also gets a free allocation: 25 questions per subject and one mock test per course."
      />

      <section className="section-container space-y-12 py-12">
        {loading ? (
          <p className="text-sm text-muted-foreground">Loading plans...</p>
        ) : (
          <>
            <div className="space-y-5">
              <h2 className="text-xl font-semibold">Individual plans</h2>
              <PlanGrid plans={individual} onChoose={choose} busySlug={busySlug} />
            </div>
            <div className="space-y-5">
              <h2 className="text-xl font-semibold">Combination plans</h2>
              <PlanGrid plans={combo} onChoose={choose} busySlug={busySlug} />
            </div>
          </>
        )}

        <p className="rounded-2xl border border-border bg-secondary/40 p-5 text-sm text-muted-foreground">
          Online payments are not enabled yet. Choosing a plan records your request only — paid
          access is activated once payment verification goes live.{" "}
          <Link to="/contact" className="font-semibold text-primary hover:underline">
            Contact us
          </Link>{" "}
          if you need help.
        </p>
      </section>
    </SiteLayout>
  );
}

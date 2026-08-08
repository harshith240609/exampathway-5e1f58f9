import { createFileRoute, Link } from "@tanstack/react-router";
import { Check } from "lucide-react";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";

const plans = [
  {
    name: "Free",
    price: "₹0",
    period: "forever",
    description: "Start practising today with daily quizzes and limited question access.",
    features: [
      "25 daily practice questions",
      "Access to 2 mock tests",
      "Basic performance summary",
      "Announcements and PYQ previews",
    ],
    cta: "Create free account",
    highlighted: false,
  },
  {
    name: "Pro",
    price: "₹799",
    period: "per month",
    description: "Everything a serious aspirant needs for one exam track.",
    features: [
      "Unlimited question bank access",
      "All mock tests with rank analysis",
      "Complete PYQ archive",
      "Chapter-wise analytics and weak area detection",
      "Downloadable notes and formula sheets",
    ],
    cta: "Start Pro",
    highlighted: true,
  },
  {
    name: "All Access",
    price: "₹1,499",
    period: "per month",
    description: "Every exam track, every feature, for students keeping options open.",
    features: [
      "All six exam courses",
      "Priority doubt resolution",
      "Personalised study planner",
      "Mentor review of monthly performance",
      "Early access to new test series",
    ],
    cta: "Go All Access",
    highlighted: false,
  },
];

export const Route = createFileRoute("/pricing")({
  head: () => ({
    meta: [
      { title: "Pricing — Free, Pro and All Access Plans | ExamPathway" },
      {
        name: "description",
        content:
          "Simple pricing for entrance exam preparation. Start free, upgrade to Pro for unlimited questions and mock tests, or unlock every exam track.",
      },
      { property: "og:title", content: "ExamPathway Pricing" },
      {
        property: "og:description",
        content: "Free daily practice, Pro at ₹799/month, All Access at ₹1,499/month.",
      },
    ],
  }),
  component: PricingPage,
});

function PricingPage() {
  return (
    <SiteLayout>
      <PageHeader
        title="Pricing that fits a student budget"
        description="No hidden fees, no forced annual lock-in. Upgrade, downgrade or cancel whenever you need."
      />

      <section className="section-container grid gap-6 py-14 lg:grid-cols-3">
        {plans.map((plan) => (
          <div
            key={plan.name}
            className={
              plan.highlighted
                ? "relative flex flex-col rounded-2xl border-2 border-primary bg-card p-7 shadow-lift"
                : "flex flex-col rounded-2xl border border-border bg-card p-7 shadow-soft"
            }
          >
            {plan.highlighted ? (
              <Badge className="absolute -top-3 left-7">Most popular</Badge>
            ) : null}
            <h2 className="text-lg font-semibold">{plan.name}</h2>
            <p className="mt-3 flex items-baseline gap-1">
              <span className="text-4xl font-bold">{plan.price}</span>
              <span className="text-sm text-muted-foreground">/{plan.period}</span>
            </p>
            <p className="mt-3 text-sm text-muted-foreground">{plan.description}</p>
            <ul className="mt-6 flex-1 space-y-3">
              {plan.features.map((feature) => (
                <li key={feature} className="flex gap-2 text-sm">
                  <Check className="mt-0.5 size-4 shrink-0 text-success" />
                  {feature}
                </li>
              ))}
            </ul>
            <Button
              asChild
              className="mt-7"
              variant={plan.highlighted ? "default" : "outline"}
            >
              <Link to="/register">{plan.cta}</Link>
            </Button>
          </div>
        ))}
      </section>
    </SiteLayout>
  );
}

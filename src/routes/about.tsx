import { createFileRoute } from "@tanstack/react-router";
import { Award, Compass, HeartHandshake, Target } from "lucide-react";
import { FadeIn } from "@/components/common/motion";
import { SectionHeading } from "@/components/common/section-heading";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";

const values = [
  {
    icon: Target,
    title: "Outcome first",
    description:
      "Every feature we ship must move a student's rank. If it does not, it does not belong on the platform.",
  },
  {
    icon: Compass,
    title: "Clarity over volume",
    description:
      "We would rather give 500 well-chosen questions per chapter than 5,000 unsorted ones.",
  },
  {
    icon: HeartHandshake,
    title: "Accessible preparation",
    description:
      "Free daily practice and PYQ access, so preparation quality never depends on family income.",
  },
  {
    icon: Award,
    title: "Academic rigour",
    description:
      "Content authored and reviewed by IIT and AIIMS alumni with a decade of classroom experience.",
  },
];

const milestones = [
  { year: "2021", text: "Started as a weekend doubt-solving group for 40 students." },
  { year: "2023", text: "Launched the first chapter-wise question bank for JEE Main." },
  { year: "2024", text: "Crossed 10,000 active aspirants across six entrance exams." },
  { year: "2026", text: "50,000+ curated questions and 500+ exam-accurate mock tests." },
];

export const Route = createFileRoute("/about")({
  head: () => ({
    meta: [
      { title: "About ExamPathway — Our Mission for Entrance Aspirants" },
      {
        name: "description",
        content:
          "ExamPathway is built by IIT and AIIMS alumni to give every entrance exam aspirant structured practice, honest analytics and affordable access.",
      },
      { property: "og:title", content: "About ExamPathway" },
      {
        property: "og:description",
        content: "Why we built a structured, analytics-first entrance exam preparation platform.",
      },
    ],
  }),
  component: AboutPage,
});

function AboutPage() {
  return (
    <SiteLayout>
      <PageHeader
        title="We help aspirants prepare with structure, not stress"
        description="ExamPathway began in a small classroom in Hyderabad and now supports tens of thousands of students preparing for India's toughest entrance exams."
      />

      <section className="section-container py-16">
        <SectionHeading
          eyebrow="What we believe"
          title="Principles that shape the platform"
        />
        <div className="mt-10 grid gap-6 sm:grid-cols-2">
          {values.map((value, index) => (
            <FadeIn key={value.title} delay={index * 0.05}>
              <div className="h-full rounded-2xl border border-border bg-card p-6 shadow-soft">
                <span className="flex size-11 items-center justify-center rounded-xl bg-primary-soft text-accent-foreground">
                  <value.icon className="size-5" />
                </span>
                <h3 className="mt-5 text-lg font-semibold">{value.title}</h3>
                <p className="mt-2 text-sm leading-relaxed text-muted-foreground">
                  {value.description}
                </p>
              </div>
            </FadeIn>
          ))}
        </div>
      </section>

      <section className="border-y border-border bg-gradient-soft py-16">
        <div className="section-container">
          <SectionHeading eyebrow="Timeline" title="How we got here" />
          <ol className="mt-10 space-y-6 border-l border-border pl-6">
            {milestones.map((milestone) => (
              <li key={milestone.year} className="relative">
                <span className="absolute -left-[31px] top-1.5 size-3 rounded-full bg-primary" />
                <p className="text-sm font-semibold text-brand-orange">{milestone.year}</p>
                <p className="mt-1 text-sm text-muted-foreground">{milestone.text}</p>
              </li>
            ))}
          </ol>
        </div>
      </section>
    </SiteLayout>
  );
}

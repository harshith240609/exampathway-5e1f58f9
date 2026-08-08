import { createFileRoute, Link } from "@tanstack/react-router";
import {
  ArrowRight,
  BarChart3,
  BookOpen,
  Bot,
  CalendarClock,
  CheckCircle2,
  Flame,
  GraduationCap,
  LineChart,
  Quote,
  ShieldCheck,
  Sparkles,
  Target,
  Timer,
  Trophy,
  Users,
} from "lucide-react";
import heroImage from "@/assets/hero.jpg";
import { FadeIn } from "@/components/common/motion";
import { SectionHeading } from "@/components/common/section-heading";
import { CourseCard } from "@/components/courses/course-card";
import { SiteLayout } from "@/components/layout/site-layout";
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { announcements, courses, leaderboard } from "@/data/mock";

const stats = [
  { label: "Questions", value: "50,000+", icon: BookOpen },
  { label: "Students", value: "10,000+", icon: Users },
  { label: "Mock Tests", value: "500+", icon: Timer },
  { label: "Success Rate", value: "95%", icon: Trophy },
];

const features = [
  {
    icon: Target,
    title: "Chapter-wise question bank",
    description:
      "Filter by subject, chapter, difficulty and question type. Track attempted, bookmarked and pending questions.",
  },
  {
    icon: Timer,
    title: "Real exam simulations",
    description:
      "Full syllabus and sectional mocks with the exact interface, marking scheme and timer of the actual exam.",
  },
  {
    icon: LineChart,
    title: "Deep performance analytics",
    description:
      "Accuracy, speed, weak chapters and percentile trends, updated after every practice session.",
  },
  {
    icon: CalendarClock,
    title: "Daily practice and streaks",
    description:
      "A calibrated daily target that keeps momentum with XP, streaks and a personalised study planner.",
  },
  {
    icon: Bot,
    title: "Guided solutions",
    description:
      "Every question ships with hints, a step-by-step solution and a discussion thread for doubts.",
  },
  {
    icon: ShieldCheck,
    title: "Verified content",
    description:
      "Questions curated and reviewed by IIT and AIIMS alumni, mapped to the latest official syllabus.",
  },
];

const testimonials = [
  {
    name: "Sanjana Kulkarni",
    result: "AIR 412, JEE Advanced 2026",
    quote:
      "The chapter analytics told me exactly where I was losing marks. I fixed rotational motion in three weeks and my mock score jumped by 60 marks.",
  },
  {
    name: "Harsh Vardhan",
    result: "681/720, NEET 2026",
    quote:
      "Daily practice with streaks kept me consistent even during board exams. The Biology bank is genuinely NCERT-line-by-line.",
  },
  {
    name: "Nikitha Reddy",
    result: "State Rank 27, EAPCET 2026",
    quote:
      "PYQ filters by year and chapter saved me hours. I could revise ten years of papers chapter by chapter.",
  },
];

const faqs = [
  {
    question: "Which exams does ExamPathway cover?",
    answer:
      "JEE Main, JEE Advanced, BITSAT, EAMCET, EAPCET and NEET, each with a dedicated question bank, PYQ archive and mock test series.",
  },
  {
    question: "Are the mock tests based on the latest pattern?",
    answer:
      "Yes. Every mock follows the current official pattern, marking scheme and duration, and is updated whenever the conducting body revises it.",
  },
  {
    question: "Can I practise on mobile?",
    answer:
      "The entire platform is responsive, so question practice, mocks and analytics work on phones, tablets and desktops.",
  },
  {
    question: "Do I get solutions for every question?",
    answer:
      "Each question includes a hint, a full worked solution, the correct answer and community discussion.",
  },
];

export const Route = createFileRoute("/")({
  head: () => ({
    meta: [
      { title: "ExamPathway — Entrance Exam Preparation for JEE, NEET & More" },
      {
        name: "description",
        content:
          "Practise 50,000+ questions, 500+ mock tests and previous year papers for JEE, NEET, BITSAT, EAMCET and EAPCET with detailed performance analytics.",
      },
      { property: "og:title", content: "ExamPathway — Your Complete Entrance Exam Preparation Platform" },
      {
        property: "og:description",
        content:
          "Question banks, mock tests, PYQs, daily practice and analytics for JEE, NEET, BITSAT, EAMCET and EAPCET aspirants.",
      },
    ],
  }),
  component: HomePage,
});

function HomePage() {
  return (
    <SiteLayout>
      <section className="relative overflow-hidden border-b border-border bg-gradient-soft">
        <div className="section-container grid gap-12 py-16 lg:grid-cols-2 lg:items-center lg:py-24">
          <div className="space-y-7">
            <Badge className="gap-1.5 bg-primary-soft text-accent-foreground hover:bg-primary-soft">
              <Sparkles className="size-3.5" /> Trusted by 10,000+ aspirants
            </Badge>
            <h1 className="text-4xl font-bold leading-[1.08] sm:text-5xl lg:text-6xl">
              Your complete entrance exam{" "}
              <span className="bg-gradient-hero bg-clip-text text-transparent">
                preparation platform
              </span>
            </h1>
            <p className="max-w-xl text-lg leading-relaxed text-muted-foreground">
              Structured question banks, exam-accurate mock tests and analytics that show you
              exactly what to fix next — for JEE, NEET, BITSAT, EAMCET and EAPCET.
            </p>
            <div className="flex flex-wrap gap-3">
              <Button asChild size="lg" className="gap-2">
                <Link to="/courses">
                  Browse courses <ArrowRight className="size-4" />
                </Link>
              </Button>
              <Button asChild size="lg" variant="outline">
                <Link to="/login">Student login</Link>
              </Button>
            </div>
            <ul className="flex flex-wrap gap-x-6 gap-y-2 text-sm text-muted-foreground">
              {["No credit card required", "Free daily practice", "Cancel anytime"].map(
                (item) => (
                  <li key={item} className="flex items-center gap-2">
                    <CheckCircle2 className="size-4 text-success" /> {item}
                  </li>
                ),
              )}
            </ul>
          </div>

          <div className="relative">
            <div className="overflow-hidden rounded-3xl border border-border bg-card shadow-lift">
              <img
                src={heroImage}
                alt="Students preparing for entrance exams on ExamPathway"
                width={1280}
                height={960}
                className="size-full object-cover"
              />
            </div>
            <div className="absolute -bottom-6 left-4 hidden w-56 rounded-2xl glass-panel p-4 shadow-lift sm:block">
              <p className="text-xs text-muted-foreground">Today&apos;s streak</p>
              <p className="mt-1 flex items-center gap-2 text-2xl font-bold">
                <Flame className="size-5 text-brand-orange" /> 24 days
              </p>
            </div>
            <div className="absolute -right-2 top-6 hidden w-48 rounded-2xl glass-panel p-4 shadow-lift md:block">
              <p className="text-xs text-muted-foreground">Mock accuracy</p>
              <p className="mt-1 flex items-center gap-2 text-2xl font-bold">
                <BarChart3 className="size-5 text-primary" /> 82%
              </p>
            </div>
          </div>
        </div>
      </section>

      <section className="border-b border-border bg-card py-6">
        <div className="section-container overflow-hidden">
          <div className="flex w-max animate-marquee gap-12">
            {[...stats, ...stats, ...stats].map((stat, index) => (
              <div key={index} className="flex items-center gap-3 whitespace-nowrap">
                <span className="flex size-10 items-center justify-center rounded-xl bg-primary-soft text-accent-foreground">
                  <stat.icon className="size-5" />
                </span>
                <span>
                  <span className="block text-xl font-bold">{stat.value}</span>
                  <span className="block text-xs uppercase tracking-wider text-muted-foreground">
                    {stat.label}
                  </span>
                </span>
              </div>
            ))}
          </div>
        </div>
      </section>

      <section className="section-container py-20">
        <SectionHeading
          eyebrow="Why ExamPathway"
          title="Everything a serious aspirant needs, in one place"
          description="Stop juggling PDFs, coaching sheets and random test apps. ExamPathway keeps practice, revision and analysis in a single flow."
        />
        <div className="mt-10 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
          {features.map((feature, index) => (
            <FadeIn key={feature.title} delay={index * 0.05}>
              <div className="card-hover h-full rounded-2xl border border-border bg-card p-6 shadow-soft">
                <span className="flex size-11 items-center justify-center rounded-xl bg-primary-soft text-accent-foreground">
                  <feature.icon className="size-5" />
                </span>
                <h3 className="mt-5 text-lg font-semibold">{feature.title}</h3>
                <p className="mt-2 text-sm leading-relaxed text-muted-foreground">
                  {feature.description}
                </p>
              </div>
            </FadeIn>
          ))}
        </div>
      </section>

      <section className="border-y border-border bg-gradient-soft py-20">
        <div className="section-container">
          <SectionHeading
            eyebrow="Courses"
            title="Pick your exam and start practising"
            description="Each course has its own question bank, PYQ archive, mock series and analytics."
            action={
              <Button asChild variant="outline">
                <Link to="/courses">View all courses</Link>
              </Button>
            }
          />
          <div className="mt-10 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {courses.slice(0, 3).map((course, index) => (
              <FadeIn key={course.id} delay={index * 0.05}>
                <CourseCard course={course} />
              </FadeIn>
            ))}
          </div>
        </div>
      </section>

      <section className="section-container py-20">
        <div className="grid gap-10 lg:grid-cols-[1.2fr_1fr]">
          <div>
            <SectionHeading
              eyebrow="Latest updates"
              title="Announcements"
              action={
                <Button asChild variant="ghost" className="gap-1">
                  <Link to="/announcements">
                    See all <ArrowRight className="size-4" />
                  </Link>
                </Button>
              }
            />
            <div className="mt-8 space-y-4">
              {announcements.slice(0, 3).map((announcement) => (
                <article
                  key={announcement.id}
                  className="card-hover rounded-2xl border border-border bg-card p-5 shadow-soft"
                >
                  <div className="flex items-center gap-3">
                    <Badge variant="secondary">{announcement.type}</Badge>
                    <span className="text-xs text-muted-foreground">
                      {announcement.publishedAt}
                    </span>
                  </div>
                  <h3 className="mt-3 font-semibold">{announcement.title}</h3>
                  <p className="mt-1.5 text-sm leading-relaxed text-muted-foreground">
                    {announcement.body}
                  </p>
                </article>
              ))}
            </div>
          </div>

          <div>
            <SectionHeading eyebrow="This week" title="Top rankers" />
            <div className="mt-8 overflow-hidden rounded-2xl border border-border bg-card shadow-soft">
              {leaderboard.slice(0, 6).map((entry) => (
                <div
                  key={entry.id}
                  className="flex items-center gap-4 border-b border-border px-5 py-4 last:border-b-0"
                >
                  <span className="flex size-8 items-center justify-center rounded-lg bg-primary-soft text-sm font-bold text-accent-foreground">
                    {entry.rank}
                  </span>
                  <div className="min-w-0 flex-1">
                    <p className="truncate text-sm font-semibold">{entry.name}</p>
                    <p className="text-xs text-muted-foreground">
                      {entry.testsAttempted} tests · {entry.accuracy.toFixed(1)}% accuracy
                    </p>
                  </div>
                  <span className="text-sm font-semibold text-brand-orange">
                    {entry.xp.toLocaleString("en-IN")} XP
                  </span>
                </div>
              ))}
            </div>
            <Button asChild variant="outline" className="mt-4 w-full">
              <Link to="/leaderboard">Open leaderboard</Link>
            </Button>
          </div>
        </div>
      </section>

      <section className="border-y border-border bg-gradient-soft py-20">
        <div className="section-container">
          <SectionHeading
            eyebrow="Results"
            title="Aspirants who made it"
            align="center"
          />
          <div className="mt-10 grid gap-6 md:grid-cols-3">
            {testimonials.map((testimonial, index) => (
              <FadeIn key={testimonial.name} delay={index * 0.06}>
                <figure className="flex h-full flex-col rounded-2xl border border-border bg-card p-6 shadow-soft">
                  <Quote className="size-6 text-brand-orange" />
                  <blockquote className="mt-4 flex-1 text-sm leading-relaxed text-muted-foreground">
                    {testimonial.quote}
                  </blockquote>
                  <figcaption className="mt-5 border-t border-border pt-4">
                    <p className="text-sm font-semibold">{testimonial.name}</p>
                    <p className="text-xs text-muted-foreground">{testimonial.result}</p>
                  </figcaption>
                </figure>
              </FadeIn>
            ))}
          </div>
        </div>
      </section>

      <section className="section-container py-20">
        <div className="grid gap-10 lg:grid-cols-[1fr_1.2fr]">
          <SectionHeading
            eyebrow="FAQ"
            title="Questions aspirants ask us"
            description="Still unsure? Reach out and our academic team will help you plan your preparation."
            action={
              <Button asChild variant="outline">
                <Link to="/contact">Talk to us</Link>
              </Button>
            }
          />
          <Accordion type="single" collapsible className="w-full">
            {faqs.map((faq) => (
              <AccordionItem key={faq.question} value={faq.question}>
                <AccordionTrigger className="text-left">{faq.question}</AccordionTrigger>
                <AccordionContent className="text-muted-foreground">
                  {faq.answer}
                </AccordionContent>
              </AccordionItem>
            ))}
          </Accordion>
        </div>
      </section>

      <section className="section-container pb-24">
        <div className="overflow-hidden rounded-3xl bg-gradient-hero px-8 py-14 text-primary-foreground shadow-lift sm:px-14">
          <div className="flex flex-col items-start gap-6 md:flex-row md:items-center md:justify-between">
            <div className="max-w-xl space-y-3">
              <GraduationCap className="size-8" />
              <h2 className="text-3xl font-bold sm:text-4xl">
                Start your preparation today
              </h2>
              <p className="text-sm leading-relaxed opacity-90">
                Create a free account, take a diagnostic test and get a personalised study plan
                within minutes.
              </p>
            </div>
            <div className="flex flex-wrap gap-3">
              <Button asChild size="lg" variant="secondary">
                <Link to="/register">Create free account</Link>
              </Button>
              <Button asChild size="lg" variant="outline" className="bg-transparent">
                <Link to="/pricing">See pricing</Link>
              </Button>
            </div>
          </div>
        </div>
      </section>
    </SiteLayout>
  );
}

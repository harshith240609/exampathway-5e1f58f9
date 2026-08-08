import { createFileRoute, Link } from "@tanstack/react-router";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";
import { Button } from "@/components/ui/button";

const groups = [
  {
    title: "Getting started",
    items: [
      {
        question: "How do I choose the right course?",
        answer:
          "Pick the exam you are targeting. If you are appearing for multiple exams, All Access unlocks every track and merges your analytics.",
      },
      {
        question: "Is there a free plan?",
        answer:
          "Yes. Daily practice, two mock tests and PYQ previews are free forever with a student account.",
      },
    ],
  },
  {
    title: "Practice and tests",
    items: [
      {
        question: "How often are new questions added?",
        answer:
          "Our academic team publishes new chapter-wise sets every week and refreshes PYQs as soon as official papers are released.",
      },
      {
        question: "Can I pause a mock test?",
        answer:
          "Full syllabus mocks must be attempted in a single sitting to mirror the real exam. Sectional and practice tests can be resumed.",
      },
      {
        question: "How is accuracy calculated?",
        answer:
          "Accuracy is correct answers divided by attempted questions, computed separately for each subject and chapter.",
      },
    ],
  },
  {
    title: "Billing and account",
    items: [
      {
        question: "Can I cancel anytime?",
        answer:
          "Yes. Cancellation takes effect at the end of your current billing cycle and your data stays available on the free plan.",
      },
      {
        question: "Do you offer student discounts?",
        answer:
          "We offer need-based scholarships. Write to support@exampathway.com with your details and our team will respond within two days.",
      },
    ],
  },
];

export const Route = createFileRoute("/faq")({
  head: () => ({
    meta: [
      { title: "FAQ — Common Questions About ExamPathway" },
      {
        name: "description",
        content:
          "Answers about courses, question banks, mock tests, billing and accounts on the ExamPathway entrance exam preparation platform.",
      },
      { property: "og:title", content: "ExamPathway FAQ" },
      {
        property: "og:description",
        content: "Everything aspirants ask before they start preparing with us.",
      },
    ],
  }),
  component: FaqPage,
});

function FaqPage() {
  return (
    <SiteLayout>
      <PageHeader
        title="Frequently asked questions"
        description="Cannot find what you need? Our academic support team replies within one working day."
      >
        <Button asChild variant="outline">
          <Link to="/contact">Contact support</Link>
        </Button>
      </PageHeader>

      <section className="section-container space-y-12 py-14">
        {groups.map((group) => (
          <div key={group.title}>
            <h2 className="text-xl font-semibold">{group.title}</h2>
            <Accordion type="single" collapsible className="mt-4">
              {group.items.map((item) => (
                <AccordionItem key={item.question} value={item.question}>
                  <AccordionTrigger className="text-left">{item.question}</AccordionTrigger>
                  <AccordionContent className="text-muted-foreground">
                    {item.answer}
                  </AccordionContent>
                </AccordionItem>
              ))}
            </Accordion>
          </div>
        ))}
      </section>
    </SiteLayout>
  );
}

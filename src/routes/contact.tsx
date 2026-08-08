import { createFileRoute } from "@tanstack/react-router";
import { Mail, MapPin, MessageSquare, Phone } from "lucide-react";
import { useState } from "react";
import { toast } from "sonner";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Textarea } from "@/components/ui/textarea";

const channels = [
  { icon: Mail, label: "Email", value: "support@exampathway.com" },
  { icon: Phone, label: "Phone", value: "+91 90000 12345" },
  { icon: MapPin, label: "Office", value: "Banjara Hills, Hyderabad 500034" },
  { icon: MessageSquare, label: "Response time", value: "Within 1 working day" },
];

export const Route = createFileRoute("/contact")({
  head: () => ({
    meta: [
      { title: "Contact ExamPathway — Support & Feedback" },
      {
        name: "description",
        content:
          "Reach the ExamPathway academic and support team for course guidance, billing help, feedback or partnership enquiries.",
      },
      { property: "og:title", content: "Contact ExamPathway" },
      {
        property: "og:description",
        content: "Talk to our academic team about your preparation plan.",
      },
    ],
  }),
  component: ContactPage,
});

function ContactPage() {
  const [submitting, setSubmitting] = useState(false);

  return (
    <SiteLayout>
      <PageHeader
        title="Contact us"
        description="Questions about courses, billing or your preparation plan? Send us a message and we will get back quickly."
      />

      <section className="section-container grid gap-10 py-14 lg:grid-cols-[1fr_1.3fr]">
        <div className="space-y-4">
          {channels.map((channel) => (
            <div
              key={channel.label}
              className="flex items-start gap-4 rounded-2xl border border-border bg-card p-5 shadow-soft"
            >
              <span className="flex size-10 items-center justify-center rounded-xl bg-primary-soft text-accent-foreground">
                <channel.icon className="size-5" />
              </span>
              <div>
                <p className="text-sm font-semibold">{channel.label}</p>
                <p className="text-sm text-muted-foreground">{channel.value}</p>
              </div>
            </div>
          ))}
        </div>

        <form
          className="space-y-5 rounded-2xl border border-border bg-card p-7 shadow-soft"
          onSubmit={(event) => {
            event.preventDefault();
            setSubmitting(true);
            setTimeout(() => {
              setSubmitting(false);
              toast.success("Message sent. Our team will reply soon.");
              (event.target as HTMLFormElement).reset();
            }, 600);
          }}
        >
          <div className="grid gap-5 sm:grid-cols-2">
            <div className="space-y-2">
              <Label htmlFor="name">Full name</Label>
              <Input id="name" required placeholder="Aarav Sharma" />
            </div>
            <div className="space-y-2">
              <Label htmlFor="email">Email</Label>
              <Input id="email" type="email" required placeholder="you@example.com" />
            </div>
          </div>
          <div className="space-y-2">
            <Label htmlFor="topic">Topic</Label>
            <Select defaultValue="Course guidance">
              <SelectTrigger id="topic">
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                {["Course guidance", "Billing", "Technical issue", "Feedback", "Partnership"].map(
                  (topic) => (
                    <SelectItem key={topic} value={topic}>
                      {topic}
                    </SelectItem>
                  ),
                )}
              </SelectContent>
            </Select>
          </div>
          <div className="space-y-2">
            <Label htmlFor="message">Message</Label>
            <Textarea id="message" required rows={6} placeholder="How can we help?" />
          </div>
          <Button type="submit" size="lg" disabled={submitting}>
            {submitting ? "Sending..." : "Send message"}
          </Button>
        </form>
      </section>
    </SiteLayout>
  );
}

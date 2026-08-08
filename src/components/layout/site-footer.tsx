import { Link } from "@tanstack/react-router";
import { GraduationCap, Mail, MapPin, Phone } from "lucide-react";

const columns = [
  {
    title: "Learn",
    links: [
      { label: "Courses", to: "/courses" },
      { label: "Question Bank", to: "/question-bank" },
      { label: "Mock Tests", to: "/mock-tests" },
      { label: "Daily Practice", to: "/daily-practice" },
    ],
  },
  {
    title: "Resources",
    links: [
      { label: "PYQs", to: "/pyqs" },
      { label: "Study Materials", to: "/study-materials" },
      { label: "Announcements", to: "/announcements" },
      { label: "Leaderboard", to: "/leaderboard" },
    ],
  },
  {
    title: "Company",
    links: [
      { label: "About", to: "/about" },
      { label: "Pricing", to: "/pricing" },
      { label: "FAQ", to: "/faq" },
      { label: "Contact", to: "/contact" },
    ],
  },
] as const;

export function SiteFooter() {
  return (
    <footer className="mt-24 border-t border-border bg-gradient-soft">
      <div className="section-container grid gap-10 py-14 md:grid-cols-2 lg:grid-cols-5">
        <div className="lg:col-span-2">
          <Link to="/" className="flex items-center gap-2">
            <span className="flex size-9 items-center justify-center rounded-xl bg-gradient-hero text-primary-foreground">
              <GraduationCap className="size-5" />
            </span>
            <span className="text-lg font-bold">
              Exam<span className="text-brand-orange">Pathway</span>
            </span>
          </Link>
          <p className="mt-4 max-w-sm text-sm leading-relaxed text-muted-foreground">
            Your complete entrance exam preparation platform for JEE, NEET, BITSAT and state
            level engineering exams.
          </p>
          <ul className="mt-6 space-y-2 text-sm text-muted-foreground">
            <li className="flex items-center gap-2">
              <Mail className="size-4 text-primary" /> support@exampathway.com
            </li>
            <li className="flex items-center gap-2">
              <Phone className="size-4 text-primary" /> +91 90000 12345
            </li>
            <li className="flex items-center gap-2">
              <MapPin className="size-4 text-primary" /> Hyderabad, India
            </li>
          </ul>
        </div>

        {columns.map((column) => (
          <div key={column.title}>
            <h3 className="text-sm font-semibold uppercase tracking-wider">{column.title}</h3>
            <ul className="mt-4 space-y-2.5">
              {column.links.map((link) => (
                <li key={link.to}>
                  <Link
                    to={link.to}
                    className="text-sm text-muted-foreground transition-colors hover:text-foreground"
                  >
                    {link.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>
        ))}
      </div>
      <div className="border-t border-border">
        <div className="section-container flex flex-col items-center justify-between gap-3 py-5 text-xs text-muted-foreground sm:flex-row">
          <p>© {new Date().getFullYear()} ExamPathway. All rights reserved.</p>
          <p>Built for aspirants who want structured, measurable preparation.</p>
        </div>
      </div>
    </footer>
  );
}

import { createFileRoute, Outlet } from "@tanstack/react-router";
import {
  Award,
  BookMarked,
  BookOpen,
  LayoutDashboard,
  LineChart,
  Settings,
  Timer,
  User,
  Library,
} from "lucide-react";
import { DashboardShell } from "@/components/layout/dashboard-shell";

const items = [
  { label: "Overview", to: "/dashboard", icon: LayoutDashboard },
  { label: "My Courses", to: "/dashboard/courses", icon: Library },
  { label: "Question Bank", to: "/dashboard/question-bank", icon: BookOpen },
  { label: "Bookmarks", to: "/dashboard/bookmarks", icon: BookMarked },
  { label: "Mock Tests", to: "/dashboard/mock-tests", icon: Timer },
  { label: "Performance", to: "/dashboard/performance", icon: LineChart },
  { label: "Achievements", to: "/dashboard/achievements", icon: Award },
  { label: "Profile", to: "/dashboard/profile", icon: User },
  { label: "Settings", to: "/dashboard/settings", icon: Settings },
];

export const Route = createFileRoute("/dashboard")({
  component: DashboardLayout,
});

function DashboardLayout() {
  return (
    <DashboardShell title="Student Dashboard" items={items} role="student">
      <Outlet />
    </DashboardShell>
  );
}

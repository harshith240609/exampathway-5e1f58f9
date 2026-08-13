import { createFileRoute, Outlet } from "@tanstack/react-router";
import { Database, LayoutDashboard } from "lucide-react";
import { DashboardShell } from "@/components/layout/dashboard-shell";

const items = [
  { label: "Overview", to: "/admin", icon: LayoutDashboard },
  { label: "Questions", to: "/admin/questions", icon: Database },
];

export const Route = createFileRoute("/admin")({
  component: AdminLayout,
});

function AdminLayout() {
  return (
    <DashboardShell title="Admin Console" items={items} role="admin">
      <Outlet />
    </DashboardShell>
  );
}

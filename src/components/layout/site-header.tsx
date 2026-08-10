import { Link, useNavigate, useRouterState } from "@tanstack/react-router";
import { GraduationCap, LayoutDashboard, LogOut, Menu, Moon, Search, Sun, User } from "lucide-react";
import { useState } from "react";
import { Button } from "@/components/ui/button";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { Input } from "@/components/ui/input";
import { Sheet, SheetContent, SheetTitle, SheetTrigger } from "@/components/ui/sheet";
import { useAuth } from "@/contexts/auth-context";
import { useTheme } from "@/contexts/theme-context";
import { cn } from "@/lib/utils";

const navItems = [
  { label: "Courses", to: "/courses" },
  { label: "Question Bank", to: "/question-bank" },
  { label: "Mock Tests", to: "/mock-tests" },
  { label: "About", to: "/about" },
  { label: "Pricing", to: "/pricing" },
] as const;

export function SiteHeader() {
  const { theme, toggleTheme } = useTheme();
  const { user, profile, isAdmin, signOut } = useAuth();
  const navigate = useNavigate();
  const [open, setOpen] = useState(false);
  const [term, setTerm] = useState("");
  const pathname = useRouterState({ select: (state) => state.location.pathname });

  const submitSearch = (event: React.FormEvent) => {
    event.preventDefault();
    const query = term.trim();
    if (!query) return;
    setOpen(false);
    void navigate({ to: "/search", search: { q: query } });
  };

  return (
    <header className="sticky top-0 z-50 w-full border-b border-border/70 glass-panel">
      <div className="section-container grid h-16 grid-cols-[minmax(0,1fr)_auto] items-center gap-3">
        <div className="flex min-w-0 items-center gap-4">
          <Link to="/" className="flex shrink-0 items-center gap-2">
            <span className="flex size-9 items-center justify-center rounded-xl bg-gradient-hero text-primary-foreground">
              <GraduationCap className="size-5" />
            </span>
            <span className="truncate text-base font-bold tracking-tight sm:text-lg">
              Exam<span className="text-brand-orange">Pathway</span>
            </span>
          </Link>

          <nav className="hidden items-center gap-1 lg:flex">
            {navItems.map((item) => (
              <Link
                key={item.to}
                to={item.to}
                className={cn(
                  "rounded-lg px-3 py-2 text-sm font-medium text-muted-foreground transition-colors hover:bg-secondary hover:text-foreground",
                  pathname.startsWith(item.to) && "bg-secondary text-foreground",
                )}
              >
                {item.label}
              </Link>
            ))}
          </nav>
        </div>

        <div className="flex shrink-0 items-center gap-1.5 sm:gap-2">
          <form onSubmit={submitSearch} className="relative hidden xl:block">
            <Search className="pointer-events-none absolute left-3 top-1/2 size-4 -translate-y-1/2 text-muted-foreground" />
            <Input
              value={term}
              onChange={(event) => setTerm(event.target.value)}
              placeholder="Search courses, chapters..."
              className="h-9 w-56 rounded-full pl-9"
              aria-label="Search ExamPathway"
            />
          </form>
          <Button asChild variant="ghost" size="icon" className="xl:hidden" aria-label="Search">
            <Link to="/search" search={{ q: "" }}>
              <Search className="size-4" />
            </Link>
          </Button>
          <Button variant="ghost" size="icon" onClick={toggleTheme} aria-label="Toggle dark mode">
            {theme === "dark" ? <Sun className="size-4" /> : <Moon className="size-4" />}
          </Button>

          {user ? (
            <DropdownMenu>
              <DropdownMenuTrigger asChild>
                <Button variant="ghost" size="icon" aria-label="Account menu">
                  <User className="size-4" />
                </Button>
              </DropdownMenuTrigger>
              <DropdownMenuContent align="end" className="w-56">
                <DropdownMenuLabel className="truncate">
                  {profile?.full_name || user.email}
                </DropdownMenuLabel>
                <DropdownMenuSeparator />
                <DropdownMenuItem asChild>
                  <Link to="/dashboard">
                    <LayoutDashboard className="size-4" /> My dashboard
                  </Link>
                </DropdownMenuItem>
                {isAdmin ? (
                  <DropdownMenuItem asChild>
                    <Link to="/admin">Admin console</Link>
                  </DropdownMenuItem>
                ) : null}
                <DropdownMenuItem asChild>
                  <Link to="/dashboard/profile">Profile</Link>
                </DropdownMenuItem>
                <DropdownMenuSeparator />
                <DropdownMenuItem
                  onClick={async () => {
                    await signOut();
                    void navigate({ to: "/", replace: true });
                  }}
                >
                  <LogOut className="size-4" /> Sign out
                </DropdownMenuItem>
              </DropdownMenuContent>
            </DropdownMenu>
          ) : (
            <>
              <Button asChild variant="ghost" className="hidden sm:inline-flex">
                <Link to="/login">Login</Link>
              </Button>
              <Button asChild size="sm" className="hidden sm:inline-flex">
                <Link to="/register">Sign up</Link>
              </Button>
            </>
          )}

          <Sheet open={open} onOpenChange={setOpen}>
            <SheetTrigger asChild>
              <Button variant="ghost" size="icon" className="lg:hidden" aria-label="Open menu">
                <Menu className="size-5" />
              </Button>
            </SheetTrigger>
            <SheetContent side="right" className="w-[85vw] max-w-xs overflow-y-auto p-6">
              <SheetTitle className="mb-4">Menu</SheetTitle>
              <form onSubmit={submitSearch} className="relative mb-4">
                <Search className="pointer-events-none absolute left-3 top-1/2 size-4 -translate-y-1/2 text-muted-foreground" />
                <Input
                  value={term}
                  onChange={(event) => setTerm(event.target.value)}
                  placeholder="Search"
                  className="h-10 pl-9"
                  aria-label="Search ExamPathway"
                />
              </form>
              <div className="flex flex-col gap-1">
                {navItems.map((item) => (
                  <Link
                    key={item.to}
                    to={item.to}
                    onClick={() => setOpen(false)}
                    className="rounded-lg px-3 py-3 text-sm font-medium hover:bg-secondary"
                  >
                    {item.label}
                  </Link>
                ))}
                <div className="mt-4 grid gap-2">
                  {user ? (
                    <>
                      <Button asChild variant="outline">
                        <Link to="/dashboard" onClick={() => setOpen(false)}>
                          My dashboard
                        </Link>
                      </Button>
                      <Button
                        variant="ghost"
                        onClick={async () => {
                          setOpen(false);
                          await signOut();
                          void navigate({ to: "/", replace: true });
                        }}
                      >
                        Sign out
                      </Button>
                    </>
                  ) : (
                    <>
                      <Button asChild variant="outline">
                        <Link to="/login" onClick={() => setOpen(false)}>
                          Login
                        </Link>
                      </Button>
                      <Button asChild>
                        <Link to="/register" onClick={() => setOpen(false)}>
                          Create free account
                        </Link>
                      </Button>
                    </>
                  )}
                </div>
              </div>
            </SheetContent>
          </Sheet>
        </div>
      </div>
    </header>
  );
}

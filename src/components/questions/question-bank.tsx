import {
  Bookmark,
  BookmarkCheck,
  ChevronLeft,
  ChevronRight,
  Flag,
  Lightbulb,
  MessageSquare,
  Search,
  Timer,
} from "lucide-react";
import { useEffect, useMemo, useState } from "react";
import { toast } from "sonner";
import { EmptyState } from "@/components/common/empty-state";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { Input } from "@/components/ui/input";
import { Progress } from "@/components/ui/progress";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { QuestionService } from "@/services/question.service";
import type {
  Difficulty,
  ExamSlug,
  Paginated,
  Question,
  QuestionFilters,
  QuestionType,
  SubjectName,
} from "@/types";
import { cn } from "@/lib/utils";

const difficulties: (Difficulty | "All")[] = ["All", "Easy", "Medium", "Hard"];
const types: (QuestionType | "All")[] = [
  "All",
  "MCQ",
  "Integer",
  "Numerical",
  "Match",
  "Assertion Reason",
];
const statuses = ["All", "Attempted", "Not Attempted", "Bookmarked"] as const;

const difficultyTone: Record<Difficulty, string> = {
  Easy: "bg-success/15 text-success",
  Medium: "bg-warning/20 text-warning",
  Hard: "bg-destructive/15 text-destructive",
};

interface QuestionBankProps {
  courseSlug?: ExamSlug;
  subjects: SubjectName[];
  chapters: string[];
  pyqMode?: boolean;
}

export function QuestionBank({
  courseSlug,
  subjects,
  chapters,
  pyqMode = false,
}: QuestionBankProps) {
  const [filters, setFilters] = useState<QuestionFilters>({
    subject: "All",
    chapter: "All",
    difficulty: "All",
    type: "All",
    status: "All",
    search: "",
    year: "All",
  });
  const [page, setPage] = useState(1);
  const [data, setData] = useState<Paginated<Question> | null>(null);
  const [loading, setLoading] = useState(true);
  const [active, setActive] = useState<Question | null>(null);
  const [bookmarked, setBookmarked] = useState<Record<string, boolean>>({});

  const query = useMemo<QuestionFilters>(
    () => (courseSlug ? { ...filters, courseSlug } : filters),
    [filters, courseSlug],
  );

  useEffect(() => {
    let cancelled = false;
    setLoading(true);
    QuestionService.list(query, page, 8).then((response) => {
      if (cancelled) return;
      setData(response.data);
      setLoading(false);
    });
    return () => {
      cancelled = true;
    };
  }, [query, page]);

  const update = (patch: Partial<QuestionFilters>) => {
    setPage(1);
    setFilters((current) => ({ ...current, ...patch }));
  };

  const totalPages = data ? Math.max(1, Math.ceil(data.total / data.pageSize)) : 1;

  return (
    <div className="space-y-6">
      <div className="rounded-2xl border border-border bg-card p-5 shadow-soft">
        <div className="relative">
          <Search className="pointer-events-none absolute left-3 top-1/2 size-4 -translate-y-1/2 text-muted-foreground" />
          <Input
            value={filters.search ?? ""}
            onChange={(event) => update({ search: event.target.value })}
            placeholder="Search questions or chapters"
            className="h-11 pl-9"
          />
        </div>

        <div className="mt-4 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          <FilterSelect
            label="Subject"
            value={String(filters.subject)}
            options={["All", ...subjects]}
            onChange={(value) => update({ subject: value as SubjectName | "All" })}
          />
          <FilterSelect
            label="Chapter"
            value={String(filters.chapter)}
            options={["All", ...chapters]}
            onChange={(value) => update({ chapter: value })}
          />
          <FilterSelect
            label="Difficulty"
            value={String(filters.difficulty)}
            options={difficulties}
            onChange={(value) => update({ difficulty: value as Difficulty | "All" })}
          />
          {pyqMode ? (
            <FilterSelect
              label="Year"
              value={String(filters.year)}
              options={["All", "2019", "2020", "2021", "2022", "2023", "2024"]}
              onChange={(value) =>
                update({ year: value === "All" ? "All" : Number(value) })
              }
            />
          ) : (
            <FilterSelect
              label="Type"
              value={String(filters.type)}
              options={types}
              onChange={(value) => update({ type: value as QuestionType | "All" })}
            />
          )}
        </div>

        <Tabs
          value={filters.status ?? "All"}
          onValueChange={(value) =>
            update({ status: value as NonNullable<QuestionFilters["status"]> })
          }

          className="mt-4"
        >
          <TabsList className="flex-wrap">
            {statuses.map((status) => (
              <TabsTrigger key={status} value={status}>
                {status}
              </TabsTrigger>
            ))}
          </TabsList>
        </Tabs>
      </div>

      {loading ? (
        <div className="space-y-3">
          {Array.from({ length: 4 }).map((_, index) => (
            <div
              key={index}
              className="h-28 animate-pulse rounded-2xl border border-border bg-secondary/60"
            />
          ))}
        </div>
      ) : !data || data.items.length === 0 ? (
        <EmptyState
          icon={Search}
          title="No questions match these filters"
          description="Try widening the difficulty, chapter or status filters to see more practice questions."
          actionLabel="Reset filters"
          onAction={() =>
            update({
              subject: "All",
              chapter: "All",
              difficulty: "All",
              type: "All",
              status: "All",
              search: "",
              year: "All",
            })
          }
        />
      ) : (
        <div className="space-y-4">
          <p className="text-sm text-muted-foreground">
            Showing {data.items.length} of {data.total.toLocaleString("en-IN")} questions
          </p>
          {data.items.map((question) => {
            const isBookmarked = bookmarked[question.id] ?? question.bookmarked;
            return (
              <article
                key={question.id}
                className="card-hover rounded-2xl border border-border bg-card p-5 shadow-soft"
              >
                <div className="flex flex-wrap items-center gap-2">
                  <Badge variant="secondary">{question.subject}</Badge>
                  <Badge variant="outline">{question.chapter}</Badge>
                  <span
                    className={cn(
                      "rounded-full px-2.5 py-0.5 text-xs font-semibold",
                      difficultyTone[question.difficulty],
                    )}
                  >
                    {question.difficulty}
                  </span>
                  <Badge variant="outline">{question.type}</Badge>
                  {question.year ? (
                    <Badge variant="outline">PYQ {question.year}</Badge>
                  ) : null}
                  <button
                    type="button"
                    className="ml-auto text-muted-foreground transition-colors hover:text-brand-orange"
                    aria-label="Bookmark question"
                    onClick={() => {
                      setBookmarked((current) => ({
                        ...current,
                        [question.id]: !isBookmarked,
                      }));
                      toast.success(
                        isBookmarked ? "Removed from bookmarks" : "Saved to bookmarks",
                      );
                    }}
                  >
                    {isBookmarked ? (
                      <BookmarkCheck className="size-5 text-brand-orange" />
                    ) : (
                      <Bookmark className="size-5" />
                    )}
                  </button>
                </div>
                <p className="mt-3 font-medium leading-relaxed">{question.text}</p>
                <div className="mt-4 flex flex-wrap items-center gap-3">
                  <Button size="sm" onClick={() => setActive(question)}>
                    Solve question
                  </Button>
                  <span className="text-xs text-muted-foreground">
                    {question.accuracy}% of students answered correctly
                  </span>
                </div>
              </article>
            );
          })}

          <div className="flex items-center justify-between pt-2">
            <Button
              variant="outline"
              size="sm"
              disabled={page === 1}
              onClick={() => setPage((current) => Math.max(1, current - 1))}
            >
              <ChevronLeft className="size-4" /> Previous
            </Button>
            <span className="text-sm text-muted-foreground">
              Page {page} of {totalPages}
            </span>
            <Button
              variant="outline"
              size="sm"
              disabled={page >= totalPages}
              onClick={() => setPage((current) => current + 1)}
            >
              Next <ChevronRight className="size-4" />
            </Button>
          </div>
        </div>
      )}

      <QuestionDialog question={active} onClose={() => setActive(null)} />
    </div>
  );
}

function FilterSelect({
  label,
  value,
  options,
  onChange,
}: {
  label: string;
  value: string;
  options: readonly string[];
  onChange: (value: string) => void;
}) {
  return (
    <label className="space-y-1.5">
      <span className="text-xs font-medium uppercase tracking-wide text-muted-foreground">
        {label}
      </span>
      <Select value={value} onValueChange={onChange}>
        <SelectTrigger className="w-full">
          <SelectValue placeholder={label} />
        </SelectTrigger>
        <SelectContent className="max-h-72">
          {options.map((option) => (
            <SelectItem key={option} value={option}>
              {option}
            </SelectItem>
          ))}
        </SelectContent>
      </Select>
    </label>
  );
}

function QuestionDialog({
  question,
  onClose,
}: {
  question: Question | null;
  onClose: () => void;
}) {
  const [selected, setSelected] = useState<string | null>(null);
  const [revealed, setRevealed] = useState(false);
  const [showHint, setShowHint] = useState(false);
  const [seconds, setSeconds] = useState(0);

  useEffect(() => {
    if (!question) return;
    setSelected(null);
    setRevealed(false);
    setShowHint(false);
    setSeconds(0);
    const timer = setInterval(() => setSeconds((value) => value + 1), 1000);
    return () => clearInterval(timer);
  }, [question]);

  if (!question) return null;

  const minutes = String(Math.floor(seconds / 60)).padStart(2, "0");
  const remaining = String(seconds % 60).padStart(2, "0");

  return (
    <Dialog open={Boolean(question)} onOpenChange={(open) => !open && onClose()}>
      <DialogContent className="max-h-[90vh] overflow-y-auto sm:max-w-2xl">
        <DialogHeader>
          <div className="flex items-center gap-2">
            <Badge variant="secondary">{question.subject}</Badge>
            <Badge variant="outline">{question.chapter}</Badge>
            <span className="ml-auto flex items-center gap-1.5 text-sm font-medium text-muted-foreground">
              <Timer className="size-4" /> {minutes}:{remaining}
            </span>
          </div>
          <DialogTitle className="pt-2 text-left text-base leading-relaxed">
            {question.text}
          </DialogTitle>
          <DialogDescription className="text-left">
            {question.type} · {question.difficulty}
          </DialogDescription>
        </DialogHeader>

        <div className="space-y-2">
          {question.options.map((option) => {
            const isCorrect = revealed && option.id === question.correctOptionId;
            const isWrong =
              revealed && selected === option.id && option.id !== question.correctOptionId;
            return (
              <button
                key={option.id}
                type="button"
                onClick={() => setSelected(option.id)}
                className={cn(
                  "flex w-full items-center gap-3 rounded-xl border border-border px-4 py-3 text-left text-sm transition-colors hover:bg-secondary",
                  selected === option.id && "border-primary bg-primary-soft",
                  isCorrect && "border-success bg-success/10",
                  isWrong && "border-destructive bg-destructive/10",
                )}
              >
                <span className="flex size-6 shrink-0 items-center justify-center rounded-md bg-secondary text-xs font-semibold">
                  {option.id.replace("o", "")}
                </span>
                {option.text}
              </button>
            );
          })}
        </div>

        {showHint ? (
          <p className="rounded-xl bg-primary-soft p-4 text-sm text-accent-foreground">
            {question.hint}
          </p>
        ) : null}

        {revealed ? (
          <div className="space-y-2 rounded-xl border border-border bg-secondary/50 p-4">
            <h4 className="text-sm font-semibold">Solution</h4>
            <p className="text-sm leading-relaxed text-muted-foreground">
              {question.solution}
            </p>
            <div className="pt-2">
              <p className="text-xs text-muted-foreground">Community accuracy</p>
              <Progress value={question.accuracy} className="mt-1.5 h-2" />
            </div>
          </div>
        ) : null}

        <div className="flex flex-wrap gap-2">
          <Button onClick={() => setRevealed(true)} disabled={!selected}>
            Check answer
          </Button>
          <Button variant="outline" onClick={() => setShowHint(true)}>
            <Lightbulb className="size-4" /> Hint
          </Button>
          <Button
            variant="outline"
            onClick={() => toast.info("Discussion threads open once the community is live.")}
          >
            <MessageSquare className="size-4" /> Discussion
          </Button>
          <Button
            variant="ghost"
            onClick={() => toast.success("Thanks, our academic team will review this question.")}
          >
            <Flag className="size-4" /> Report
          </Button>
        </div>
      </DialogContent>
    </Dialog>
  );
}

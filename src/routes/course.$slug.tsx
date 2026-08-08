import { createFileRoute, Link, notFound } from "@tanstack/react-router";
import {
  BarChart3,
  BookMarked,
  BookOpen,
  CalendarDays,
  FileText,
  FolderOpen,
  Layers,
  PlayCircle,
  Timer,
} from "lucide-react";
import { QuestionBank } from "@/components/questions/question-bank";
import { CourseMetaStrip } from "@/components/courses/course-card";
import { PageHeader, SiteLayout } from "@/components/layout/site-layout";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from "@/components/ui/breadcrumb";
import { Progress } from "@/components/ui/progress";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import {
  getCourseBySlug,
  getSubjectsForCourse,
  mockTests,
  questions,
  studyMaterials,
} from "@/data/mock";

export const Route = createFileRoute("/course/$slug")({
  loader: ({ params }) => {
    const course = getCourseBySlug(params.slug);
    if (!course) throw notFound();
    return { course };
  },
  head: ({ loaderData }) => {
    if (!loaderData) {
      return {
        meta: [{ title: "Course not found — ExamPathway" }, { name: "robots", content: "noindex" }],
      };
    }
    const { course } = loaderData;
    return {
      meta: [
        { title: `${course.name} Preparation — Question Bank & Mock Tests | ExamPathway` },
        { name: "description", content: course.description },
        { property: "og:title", content: `${course.name} on ExamPathway` },
        { property: "og:description", content: course.description },
      ],
    };
  },
  component: CoursePage,
});

function CoursePage() {
  const { course } = Route.useLoaderData();
  const subjects = getSubjectsForCourse(course.slug);
  const chapters = [...new Set(subjects.flatMap((s) => s.chapters.map((c) => c.name)))];
  const tests = mockTests.filter((test) => test.courseSlug === course.slug);
  const materials = studyMaterials.filter((item) => item.courseSlug === course.slug);
  const bookmarks = questions
    .filter((question) => question.courseSlug === course.slug && question.bookmarked)
    .slice(0, 6);
  const daysToExam = Math.max(
    0,
    Math.round(
      (new Date(course.examDate).getTime() - Date.now()) / (1000 * 60 * 60 * 24),
    ),
  );

  return (
    <SiteLayout>
      <PageHeader title={course.name} description={course.description}>
        <div className="rounded-2xl border border-border bg-card p-5 text-center shadow-soft">
          <p className="flex items-center justify-center gap-2 text-xs uppercase tracking-wide text-muted-foreground">
            <CalendarDays className="size-4" /> Exam countdown
          </p>
          <p className="mt-2 text-3xl font-bold text-brand-orange">{daysToExam}</p>
          <p className="text-xs text-muted-foreground">days to {course.examDate}</p>
        </div>
      </PageHeader>

      <div className="section-container pt-6">
        <Breadcrumb>
          <BreadcrumbList>
            <BreadcrumbItem>
              <BreadcrumbLink asChild>
                <Link to="/">Home</Link>
              </BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbLink asChild>
                <Link to="/courses">Courses</Link>
              </BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>{course.name}</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>
      </div>

      <section className="section-container py-10">
        <Tabs defaultValue="overview">
          <TabsList className="flex flex-wrap">
            <TabsTrigger value="overview">Overview</TabsTrigger>
            <TabsTrigger value="subjects">Subjects</TabsTrigger>
            <TabsTrigger value="questions">Question Bank</TabsTrigger>
            <TabsTrigger value="pyqs">PYQs</TabsTrigger>
            <TabsTrigger value="mocks">Mock Tests</TabsTrigger>
            <TabsTrigger value="practice">Practice</TabsTrigger>
            <TabsTrigger value="bookmarks">Bookmarks</TabsTrigger>
            <TabsTrigger value="performance">Performance</TabsTrigger>
            <TabsTrigger value="resources">Resources</TabsTrigger>
          </TabsList>

          <TabsContent value="overview" className="mt-8 space-y-6">
            <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
              <CourseMetaStrip course={course} />
              <p className="mt-5 text-sm leading-relaxed text-muted-foreground">
                {course.description} The course is structured chapter by chapter, so you always
                know what to practise next. Start with a diagnostic test, then follow the
                recommended chapter order generated from your accuracy.
              </p>
              <div className="mt-6 grid gap-4 sm:grid-cols-3">
                {[
                  { icon: BookOpen, label: "Questions", value: course.questionCount.toLocaleString("en-IN") },
                  { icon: Timer, label: "Mock tests", value: String(course.mockTestCount) },
                  { icon: Layers, label: "Difficulty", value: course.difficulty },
                ].map((item) => (
                  <div key={item.label} className="rounded-xl bg-secondary/60 p-4">
                    <item.icon className="size-5 text-primary" />
                    <p className="mt-2 text-lg font-bold">{item.value}</p>
                    <p className="text-xs text-muted-foreground">{item.label}</p>
                  </div>
                ))}
              </div>
            </div>
          </TabsContent>

          <TabsContent value="subjects" className="mt-8 space-y-6">
            {subjects.map((subject) => (
              <div
                key={subject.id}
                className="rounded-2xl border border-border bg-card p-6 shadow-soft"
              >
                <div className="flex items-center justify-between">
                  <h3 className="text-lg font-semibold">{subject.name}</h3>
                  <Badge variant="secondary">{subject.chapters.length} chapters</Badge>
                </div>
                <div className="mt-5 grid gap-4 sm:grid-cols-2">
                  {subject.chapters.map((chapter) => (
                    <div key={chapter.id} className="rounded-xl border border-border p-4">
                      <div className="flex items-center justify-between text-sm">
                        <span className="font-medium">{chapter.name}</span>
                        <span className="text-muted-foreground">{chapter.progress}%</span>
                      </div>
                      <Progress value={chapter.progress} className="mt-3 h-2" />
                      <p className="mt-2 text-xs text-muted-foreground">
                        {chapter.questionCount} questions
                      </p>
                    </div>
                  ))}
                </div>
              </div>
            ))}
          </TabsContent>

          <TabsContent value="questions" className="mt-8">
            <QuestionBank
              courseSlug={course.slug}
              subjects={course.subjects}
              chapters={chapters}
            />
          </TabsContent>

          <TabsContent value="pyqs" className="mt-8">
            <QuestionBank
              courseSlug={course.slug}
              subjects={course.subjects}
              chapters={chapters}
              pyqMode
            />
          </TabsContent>

          <TabsContent value="mocks" className="mt-8 space-y-4">
            {tests.map((test) => (
              <div
                key={test.id}
                className="flex flex-col gap-4 rounded-2xl border border-border bg-card p-5 shadow-soft sm:flex-row sm:items-center"
              >
                <div className="flex-1">
                  <h3 className="font-semibold">{test.title}</h3>
                  <p className="mt-1 text-sm text-muted-foreground">
                    {test.durationMinutes} min · {test.totalMarks} marks ·{" "}
                    {test.questionCount} questions · {test.difficulty}
                  </p>
                </div>
                <Button asChild>
                  <Link to="/mock-tests">
                    <PlayCircle className="size-4" /> Start test
                  </Link>
                </Button>
              </div>
            ))}
          </TabsContent>

          <TabsContent value="practice" className="mt-8">
            <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
              <h3 className="text-lg font-semibold">Practice mode</h3>
              <p className="mt-2 text-sm text-muted-foreground">
                Untimed, solution-first practice. Pick a chapter and solve until your accuracy
                crosses the target.
              </p>
              <div className="mt-6 grid gap-4 sm:grid-cols-3">
                {subjects.map((subject) => (
                  <div key={subject.id} className="rounded-xl bg-secondary/60 p-4">
                    <p className="font-semibold">{subject.name}</p>
                    <p className="mt-1 text-xs text-muted-foreground">
                      {subject.chapters.reduce((sum, c) => sum + c.questionCount, 0)} questions
                    </p>
                    <Button asChild size="sm" variant="outline" className="mt-3">
                      <Link to="/daily-practice">Practise</Link>
                    </Button>
                  </div>
                ))}
              </div>
            </div>
          </TabsContent>

          <TabsContent value="bookmarks" className="mt-8 space-y-4">
            {bookmarks.map((question) => (
              <div
                key={question.id}
                className="rounded-2xl border border-border bg-card p-5 shadow-soft"
              >
                <div className="flex items-center gap-2">
                  <BookMarked className="size-4 text-brand-orange" />
                  <Badge variant="secondary">{question.subject}</Badge>
                  <Badge variant="outline">{question.chapter}</Badge>
                </div>
                <p className="mt-3 text-sm leading-relaxed">{question.text}</p>
              </div>
            ))}
          </TabsContent>

          <TabsContent value="performance" className="mt-8">
            <div className="rounded-2xl border border-border bg-card p-6 shadow-soft">
              <div className="flex items-center gap-2">
                <BarChart3 className="size-5 text-primary" />
                <h3 className="text-lg font-semibold">Your performance</h3>
              </div>
              <div className="mt-6 space-y-5">
                {subjects.map((subject, index) => (
                  <div key={subject.id}>
                    <div className="flex items-center justify-between text-sm">
                      <span className="font-medium">{subject.name}</span>
                      <span className="text-muted-foreground">{58 + index * 9}% accuracy</span>
                    </div>
                    <Progress value={58 + index * 9} className="mt-2 h-2" />
                  </div>
                ))}
              </div>
              <Button asChild variant="outline" className="mt-6">
                <Link to="/dashboard/performance">Open full analytics</Link>
              </Button>
            </div>
          </TabsContent>

          <TabsContent value="resources" className="mt-8 grid gap-4 sm:grid-cols-2">
            {materials.map((material) => (
              <div
                key={material.id}
                className="card-hover rounded-2xl border border-border bg-card p-5 shadow-soft"
              >
                <div className="flex items-center gap-2">
                  <FileText className="size-4 text-primary" />
                  <Badge variant="secondary">{material.type}</Badge>
                </div>
                <h3 className="mt-3 font-semibold">{material.title}</h3>
                <p className="mt-1.5 text-sm text-muted-foreground">{material.description}</p>
                <p className="mt-3 flex items-center gap-2 text-xs text-muted-foreground">
                  <FolderOpen className="size-3.5" /> {material.pages} pages · updated{" "}
                  {material.updatedAt}
                </p>
              </div>
            ))}
          </TabsContent>
        </Tabs>
      </section>
    </SiteLayout>
  );
}

export type UserRole = "student" | "admin";

export type UserStatus = "active" | "suspended";

export interface User {
  id: string;
  name: string;
  email: string;
  role: UserRole;
  status: UserStatus;
  avatarUrl?: string;
  xp: number;
  streak: number;
  joinedAt: string;
}

export type ExamSlug =
  | "jee-main"
  | "jee-advanced"
  | "bitsat"
  | "eamcet"
  | "eapcet"
  | "neet";

export type SubjectName = "Physics" | "Chemistry" | "Mathematics" | "Biology";

export type Difficulty = "Easy" | "Medium" | "Hard";

export type QuestionType =
  | "MCQ"
  | "Integer"
  | "Numerical"
  | "Match"
  | "Assertion Reason";

export interface Course {
  id: string;
  slug: ExamSlug;
  name: string;
  category: "Engineering" | "Medical";
  description: string;
  subjects: SubjectName[];
  difficulty: Difficulty;
  questionCount: number;
  mockTestCount: number;
  students: number;
  rating: number;
  examDate: string;
  image: string;
}

export interface Subject {
  id: string;
  courseSlug: ExamSlug;
  name: SubjectName;
  chapters: Chapter[];
}

export interface Chapter {
  id: string;
  name: string;
  questionCount: number;
  progress: number;
}

export interface QuestionOption {
  id: string;
  text: string;
}

export interface Question {
  id: string;
  courseSlug: ExamSlug;
  subject: SubjectName;
  chapter: string;
  difficulty: Difficulty;
  type: QuestionType;
  year?: number;
  text: string;
  options: QuestionOption[];
  correctOptionId: string;
  hint: string;
  solution: string;
  attempted: boolean;
  bookmarked: boolean;
  accuracy: number;
}

export interface QuestionFile {
  id: string;
  name: string;
  extension: "pdf" | "docx" | "csv" | "zip" | "png" | "jpg";
  sizeKb: number;
  folder: string;
  courseSlug: ExamSlug;
  subject?: SubjectName;
  chapter?: string;
  uploadedBy: string;
  uploadedAt: string;
  category: "Question Paper" | "Notes" | "Solutions" | "Formula Sheet";
}

export interface StudyMaterial {
  id: string;
  title: string;
  description: string;
  courseSlug: ExamSlug;
  subject: SubjectName;
  type: "Notes" | "Formula Sheet" | "Revision" | "Solutions";
  pages: number;
  updatedAt: string;
}

export interface MockTest {
  id: string;
  title: string;
  courseSlug: ExamSlug;
  durationMinutes: number;
  totalMarks: number;
  questionCount: number;
  difficulty: Difficulty;
  attempts: number;
  published: boolean;
  instructions: string[];
}

export interface Announcement {
  id: string;
  title: string;
  body: string;
  type: "Announcement" | "Notice" | "Exam Update" | "Maintenance";
  publishedAt: string;
  pinned: boolean;
}

export interface Result {
  id: string;
  testId: string;
  testTitle: string;
  userId: string;
  score: number;
  totalMarks: number;
  accuracy: number;
  rank: number;
  takenAt: string;
}

export interface Bookmark {
  id: string;
  questionId: string;
  userId: string;
  createdAt: string;
}

export interface Progress {
  subject: SubjectName;
  completion: number;
  accuracy: number;
  questionsSolved: number;
}

export interface LeaderboardEntry {
  id: string;
  rank: number;
  name: string;
  xp: number;
  testsAttempted: number;
  accuracy: number;
  avatarUrl?: string;
}

export interface QuestionFilters {
  courseSlug?: ExamSlug;
  subject?: SubjectName | "All";
  chapter?: string | "All";
  difficulty?: Difficulty | "All";
  type?: QuestionType | "All";
  status?: "All" | "Attempted" | "Not Attempted" | "Bookmarked";
  search?: string;
  year?: number | "All";
}

export interface Paginated<T> {
  items: T[];
  total: number;
  page: number;
  pageSize: number;
}

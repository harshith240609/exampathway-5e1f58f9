import { questions } from "@/data/mock";
import type { Paginated, Question, QuestionFilters } from "@/types";
import { delay, ok, type ServiceResponse } from "./base";

const matches = (question: Question, filters: QuestionFilters) => {
  if (filters.courseSlug && question.courseSlug !== filters.courseSlug) return false;
  if (filters.subject && filters.subject !== "All" && question.subject !== filters.subject)
    return false;
  if (filters.chapter && filters.chapter !== "All" && question.chapter !== filters.chapter)
    return false;
  if (
    filters.difficulty &&
    filters.difficulty !== "All" &&
    question.difficulty !== filters.difficulty
  )
    return false;
  if (filters.type && filters.type !== "All" && question.type !== filters.type)
    return false;
  if (filters.year && filters.year !== "All" && question.year !== filters.year)
    return false;
  if (filters.status === "Attempted" && !question.attempted) return false;
  if (filters.status === "Not Attempted" && question.attempted) return false;
  if (filters.status === "Bookmarked" && !question.bookmarked) return false;
  if (filters.search) {
    const term = filters.search.toLowerCase();
    if (
      !question.text.toLowerCase().includes(term) &&
      !question.chapter.toLowerCase().includes(term)
    )
      return false;
  }
  return true;
};

export const QuestionService = {
  async list(
    filters: QuestionFilters = {},
    page = 1,
    pageSize = 8,
  ): Promise<ServiceResponse<Paginated<Question>>> {
    await delay(180);
    const filtered = questions.filter((question) => matches(question, filters));
    const start = (page - 1) * pageSize;
    return ok({
      items: filtered.slice(start, start + pageSize),
      total: filtered.length,
      page,
      pageSize,
    });
  },

  async getById(id: string): Promise<ServiceResponse<Question | null>> {
    await delay(120);
    return ok(questions.find((question) => question.id === id) ?? null);
  },

  async bookmarks(): Promise<ServiceResponse<Question[]>> {
    await delay(140);
    return ok(questions.filter((question) => question.bookmarked).slice(0, 24));
  },

  async pyqs(filters: QuestionFilters = {}): Promise<ServiceResponse<Question[]>> {
    await delay(160);
    return ok(
      questions.filter((question) => Boolean(question.year) && matches(question, filters)),
    );
  },

  async create(question: Omit<Question, "id">): Promise<ServiceResponse<Question>> {
    await delay();
    return ok({ ...question, id: `q-${Date.now()}` });
  },

  async update(id: string, patch: Partial<Question>): Promise<ServiceResponse<string>> {
    await delay();
    void patch;
    return ok(id);
  },

  async remove(id: string): Promise<ServiceResponse<string>> {
    await delay();
    return ok(id);
  },

  async bulkUpload(fileName: string): Promise<ServiceResponse<number>> {
    await delay(600);
    void fileName;
    return ok(128);
  },
};

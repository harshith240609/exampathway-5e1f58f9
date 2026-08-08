import { mockTests, results } from "@/data/mock";
import type { ExamSlug, MockTest, Result } from "@/types";
import { delay, ok, type ServiceResponse } from "./base";

export const MockTestService = {
  async list(courseSlug?: ExamSlug | "All"): Promise<ServiceResponse<MockTest[]>> {
    await delay(160);
    return ok(
      !courseSlug || courseSlug === "All"
        ? mockTests
        : mockTests.filter((test) => test.courseSlug === courseSlug),
    );
  },

  async getById(id: string): Promise<ServiceResponse<MockTest | null>> {
    await delay(120);
    return ok(mockTests.find((test) => test.id === id) ?? null);
  },

  async results(): Promise<ServiceResponse<Result[]>> {
    await delay(140);
    return ok(results);
  },

  async create(test: Omit<MockTest, "id">): Promise<ServiceResponse<MockTest>> {
    await delay();
    return ok({ ...test, id: `mt-${Date.now()}` });
  },

  async publish(id: string, published: boolean): Promise<ServiceResponse<boolean>> {
    await delay();
    void id;
    return ok(published);
  },

  async remove(id: string): Promise<ServiceResponse<string>> {
    await delay();
    return ok(id);
  },
};

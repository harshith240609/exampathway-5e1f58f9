import { courses, getSubjectsForCourse } from "@/data/mock";
import type { Course, ExamSlug, Subject } from "@/types";
import { delay, ok, type ServiceResponse } from "./base";

export const CourseService = {
  async list(search = ""): Promise<ServiceResponse<Course[]>> {
    await delay(180);
    const term = search.trim().toLowerCase();
    return ok(
      term
        ? courses.filter(
            (course) =>
              course.name.toLowerCase().includes(term) ||
              course.description.toLowerCase().includes(term),
          )
        : courses,
    );
  },

  async getBySlug(slug: ExamSlug | string): Promise<ServiceResponse<Course | null>> {
    await delay(140);
    return ok(courses.find((course) => course.slug === slug) ?? null);
  },

  async subjects(slug: ExamSlug | string): Promise<ServiceResponse<Subject[]>> {
    await delay(140);
    return ok(getSubjectsForCourse(slug));
  },
};

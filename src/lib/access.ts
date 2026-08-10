export const FREE_QUESTIONS_PER_SUBJECT = 25;
export const FREE_MOCK_TESTS_PER_COURSE = 1;

export const formatINR = (amount: number) =>
  new Intl.NumberFormat("en-IN", {
    style: "currency",
    currency: "INR",
    maximumFractionDigits: 0,
  }).format(amount);

export interface CourseSummary {
  id: string;
  slug: string;
  name: string;
  category: string;
  description: string;
  subjects: { id: string; name: string }[];
  questionCount: number;
  mockTestCount: number;
}

export interface PlanSummary {
  id: string;
  slug: string;
  name: string;
  price_inr: number;
  kind: string;
  courses: string[];
}

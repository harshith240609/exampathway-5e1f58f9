/**
 * Server-only helpers for the verified-free-account allowance.
 *
 * Every decision here (email verification, free question allowance, free mock
 * usage) is made against the database with the service-role client, so it can
 * never be manipulated from the browser.
 */

export const EMAIL_NOT_VERIFIED =
  "Please verify your email address to activate your free ExamPathway account.";

async function admin() {
  const { supabaseAdmin } = await import("@/integrations/supabase/client.server");
  return supabaseAdmin;
}

/** Throws unless the authenticated user has confirmed their email address. */
export async function requireVerifiedEmail(userId: string) {
  const client = await admin();
  const { data, error } = await client.auth.admin.getUserById(userId);
  if (error || !data.user) throw new Error("Unauthorized");
  if (!data.user.email_confirmed_at) throw new Error(EMAIL_NOT_VERIFIED);
  return data.user;
}

export interface FreeAccessRow {
  user_id: string;
  course_id: string;
  free_question_limit: number;
  questions_used: number;
  free_mock_available: boolean;
  free_mock_used: boolean;
  free_mock_test_id: string | null;
}

/** Returns the user's free-access record for a course, creating it on first use. */
export async function ensureFreeAccess(
  userId: string,
  courseId: string,
  freeQuestionLimit: number,
): Promise<FreeAccessRow> {
  const client = await admin();
  const { data: existing } = await client
    .from("course_free_access")
    .select(
      "user_id, course_id, free_question_limit, questions_used, free_mock_available, free_mock_used, free_mock_test_id",
    )
    .eq("user_id", userId)
    .eq("course_id", courseId)
    .maybeSingle();
  if (existing) return existing as FreeAccessRow;

  const { data, error } = await client
    .from("course_free_access")
    .insert({ user_id: userId, course_id: courseId, free_question_limit: freeQuestionLimit })
    .select(
      "user_id, course_id, free_question_limit, questions_used, free_mock_available, free_mock_used, free_mock_test_id",
    )
    .single();
  if (error) throw new Error(error.message);
  return data as FreeAccessRow;
}

/** Records how much of the free question allocation the student has seen. */
export async function recordQuestionsUsed(userId: string, courseId: string, used: number) {
  const client = await admin();
  await client
    .from("course_free_access")
    .update({ questions_used: used })
    .eq("user_id", userId)
    .eq("course_id", courseId)
    .lt("questions_used", used);
}

/** Marks the single free mock test for a course as consumed. */
export async function markFreeMockUsed(userId: string, courseId: string, mockTestId: string) {
  const client = await admin();
  const { error } = await client
    .from("course_free_access")
    .update({ free_mock_used: true, free_mock_available: false, free_mock_test_id: mockTestId })
    .eq("user_id", userId)
    .eq("course_id", courseId)
    .eq("free_mock_used", false);
  if (error) throw new Error(error.message);
}

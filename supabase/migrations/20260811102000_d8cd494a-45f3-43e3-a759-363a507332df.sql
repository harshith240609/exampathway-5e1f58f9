CREATE TABLE public.course_free_access (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  course_id uuid NOT NULL REFERENCES public.courses(id) ON DELETE CASCADE,
  free_question_limit integer NOT NULL DEFAULT 25,
  questions_used integer NOT NULL DEFAULT 0,
  free_mock_available boolean NOT NULL DEFAULT true,
  free_mock_used boolean NOT NULL DEFAULT false,
  free_mock_test_id uuid REFERENCES public.mock_tests(id) ON DELETE SET NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (user_id, course_id)
);

GRANT SELECT ON public.course_free_access TO authenticated;
GRANT ALL ON public.course_free_access TO service_role;

ALTER TABLE public.course_free_access ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users read own free access"
ON public.course_free_access FOR SELECT TO authenticated
USING (auth.uid() = user_id OR public.has_role(auth.uid(), 'admin'::app_role));

CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS trigger LANGUAGE plpgsql SET search_path = public AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

REVOKE EXECUTE ON FUNCTION public.set_updated_at() FROM PUBLIC, anon, authenticated;

CREATE TRIGGER update_course_free_access_updated_at
BEFORE UPDATE ON public.course_free_access
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

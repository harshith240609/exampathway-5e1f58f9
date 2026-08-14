CREATE TABLE public.question_sets (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  course_id uuid NOT NULL REFERENCES public.courses(id) ON DELETE CASCADE,
  subject_id uuid NOT NULL REFERENCES public.subjects(id) ON DELETE CASCADE,
  chapter_id uuid REFERENCES public.chapters(id) ON DELETE CASCADE,
  topic_id uuid REFERENCES public.topics(id) ON DELETE CASCADE,
  kind text NOT NULL DEFAULT 'topic',
  name text NOT NULL,
  target_count integer NOT NULL DEFAULT 10,
  sort_order integer NOT NULL DEFAULT 0,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  CONSTRAINT question_sets_kind_check CHECK (kind IN ('topic','chapter','module'))
);

CREATE UNIQUE INDEX question_sets_topic_unique ON public.question_sets (topic_id, name) WHERE topic_id IS NOT NULL;
CREATE UNIQUE INDEX question_sets_chapter_unique ON public.question_sets (chapter_id, name) WHERE topic_id IS NULL AND chapter_id IS NOT NULL;
CREATE UNIQUE INDEX question_sets_module_unique ON public.question_sets (subject_id, name) WHERE chapter_id IS NULL AND topic_id IS NULL;

GRANT SELECT ON public.question_sets TO anon;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.question_sets TO authenticated;
GRANT ALL ON public.question_sets TO service_role;
ALTER TABLE public.question_sets ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read question sets" ON public.question_sets FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "Admins manage question sets" ON public.question_sets FOR ALL TO authenticated USING (public.has_role(auth.uid(),'admin')) WITH CHECK (public.has_role(auth.uid(),'admin'));
CREATE TRIGGER update_question_sets_updated_at BEFORE UPDATE ON public.question_sets FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

ALTER TABLE public.questions
  ADD COLUMN question_set_id uuid REFERENCES public.question_sets(id) ON DELETE SET NULL,
  ADD COLUMN question_number integer,
  ADD COLUMN marks numeric NOT NULL DEFAULT 4,
  ADD COLUMN negative_marks numeric NOT NULL DEFAULT 1,
  ADD COLUMN is_active boolean NOT NULL DEFAULT true;

CREATE INDEX questions_set_idx ON public.questions (question_set_id);
CREATE INDEX questions_topic_idx ON public.questions (topic_id);
CREATE INDEX questions_chapter_idx ON public.questions (chapter_id);

ALTER TABLE public.mock_tests
  ADD COLUMN paper integer NOT NULL DEFAULT 1,
  ADD COLUMN pattern text NOT NULL DEFAULT '';

CREATE TABLE public.mock_test_sections (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  mock_test_id uuid NOT NULL REFERENCES public.mock_tests(id) ON DELETE CASCADE,
  subject_id uuid REFERENCES public.subjects(id) ON DELETE SET NULL,
  name text NOT NULL,
  question_count integer NOT NULL DEFAULT 0,
  marks_per_question numeric NOT NULL DEFAULT 4,
  negative_marks numeric NOT NULL DEFAULT 1,
  question_type text NOT NULL DEFAULT 'MCQ',
  sort_order integer NOT NULL DEFAULT 0,
  created_at timestamp with time zone NOT NULL DEFAULT now()
);

GRANT SELECT ON public.mock_test_sections TO anon;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.mock_test_sections TO authenticated;
GRANT ALL ON public.mock_test_sections TO service_role;
ALTER TABLE public.mock_test_sections ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read test sections" ON public.mock_test_sections FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "Admins manage test sections" ON public.mock_test_sections FOR ALL TO authenticated USING (public.has_role(auth.uid(),'admin')) WITH CHECK (public.has_role(auth.uid(),'admin'));
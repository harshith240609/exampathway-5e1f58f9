-- ROLES
CREATE TYPE public.app_role AS ENUM ('admin','student');

CREATE TABLE public.profiles (
  id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  full_name text NOT NULL DEFAULT '',
  email text NOT NULL DEFAULT '',
  class_level text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
GRANT SELECT, INSERT, UPDATE ON public.profiles TO authenticated;
GRANT ALL ON public.profiles TO service_role;
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

CREATE TABLE public.user_roles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  role public.app_role NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (user_id, role)
);
GRANT SELECT ON public.user_roles TO authenticated;
GRANT ALL ON public.user_roles TO service_role;
ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;

CREATE OR REPLACE FUNCTION public.has_role(_user_id uuid, _role public.app_role)
RETURNS boolean LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public AS $$
  SELECT EXISTS (SELECT 1 FROM public.user_roles WHERE user_id = _user_id AND role = _role);
$$;

CREATE POLICY "Users read own profile" ON public.profiles FOR SELECT TO authenticated USING (auth.uid() = id OR public.has_role(auth.uid(),'admin'));
CREATE POLICY "Users insert own profile" ON public.profiles FOR INSERT TO authenticated WITH CHECK (auth.uid() = id);
CREATE POLICY "Users update own profile" ON public.profiles FOR UPDATE TO authenticated USING (auth.uid() = id) WITH CHECK (auth.uid() = id);
CREATE POLICY "Users read own roles" ON public.user_roles FOR SELECT TO authenticated USING (auth.uid() = user_id OR public.has_role(auth.uid(),'admin'));

-- auto profile + role on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger LANGUAGE plpgsql SECURITY DEFINER SET search_path = public AS $$
BEGIN
  INSERT INTO public.profiles (id, full_name, email, class_level)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'full_name', ''),
    COALESCE(NEW.email, ''),
    NEW.raw_user_meta_data->>'class_level'
  )
  ON CONFLICT (id) DO NOTHING;

  INSERT INTO public.user_roles (user_id, role) VALUES (NEW.id, 'student')
  ON CONFLICT DO NOTHING;

  IF NEW.email_confirmed_at IS NOT NULL AND lower(NEW.email) = 'harshithsaijammula@gmail.com' THEN
    INSERT INTO public.user_roles (user_id, role) VALUES (NEW.id, 'admin') ON CONFLICT DO NOTHING;
  END IF;
  RETURN NEW;
END;
$$;
CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users
FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

CREATE OR REPLACE FUNCTION public.grant_admin_on_verify()
RETURNS trigger LANGUAGE plpgsql SECURITY DEFINER SET search_path = public AS $$
BEGIN
  IF NEW.email_confirmed_at IS NOT NULL AND lower(NEW.email) = 'harshithsaijammula@gmail.com' THEN
    INSERT INTO public.user_roles (user_id, role) VALUES (NEW.id,'admin') ON CONFLICT DO NOTHING;
  END IF;
  RETURN NEW;
END;
$$;
CREATE TRIGGER on_auth_user_confirmed AFTER UPDATE OF email_confirmed_at ON auth.users
FOR EACH ROW WHEN (OLD.email_confirmed_at IS NULL AND NEW.email_confirmed_at IS NOT NULL)
EXECUTE FUNCTION public.grant_admin_on_verify();

-- CATALOGUE
CREATE TABLE public.courses (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug text NOT NULL UNIQUE,
  name text NOT NULL,
  category text NOT NULL,
  description text NOT NULL DEFAULT '',
  sort_order int NOT NULL DEFAULT 0,
  is_active boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE public.subjects (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  course_id uuid NOT NULL REFERENCES public.courses(id) ON DELETE CASCADE,
  name text NOT NULL,
  sort_order int NOT NULL DEFAULT 0,
  UNIQUE (course_id, name)
);
CREATE TABLE public.chapters (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  subject_id uuid NOT NULL REFERENCES public.subjects(id) ON DELETE CASCADE,
  name text NOT NULL,
  sort_order int NOT NULL DEFAULT 0,
  UNIQUE (subject_id, name)
);
CREATE TABLE public.topics (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  chapter_id uuid NOT NULL REFERENCES public.chapters(id) ON DELETE CASCADE,
  name text NOT NULL,
  sort_order int NOT NULL DEFAULT 0,
  UNIQUE (chapter_id, name)
);
CREATE TABLE public.questions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  course_id uuid NOT NULL REFERENCES public.courses(id) ON DELETE CASCADE,
  subject_id uuid NOT NULL REFERENCES public.subjects(id) ON DELETE CASCADE,
  chapter_id uuid REFERENCES public.chapters(id) ON DELETE SET NULL,
  topic_id uuid REFERENCES public.topics(id) ON DELETE SET NULL,
  question_text text NOT NULL,
  difficulty text NOT NULL DEFAULT 'Medium',
  question_type text NOT NULL DEFAULT 'MCQ',
  exam_year int,
  is_pyq boolean NOT NULL DEFAULT false,
  explanation text,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX questions_course_subject_idx ON public.questions (course_id, subject_id, created_at);
CREATE TABLE public.question_options (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  question_id uuid NOT NULL REFERENCES public.questions(id) ON DELETE CASCADE,
  label text NOT NULL,
  option_text text NOT NULL,
  is_correct boolean NOT NULL DEFAULT false,
  sort_order int NOT NULL DEFAULT 0
);
CREATE INDEX question_options_question_idx ON public.question_options (question_id);

CREATE TABLE public.mock_tests (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  course_id uuid NOT NULL REFERENCES public.courses(id) ON DELETE CASCADE,
  title text NOT NULL,
  description text NOT NULL DEFAULT '',
  duration_minutes int NOT NULL DEFAULT 180,
  total_marks int NOT NULL DEFAULT 300,
  is_free boolean NOT NULL DEFAULT false,
  is_published boolean NOT NULL DEFAULT false,
  sort_order int NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE TABLE public.mock_test_questions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  mock_test_id uuid NOT NULL REFERENCES public.mock_tests(id) ON DELETE CASCADE,
  question_id uuid NOT NULL REFERENCES public.questions(id) ON DELETE CASCADE,
  sort_order int NOT NULL DEFAULT 0,
  UNIQUE (mock_test_id, question_id)
);
CREATE TABLE public.mock_test_attempts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  mock_test_id uuid NOT NULL REFERENCES public.mock_tests(id) ON DELETE CASCADE,
  started_at timestamptz NOT NULL DEFAULT now(),
  submitted_at timestamptz,
  score numeric,
  total_marks int,
  accuracy numeric,
  answers jsonb NOT NULL DEFAULT '{}'::jsonb
);
CREATE INDEX mock_attempts_user_idx ON public.mock_test_attempts (user_id, mock_test_id);

-- PLANS / SUBSCRIPTIONS / PAYMENTS
CREATE TABLE public.plans (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug text NOT NULL UNIQUE,
  name text NOT NULL,
  price_inr int NOT NULL,
  billing_period text NOT NULL DEFAULT 'month',
  kind text NOT NULL DEFAULT 'individual',
  sort_order int NOT NULL DEFAULT 0,
  is_active boolean NOT NULL DEFAULT true
);
CREATE TABLE public.plan_courses (
  plan_id uuid NOT NULL REFERENCES public.plans(id) ON DELETE CASCADE,
  course_id uuid NOT NULL REFERENCES public.courses(id) ON DELETE CASCADE,
  PRIMARY KEY (plan_id, course_id)
);
CREATE TABLE public.subscriptions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  plan_id uuid NOT NULL REFERENCES public.plans(id) ON DELETE RESTRICT,
  status text NOT NULL DEFAULT 'pending',
  started_at timestamptz,
  expires_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX subscriptions_user_idx ON public.subscriptions (user_id, status);
CREATE TABLE public.payments (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  plan_id uuid NOT NULL REFERENCES public.plans(id) ON DELETE RESTRICT,
  subscription_id uuid REFERENCES public.subscriptions(id) ON DELETE SET NULL,
  amount_inr int NOT NULL,
  status text NOT NULL DEFAULT 'pending',
  transaction_id text,
  gateway text,
  created_at timestamptz NOT NULL DEFAULT now(),
  paid_at timestamptz
);

GRANT SELECT ON public.courses, public.subjects, public.chapters, public.topics, public.plans, public.plan_courses TO anon, authenticated;
GRANT ALL ON public.courses, public.subjects, public.chapters, public.topics, public.plans, public.plan_courses TO service_role;
GRANT SELECT ON public.mock_tests TO anon, authenticated;
GRANT ALL ON public.mock_tests, public.mock_test_questions, public.questions, public.question_options TO service_role;
GRANT SELECT, INSERT, UPDATE ON public.mock_test_attempts TO authenticated;
GRANT ALL ON public.mock_test_attempts TO service_role;
GRANT SELECT, INSERT ON public.subscriptions, public.payments TO authenticated;
GRANT ALL ON public.subscriptions, public.payments TO service_role;

ALTER TABLE public.courses ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.subjects ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.chapters ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.topics ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.question_options ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.mock_tests ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.mock_test_questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.mock_test_attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.plans ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.plan_courses ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.subscriptions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.payments ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read courses" ON public.courses FOR SELECT TO anon, authenticated USING (is_active);
CREATE POLICY "Public read subjects" ON public.subjects FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "Public read chapters" ON public.chapters FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "Public read topics" ON public.topics FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "Public read plans" ON public.plans FOR SELECT TO anon, authenticated USING (is_active);
CREATE POLICY "Public read plan courses" ON public.plan_courses FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "Public read published tests" ON public.mock_tests FOR SELECT TO anon, authenticated USING (is_published);

CREATE POLICY "Admins manage courses" ON public.courses FOR ALL TO authenticated USING (public.has_role(auth.uid(),'admin')) WITH CHECK (public.has_role(auth.uid(),'admin'));
CREATE POLICY "Admins manage subjects" ON public.subjects FOR ALL TO authenticated USING (public.has_role(auth.uid(),'admin')) WITH CHECK (public.has_role(auth.uid(),'admin'));
CREATE POLICY "Admins manage chapters" ON public.chapters FOR ALL TO authenticated USING (public.has_role(auth.uid(),'admin')) WITH CHECK (public.has_role(auth.uid(),'admin'));
CREATE POLICY "Admins manage topics" ON public.topics FOR ALL TO authenticated USING (public.has_role(auth.uid(),'admin')) WITH CHECK (public.has_role(auth.uid(),'admin'));
CREATE POLICY "Admins manage questions" ON public.questions FOR ALL TO authenticated USING (public.has_role(auth.uid(),'admin')) WITH CHECK (public.has_role(auth.uid(),'admin'));
CREATE POLICY "Admins manage options" ON public.question_options FOR ALL TO authenticated USING (public.has_role(auth.uid(),'admin')) WITH CHECK (public.has_role(auth.uid(),'admin'));
CREATE POLICY "Admins manage tests" ON public.mock_tests FOR ALL TO authenticated USING (public.has_role(auth.uid(),'admin')) WITH CHECK (public.has_role(auth.uid(),'admin'));
CREATE POLICY "Admins manage test questions" ON public.mock_test_questions FOR ALL TO authenticated USING (public.has_role(auth.uid(),'admin')) WITH CHECK (public.has_role(auth.uid(),'admin'));
CREATE POLICY "Admins manage plans" ON public.plans FOR ALL TO authenticated USING (public.has_role(auth.uid(),'admin')) WITH CHECK (public.has_role(auth.uid(),'admin'));

CREATE POLICY "Own attempts" ON public.mock_test_attempts FOR SELECT TO authenticated USING (auth.uid() = user_id OR public.has_role(auth.uid(),'admin'));
CREATE POLICY "Insert own attempts" ON public.mock_test_attempts FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Update own attempts" ON public.mock_test_attempts FOR UPDATE TO authenticated USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Own subscriptions" ON public.subscriptions FOR SELECT TO authenticated USING (auth.uid() = user_id OR public.has_role(auth.uid(),'admin'));
CREATE POLICY "Own payments" ON public.payments FOR SELECT TO authenticated USING (auth.uid() = user_id OR public.has_role(auth.uid(),'admin'));

-- access helper
CREATE OR REPLACE FUNCTION public.has_course_access(_user_id uuid, _course_id uuid)
RETURNS boolean LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.subscriptions s
    JOIN public.plan_courses pc ON pc.plan_id = s.plan_id
    WHERE s.user_id = _user_id
      AND pc.course_id = _course_id
      AND s.status = 'active'
      AND (s.expires_at IS NULL OR s.expires_at > now())
  );
$$;

-- SEED: exam structure and pricing (structural data only)
INSERT INTO public.courses (slug, name, category, description, sort_order) VALUES
 ('jee-main','JEE Main','Engineering','National level engineering entrance exam for admission to NITs, IIITs and CFTIs.',1),
 ('jee-advanced','JEE Advanced','Engineering','Entrance exam for admission to the Indian Institutes of Technology.',2),
 ('bitsat','BITSAT','Engineering','Computer based entrance exam for BITS Pilani, Goa and Hyderabad campuses.',3),
 ('neet','NEET','Medical','National eligibility cum entrance exam for undergraduate medical courses.',4),
 ('eapcet','EAPCET','Engineering','State level engineering, agriculture and pharmacy common entrance exam.',5);

INSERT INTO public.subjects (course_id, name, sort_order)
SELECT c.id, s.name, s.ord FROM public.courses c
JOIN (VALUES
 ('jee-main','Physics',1),('jee-main','Chemistry',2),('jee-main','Mathematics',3),
 ('jee-advanced','Physics',1),('jee-advanced','Chemistry',2),('jee-advanced','Mathematics',3),
 ('bitsat','Physics',1),('bitsat','Chemistry',2),('bitsat','Mathematics',3),('bitsat','English Proficiency',4),('bitsat','Logical Reasoning',5),
 ('neet','Physics',1),('neet','Chemistry',2),('neet','Botany',3),('neet','Zoology',4),
 ('eapcet','Physics',1),('eapcet','Chemistry',2),('eapcet','Mathematics',3)
) AS s(slug,name,ord) ON s.slug = c.slug;

INSERT INTO public.plans (slug,name,price_inr,kind,sort_order) VALUES
 ('jee-main','JEE Main',200,'individual',1),
 ('jee-advanced','JEE Advanced',200,'individual',2),
 ('bitsat','BITSAT',200,'individual',3),
 ('eapcet','EAPCET',200,'individual',4),
 ('neet','NEET',300,'individual',5),
 ('jee-main-advanced','JEE Main + JEE Advanced',300,'combo',6),
 ('jee-main-advanced-bitsat','JEE Main + JEE Advanced + BITSAT',450,'combo',7),
 ('jee-main-advanced-bitsat-eapcet','JEE Main + JEE Advanced + BITSAT + EAPCET',600,'combo',8);

INSERT INTO public.plan_courses (plan_id, course_id)
SELECT p.id, c.id FROM public.plans p JOIN (VALUES
 ('jee-main','jee-main'),
 ('jee-advanced','jee-advanced'),
 ('bitsat','bitsat'),
 ('eapcet','eapcet'),
 ('neet','neet'),
 ('jee-main-advanced','jee-main'),('jee-main-advanced','jee-advanced'),
 ('jee-main-advanced-bitsat','jee-main'),('jee-main-advanced-bitsat','jee-advanced'),('jee-main-advanced-bitsat','bitsat'),
 ('jee-main-advanced-bitsat-eapcet','jee-main'),('jee-main-advanced-bitsat-eapcet','jee-advanced'),('jee-main-advanced-bitsat-eapcet','bitsat'),('jee-main-advanced-bitsat-eapcet','eapcet')
) AS m(plan_slug, course_slug) ON m.plan_slug = p.slug
JOIN public.courses c ON c.slug = m.course_slug;
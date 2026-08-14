INSERT INTO public.question_sets (course_id, subject_id, chapter_id, topic_id, kind, name, target_count, sort_order)
SELECT c.course_id, ch.subject_id, t.chapter_id, t.id, 'topic', 'Topic Set 1', 10, 1
FROM public.topics t
JOIN public.chapters ch ON ch.id = t.chapter_id
JOIN public.subjects c ON c.id = ch.subject_id
WHERE NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.topic_id = t.id AND qs.name = 'Topic Set 1');
INSERT INTO public.question_sets (course_id, subject_id, chapter_id, topic_id, kind, name, target_count, sort_order)
SELECT s.course_id, ch.subject_id, ch.id, NULL, 'chapter', 'Set ' || g, 10, g
FROM public.chapters ch
JOIN public.subjects s ON s.id = ch.subject_id
CROSS JOIN generate_series(1, 10) g
WHERE NOT EXISTS (
  SELECT 1 FROM public.question_sets qs
  WHERE qs.chapter_id = ch.id AND qs.topic_id IS NULL AND qs.name = 'Set ' || g
);
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 25, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-main' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 25, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-main' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 25, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-main' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 25, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-main' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 25, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-main' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 25, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-main' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 25, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-main' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 25, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-main' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 25, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-main' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 25, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-main' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 25, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-main' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 25, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-main' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 25, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-main' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 25, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-main' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 25, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-main' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 18, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-advanced' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 18, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-advanced' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 18, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-advanced' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 18, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-advanced' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 18, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-advanced' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 18, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-advanced' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 18, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-advanced' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 18, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-advanced' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 18, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-advanced' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 18, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-advanced' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 18, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-advanced' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 18, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-advanced' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 18, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-advanced' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 18, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-advanced' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 18, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'jee-advanced' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 30, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 30, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 30, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 30, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 30, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 30, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 30, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 30, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 30, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 30, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 10, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'English Proficiency'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 10, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'English Proficiency'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 10, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'English Proficiency'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 10, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'English Proficiency'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 10, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'English Proficiency'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 20, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Logical Reasoning'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 20, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Logical Reasoning'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 20, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Logical Reasoning'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 20, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Logical Reasoning'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 20, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Logical Reasoning'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 40, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 40, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 40, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 40, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 40, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'bitsat' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 45, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 45, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 45, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 45, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 45, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 45, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 45, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 45, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 45, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 45, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 45, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Botany'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 45, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Botany'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 45, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Botany'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 45, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Botany'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 45, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Botany'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 45, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Zoology'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 45, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Zoology'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 45, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Zoology'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 45, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Zoology'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 45, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'neet' AND s.name = 'Zoology'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 80, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'eapcet' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 80, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'eapcet' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 80, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'eapcet' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 80, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'eapcet' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 80, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'eapcet' AND s.name = 'Mathematics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 40, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'eapcet' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 40, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'eapcet' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 40, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'eapcet' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 40, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'eapcet' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 40, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'eapcet' AND s.name = 'Physics'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 1', 40, 1
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'eapcet' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 1');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 2', 40, 2
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'eapcet' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 2');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 3', 40, 3
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'eapcet' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 3');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 4', 40, 4
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'eapcet' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 4');
INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', 'Module 5', 40, 5
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = 'eapcet' AND s.name = 'Chemistry'
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = 'Module 5');
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 1', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, true, false, 11, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 2', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 21, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 3', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 31, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 3');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 3'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 3'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 3'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 4', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 41, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 4');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 4'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 4'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 4'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 5', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 51, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 5');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 5'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 5'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 5'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 6', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 61, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 6');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 6'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 6'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 6'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 7', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 71, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 7');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 7'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 7'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 7'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 8', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 81, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 8');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 8'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 8'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 8'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 9', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 91, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 9');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 9'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 9'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 9'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 10', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 101, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 10');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 10'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 10'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 10'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 11', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 111, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 11');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 11'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 11'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 11'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 12', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 121, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 12');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 12'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 12'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 12'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 13', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 131, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 13');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 13'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 13'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 13'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 14', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 141, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 14');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 14'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 14'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 14'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 15', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 151, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 15');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 15'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 15'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 15'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 16', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 161, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 16');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 16'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 16'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 16'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 17', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 171, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 17');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 17'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 17'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 17'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 18', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 181, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 18');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 18'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 18'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 18'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 19', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 191, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 19');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 19'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 19'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 19'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 20', 'Full-length test following the JEE Main Paper 1 (B.E./B.Tech.) pattern (75 questions).', 180, 300, false, false, 201, 1, 'JEE Main Paper 1 (B.E./B.Tech.)'
FROM public.courses co WHERE co.slug = 'jee-main'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 20');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 25, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 20'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 25, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 20'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 25, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-main'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Main Paper 1 (B.E./B.Tech.) Full Test 20'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 1', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, true, false, 11, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 2', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 21, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 3', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 31, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 3');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 3'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 3'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 3'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 3'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 3'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 4', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 41, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 4');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 4'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 4'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 4'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 4'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 4'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 5', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 51, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 5');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 5'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 5'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 5'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 5'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 5'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 6', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 61, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 6');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 6'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 6'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 6'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 6'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 6'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 7', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 71, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 7');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 7'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 7'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 7'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 7'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 7'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 8', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 81, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 8');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 8'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 8'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 8'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 8'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 8'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 9', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 91, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 9');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 9'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 9'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 9'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 9'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 9'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 10', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 101, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 10');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 10'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 10'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 10'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 10'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 10'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 11', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 111, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 11');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 11'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 11'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 11'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 11'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 11'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 12', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 121, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 12');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 12'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 12'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 12'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 12'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 12'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 13', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 131, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 13');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 13'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 13'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 13'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 13'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 13'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 14', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 141, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 14');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 14'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 14'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 14'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 14'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 14'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 15', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 151, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 15');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 15'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 15'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 15'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 15'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 15'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 16', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 161, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 16');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 16'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 16'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 16'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 16'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 16'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 17', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 171, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 17');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 17'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 17'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 17'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 17'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 17'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 18', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 181, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 18');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 18'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 18'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 18'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 18'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 18'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 19', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 191, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 19');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 19'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 19'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 19'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 19'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 19'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'BITSAT Full Test 20', 'Full-length test following the BITSAT pattern (130 questions).', 180, 390, false, false, 201, 1, 'BITSAT'
FROM public.courses co WHERE co.slug = 'bitsat'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'BITSAT Full Test 20');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 30, 3, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'BITSAT Full Test 20'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 30, 3, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'BITSAT Full Test 20'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'English Proficiency — MCQ', 10, 3, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'English Proficiency'
WHERE mt.title = 'BITSAT Full Test 20'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Logical Reasoning — MCQ', 20, 3, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Logical Reasoning'
WHERE mt.title = 'BITSAT Full Test 20'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 40, 3, 1, 'MCQ', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'bitsat'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'BITSAT Full Test 20'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 1', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, true, false, 11, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 2', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 21, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 3', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 31, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 3');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 3'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 3'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 3'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 3'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 4', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 41, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 4');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 4'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 4'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 4'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 4'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 5', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 51, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 5');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 5'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 5'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 5'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 5'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 6', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 61, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 6');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 6'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 6'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 6'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 6'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 7', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 71, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 7');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 7'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 7'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 7'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 7'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 8', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 81, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 8');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 8'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 8'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 8'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 8'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 9', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 91, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 9');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 9'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 9'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 9'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 9'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 10', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 101, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 10');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 10'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 10'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 10'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 10'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 11', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 111, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 11');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 11'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 11'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 11'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 11'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 12', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 121, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 12');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 12'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 12'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 12'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 12'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 13', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 131, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 13');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 13'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 13'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 13'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 13'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 14', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 141, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 14');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 14'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 14'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 14'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 14'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 15', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 151, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 15');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 15'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 15'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 15'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 15'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 16', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 161, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 16');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 16'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 16'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 16'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 16'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 17', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 171, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 17');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 17'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 17'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 17'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 17'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 18', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 181, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 18');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 18'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 18'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 18'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 18'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 19', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 191, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 19');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 19'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 19'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 19'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 19'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'NEET (UG) Full Test 20', 'Full-length test following the NEET (UG) pattern (180 questions).', 180, 720, false, false, 201, 1, 'NEET (UG)'
FROM public.courses co WHERE co.slug = 'neet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'NEET (UG) Full Test 20');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 45, 4, 1, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'NEET (UG) Full Test 20'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 45, 4, 1, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'NEET (UG) Full Test 20'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Botany — MCQ', 45, 4, 1, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Botany'
WHERE mt.title = 'NEET (UG) Full Test 20'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Zoology — MCQ', 45, 4, 1, 'MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'neet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Zoology'
WHERE mt.title = 'NEET (UG) Full Test 20'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 1', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, true, false, 11, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 2', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 21, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 3', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 31, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 3');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 3'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 3'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 3'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 4', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 41, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 4');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 4'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 4'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 4'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 5', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 51, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 5');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 5'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 5'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 5'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 6', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 61, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 6');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 6'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 6'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 6'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 7', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 71, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 7');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 7'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 7'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 7'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 8', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 81, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 8');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 8'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 8'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 8'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 9', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 91, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 9');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 9'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 9'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 9'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 10', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 101, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 10');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 10'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 10'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 10'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 11', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 111, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 11');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 11'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 11'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 11'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 12', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 121, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 12');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 12'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 12'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 12'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 13', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 131, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 13');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 13'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 13'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 13'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 14', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 141, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 14');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 14'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 14'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 14'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 15', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 151, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 15');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 15'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 15'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 15'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 16', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 161, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 16');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 16'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 16'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 16'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 17', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 171, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 17');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 17'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 17'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 17'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 18', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 181, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 18');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 18'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 18'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 18'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 19', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 191, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 19');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 19'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 19'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 19'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'TG EAPCET Engineering (MPC) Full Test 20', 'Full-length test following the TG EAPCET Engineering (MPC) pattern (160 questions).', 180, 160, false, false, 201, 1, 'TG EAPCET Engineering (MPC)'
FROM public.courses co WHERE co.slug = 'eapcet'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'TG EAPCET Engineering (MPC) Full Test 20');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — MCQ', 80, 1, 0, 'MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 20'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — MCQ', 40, 1, 0, 'MCQ', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 20'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — MCQ', 40, 1, 0, 'MCQ', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'eapcet'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'TG EAPCET Engineering (MPC) Full Test 20'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 1 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, true, false, 11, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 1 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 1 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 12, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 1 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 1 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 2 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 21, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 2 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 2 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 22, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 2 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 2 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 3 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 31, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 3 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 3 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 32, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 3 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 3 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 4 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 41, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 4 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 4 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 42, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 4 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 4 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 5 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 51, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 5 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 5 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 52, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 5 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 5 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 6 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 61, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 6 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 6 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 62, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 6 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 6 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 7 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 71, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 7 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 7 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 72, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 7 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 7 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 8 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 81, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 8 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 8 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 82, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 8 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 8 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 9 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 91, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 9 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 9 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 92, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 9 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 9 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 10 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 101, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 10 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 10 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 102, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 10 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 10 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 11 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 111, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 11 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 11 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 112, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 11 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 11 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 12 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 121, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 12 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 12 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 122, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 12 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 12 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 13 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 131, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 13 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 13 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 132, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 13 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 13 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 14 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 141, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 14 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 14 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 142, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 14 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 14 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 15 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 151, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 15 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 15 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 152, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 15 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 15 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 16 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 161, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 16 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 16 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 162, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 16 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 16 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 17 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 171, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 17 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 17 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 172, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 17 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 17 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 18 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 181, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 18 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 18 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 182, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 18 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 18 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 19 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 191, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 19 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 19 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 192, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 19 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 19 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 20 — Paper 1', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 201, 1, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 20 — Paper 1');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 1'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);
INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, 'JEE Advanced Full Test 20 — Paper 2', 'Full-length test following the JEE Advanced pattern (54 questions).', 180, 198, false, false, 202, 2, 'JEE Advanced'
FROM public.courses co WHERE co.slug = 'jee-advanced'
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = 'JEE Advanced Full Test 20 — Paper 2');
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 1
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 1);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 2
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 2);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Physics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 3
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Physics'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 3);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 4
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 4);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Multiple Correct', 6, 4, 2, 'Multiple Correct', 5
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 5);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Chemistry — Numerical Answer', 6, 4, 0, 'Numerical Answer', 6
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Chemistry'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 6);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Single Correct MCQ', 6, 3, 1, 'Single Correct MCQ', 7
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 7);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Multiple Correct', 6, 4, 2, 'Multiple Correct', 8
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 8);
INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, 'Mathematics — Numerical Answer', 6, 4, 0, 'Numerical Answer', 9
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = 'jee-advanced'
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = 'Mathematics'
WHERE mt.title = 'JEE Advanced Full Test 20 — Paper 2'
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = 9);

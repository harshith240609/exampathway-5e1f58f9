// Generates question-set structure + full-length mock test blueprints.
const MODULE_COUNTS = {
  "jee-main": { Physics: 25, Chemistry: 25, Mathematics: 25 },
  "jee-advanced": { Physics: 18, Chemistry: 18, Mathematics: 18 },
  bitsat: {
    Physics: 30,
    Chemistry: 30,
    "English Proficiency": 10,
    "Logical Reasoning": 20,
    Mathematics: 40,
  },
  neet: { Physics: 45, Chemistry: 45, Botany: 45, Zoology: 45 },
  eapcet: { Mathematics: 80, Physics: 40, Chemistry: 40 },
};

const PATTERNS = {
  "jee-main": {
    label: "JEE Main Paper 1 (B.E./B.Tech.)",
    duration: 180,
    papers: [
      {
        paper: 1,
        sections: [
          { subject: "Physics", count: 25, marks: 4, neg: 1, type: "MCQ" },
          { subject: "Chemistry", count: 25, marks: 4, neg: 1, type: "MCQ" },
          { subject: "Mathematics", count: 25, marks: 4, neg: 1, type: "MCQ" },
        ],
      },
    ],
  },
  bitsat: {
    label: "BITSAT",
    duration: 180,
    papers: [
      {
        paper: 1,
        sections: [
          { subject: "Physics", count: 30, marks: 3, neg: 1, type: "MCQ" },
          { subject: "Chemistry", count: 30, marks: 3, neg: 1, type: "MCQ" },
          { subject: "English Proficiency", count: 10, marks: 3, neg: 1, type: "MCQ" },
          { subject: "Logical Reasoning", count: 20, marks: 3, neg: 1, type: "MCQ" },
          { subject: "Mathematics", count: 40, marks: 3, neg: 1, type: "MCQ" },
        ],
      },
    ],
  },
  neet: {
    label: "NEET (UG)",
    duration: 180,
    papers: [
      {
        paper: 1,
        sections: [
          { subject: "Physics", count: 45, marks: 4, neg: 1, type: "MCQ" },
          { subject: "Chemistry", count: 45, marks: 4, neg: 1, type: "MCQ" },
          { subject: "Botany", count: 45, marks: 4, neg: 1, type: "MCQ" },
          { subject: "Zoology", count: 45, marks: 4, neg: 1, type: "MCQ" },
        ],
      },
    ],
  },
  eapcet: {
    label: "TG EAPCET Engineering (MPC)",
    duration: 180,
    papers: [
      {
        paper: 1,
        sections: [
          { subject: "Mathematics", count: 80, marks: 1, neg: 0, type: "MCQ" },
          { subject: "Physics", count: 40, marks: 1, neg: 0, type: "MCQ" },
          { subject: "Chemistry", count: 40, marks: 1, neg: 0, type: "MCQ" },
        ],
      },
    ],
  },
  "jee-advanced": {
    label: "JEE Advanced",
    duration: 180,
    papers: [1, 2].map((paper) => ({
      paper,
      sections: ["Physics", "Chemistry", "Mathematics"].flatMap((subject) => [
        { subject, count: 6, marks: 3, neg: 1, type: "Single Correct MCQ" },
        { subject, count: 6, marks: 4, neg: 2, type: "Multiple Correct" },
        { subject, count: 6, marks: 4, neg: 0, type: "Numerical Answer" },
      ]),
    })),
  },
};

const q = (s) => "'" + String(s).replace(/'/g, "''") + "'";
const out = [];

// 1. Topic sets: one per topic, 10 questions each.
out.push(`INSERT INTO public.question_sets (course_id, subject_id, chapter_id, topic_id, kind, name, target_count, sort_order)
SELECT c.course_id, ch.subject_id, t.chapter_id, t.id, 'topic', 'Topic Set 1', 10, 1
FROM public.topics t
JOIN public.chapters ch ON ch.id = t.chapter_id
JOIN public.subjects c ON c.id = ch.subject_id
WHERE NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.topic_id = t.id AND qs.name = 'Topic Set 1');`);

// 2. Chapter sets: 10 per chapter, 10 questions each.
out.push(`INSERT INTO public.question_sets (course_id, subject_id, chapter_id, topic_id, kind, name, target_count, sort_order)
SELECT s.course_id, ch.subject_id, ch.id, NULL, 'chapter', 'Set ' || g, 10, g
FROM public.chapters ch
JOIN public.subjects s ON s.id = ch.subject_id
CROSS JOIN generate_series(1, 10) g
WHERE NOT EXISTS (
  SELECT 1 FROM public.question_sets qs
  WHERE qs.chapter_id = ch.id AND qs.topic_id IS NULL AND qs.name = 'Set ' || g
);`);

// 3. Subject practice modules with exam-specific sizes.
for (const [slug, subjects] of Object.entries(MODULE_COUNTS)) {
  for (const [subject, count] of Object.entries(subjects)) {
    for (let i = 1; i <= 5; i += 1) {
      out.push(`INSERT INTO public.question_sets (course_id, subject_id, kind, name, target_count, sort_order)
SELECT co.id, s.id, 'module', ${q(`Module ${i}`)}, ${count}, ${i}
FROM public.courses co JOIN public.subjects s ON s.course_id = co.id
WHERE co.slug = ${q(slug)} AND s.name = ${q(subject)}
AND NOT EXISTS (SELECT 1 FROM public.question_sets qs WHERE qs.subject_id = s.id AND qs.chapter_id IS NULL AND qs.topic_id IS NULL AND qs.name = ${q(`Module ${i}`)});`);
    }
  }
}

// 4. Twenty full-length mock tests per course, following the real exam blueprint.
for (const [slug, pattern] of Object.entries(PATTERNS)) {
  for (let n = 1; n <= 20; n += 1) {
    for (const paper of pattern.papers) {
      const total = paper.sections.reduce((a, s) => a + s.count * s.marks, 0);
      const questions = paper.sections.reduce((a, s) => a + s.count, 0);
      const title =
        pattern.papers.length > 1
          ? `${pattern.label} Full Test ${n} — Paper ${paper.paper}`
          : `${pattern.label} Full Test ${n}`;
      const description = `Full-length test following the ${pattern.label} pattern (${questions} questions).`;
      out.push(`INSERT INTO public.mock_tests (course_id, title, description, duration_minutes, total_marks, is_free, is_published, sort_order, paper, pattern)
SELECT co.id, ${q(title)}, ${q(description)}, ${pattern.duration}, ${total}, ${n === 1 && paper.paper === 1}, false, ${n * 10 + paper.paper}, ${paper.paper}, ${q(pattern.label)}
FROM public.courses co WHERE co.slug = ${q(slug)}
AND NOT EXISTS (SELECT 1 FROM public.mock_tests mt WHERE mt.course_id = co.id AND mt.title = ${q(title)});`);
      paper.sections.forEach((section, idx) => {
        out.push(`INSERT INTO public.mock_test_sections (mock_test_id, subject_id, name, question_count, marks_per_question, negative_marks, question_type, sort_order)
SELECT mt.id, s.id, ${q(`${section.subject} — ${section.type}`)}, ${section.count}, ${section.marks}, ${section.neg}, ${q(section.type)}, ${idx + 1}
FROM public.mock_tests mt
JOIN public.courses co ON co.id = mt.course_id AND co.slug = ${q(slug)}
LEFT JOIN public.subjects s ON s.course_id = co.id AND s.name = ${q(section.subject)}
WHERE mt.title = ${q(title)}
AND NOT EXISTS (SELECT 1 FROM public.mock_test_sections ms WHERE ms.mock_test_id = mt.id AND ms.sort_order = ${idx + 1});`);
      });
    }
  }
}

console.log(out.join("\n"));

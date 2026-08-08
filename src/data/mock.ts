import engineeringImage from "@/assets/course-engineering.jpg";
import medicalImage from "@/assets/course-medical.jpg";
import type {
  Announcement,
  Chapter,
  Course,
  ExamSlug,
  LeaderboardEntry,
  MockTest,
  Progress,
  Question,
  QuestionFile,
  Result,
  StudyMaterial,
  Subject,
  SubjectName,
  User,
} from "@/types";


const pick = <T,>(arr: readonly T[], index: number): T =>
  arr[((index % arr.length) + arr.length) % arr.length] as T;

export const courses: Course[] = [
  {
    id: "c1",
    slug: "jee-main",
    name: "JEE Main",
    category: "Engineering",
    description:
      "Complete NTA-pattern preparation with chapter-wise question banks, full syllabus mocks and detailed analytics.",
    subjects: ["Physics", "Chemistry", "Mathematics"],
    difficulty: "Medium",
    questionCount: 14200,
    mockTestCount: 120,
    students: 24500,
    rating: 4.8,
    examDate: "2027-01-24",
    image: engineeringImage,
  },
  {
    id: "c2",
    slug: "jee-advanced",
    name: "JEE Advanced",
    category: "Engineering",
    description:
      "Advanced problem solving with multi-concept questions, paper 1 and paper 2 simulations and IIT-level solutions.",
    subjects: ["Physics", "Chemistry", "Mathematics"],
    difficulty: "Hard",
    questionCount: 9800,
    mockTestCount: 85,
    students: 12300,
    rating: 4.9,
    examDate: "2027-05-18",
    image: engineeringImage,
  },
  {
    id: "c3",
    slug: "bitsat",
    name: "BITSAT",
    category: "Engineering",
    description:
      "Speed-focused practice matching the BITSAT computer-based pattern, including logical reasoning and English.",
    subjects: ["Physics", "Chemistry", "Mathematics"],
    difficulty: "Medium",
    questionCount: 6400,
    mockTestCount: 60,
    students: 8700,
    rating: 4.7,
    examDate: "2027-05-26",
    image: engineeringImage,
  },
  {
    id: "c4",
    slug: "eamcet",
    name: "EAMCET",
    category: "Engineering",
    description:
      "State syllabus aligned preparation with Telangana EAMCET weightage analysis and previous year trends.",
    subjects: ["Physics", "Chemistry", "Mathematics"],
    difficulty: "Easy",
    questionCount: 7300,
    mockTestCount: 70,
    students: 15600,
    rating: 4.6,
    examDate: "2027-05-08",
    image: engineeringImage,
  },
  {
    id: "c5",
    slug: "eapcet",
    name: "EAPCET",
    category: "Engineering",
    description:
      "AP EAPCET focused practice with chapter targets, timed sectionals and rank predictor style analytics.",
    subjects: ["Physics", "Chemistry", "Mathematics"],
    difficulty: "Easy",
    questionCount: 7100,
    mockTestCount: 68,
    students: 14100,
    rating: 4.6,
    examDate: "2027-05-12",
    image: engineeringImage,
  },
  {
    id: "c6",
    slug: "neet",
    name: "NEET",
    category: "Medical",
    description:
      "NCERT-first medical preparation covering Biology, Physics and Chemistry with high-yield revision material.",
    subjects: ["Physics", "Chemistry", "Biology"],
    difficulty: "Medium",
    questionCount: 16800,
    mockTestCount: 140,
    students: 31200,
    rating: 4.9,
    examDate: "2027-05-03",
    image: medicalImage,
  },
];

const chapterMap: Record<SubjectName, string[]> = {
  Physics: [
    "Kinematics",
    "Laws of Motion",
    "Rotational Motion",
    "Thermodynamics",
    "Current Electricity",
    "Modern Physics",
  ],
  Chemistry: [
    "Mole Concept",
    "Chemical Bonding",
    "Thermochemistry",
    "Coordination Compounds",
    "Hydrocarbons",
    "Biomolecules",
  ],
  Mathematics: [
    "Quadratic Equations",
    "Sequences and Series",
    "Trigonometry",
    "Straight Lines",
    "Differential Calculus",
    "Probability",
  ],
  Biology: [
    "Cell Structure",
    "Plant Physiology",
    "Human Physiology",
    "Genetics",
    "Ecology",
    "Biotechnology",
  ],
};

const buildChapters = (subject: SubjectName, seed: number): Chapter[] =>
  chapterMap[subject].map((name, index) => ({
    id: `${subject}-${index}`,
    name,
    questionCount: 180 + ((seed + index * 37) % 420),
    progress: (seed * 7 + index * 13) % 100,
  }));

export const subjects: Subject[] = courses.flatMap((course, courseIndex) =>
  course.subjects.map((subject, subjectIndex) => ({
    id: `${course.slug}-${subject}`,
    courseSlug: course.slug,
    name: subject,
    chapters: buildChapters(subject, courseIndex * 5 + subjectIndex),
  })),
);

const difficulties = ["Easy", "Medium", "Hard"] as const;
const questionTypes = [
  "MCQ",
  "Integer",
  "Numerical",
  "Match",
  "Assertion Reason",
] as const;

const stems: Record<SubjectName, string[]> = {
  Physics: [
    "A block of mass 2 kg slides down a frictionless incline of 30°. Find the acceleration of the block.",
    "A wire of resistance 10 Ω is stretched to twice its length. What is the new resistance?",
    "A particle executes SHM with amplitude 5 cm and period 2 s. Find its maximum velocity.",
  ],
  Chemistry: [
    "Calculate the number of moles present in 88 g of carbon dioxide at STP.",
    "Which of the following complexes shows optical isomerism?",
    "Identify the major product formed when propene reacts with HBr in presence of peroxide.",
  ],
  Mathematics: [
    "If the roots of x² − 5x + k = 0 are real and distinct, find the range of k.",
    "Find the sum of the first 20 terms of an AP whose first term is 3 and common difference is 4.",
    "Evaluate the derivative of f(x) = x³ ln x at x = 1.",
  ],
  Biology: [
    "Which organelle is known as the powerhouse of the cell and why?",
    "In a dihybrid cross of heterozygous parents, what is the expected phenotypic ratio?",
    "Which plant hormone is primarily responsible for apical dominance?",
  ],
};

const optionSets: Record<SubjectName, string[][]> = {
  Physics: [
    ["2.5 m/s²", "4.9 m/s²", "9.8 m/s²", "1.2 m/s²"],
    ["20 Ω", "40 Ω", "5 Ω", "10 Ω"],
    ["15.7 cm/s", "10 cm/s", "31.4 cm/s", "5 cm/s"],
  ],
  Chemistry: [
    ["1 mole", "2 moles", "4 moles", "0.5 mole"],
    ["[Co(en)₃]³⁺", "[Ni(CO)₄]", "[Cu(NH₃)₄]²⁺", "[PtCl₄]²⁻"],
    ["1-bromopropane", "2-bromopropane", "Propan-1-ol", "Propyne"],
  ],
  Mathematics: [
    ["k < 25/4", "k > 25/4", "k = 25/4", "k < 0"],
    ["820", "760", "900", "640"],
    ["1", "0", "3", "e"],
  ],
  Biology: [
    ["Mitochondria", "Ribosome", "Golgi body", "Lysosome"],
    ["9:3:3:1", "3:1", "1:2:1", "1:1:1:1"],
    ["Auxin", "Cytokinin", "Ethylene", "Abscisic acid"],
  ],
};

const buildQuestions = (): Question[] => {
  const list: Question[] = [];
  courses.forEach((course, courseIndex) => {
    course.subjects.forEach((subject, subjectIndex) => {
      chapterMap[subject].forEach((chapter, chapterIndex) => {
        for (let i = 0; i < 3; i += 1) {
          const seed = courseIndex * 97 + subjectIndex * 31 + chapterIndex * 7 + i;
          const variant = seed % 3;
          const options = pick(optionSets[subject], variant).map((text, optIndex) => ({
            id: `o${optIndex}`,
            text,
          }));
          list.push({
            id: `${course.slug}-${subject}-${chapterIndex}-${i}`,
            courseSlug: course.slug,
            subject,
            chapter,
            difficulty: pick(difficulties, seed),
            type: pick(questionTypes, seed),
            year: 2019 + (seed % 6),
            text: pick(stems[subject], variant),
            options,
            correctOptionId: `o${seed % 4}`,
            hint: "Recall the standard formula for this chapter and check the units before solving.",
            solution:
              "Start from the governing relation for this concept, substitute the given values carefully, and simplify. The trap in this question is a unit mismatch that changes the final option.",
            attempted: seed % 3 === 0,
            bookmarked: seed % 7 === 0,
            accuracy: 40 + (seed % 55),
          });
        }
      });
    });
  });
  return list;
};

export const questions: Question[] = buildQuestions();

export const mockTests: MockTest[] = courses.flatMap((course, index) =>
  [1, 2, 3].map((n) => ({
    id: `${course.slug}-mt-${n}`,
    title: `${course.name} Full Syllabus Test ${n}`,
    courseSlug: course.slug,
    durationMinutes: course.slug === "neet" ? 200 : 180,
    totalMarks: course.slug === "neet" ? 720 : 300,
    questionCount: course.slug === "neet" ? 180 : 75,
    difficulty: pick(difficulties, index + n),
    attempts: 1200 + index * 340 + n * 77,
    published: n !== 3,
    instructions: [
      "The test must be attempted in a single sitting once started.",
      "Each correct answer awards 4 marks and each incorrect answer deducts 1 mark.",
      "Use the question palette to mark questions for review.",
      "The test auto-submits when the timer reaches zero.",
    ],
  })),
);

export const announcements: Announcement[] = [
  {
    id: "a1",
    title: "JEE Main 2027 Session 1 registration window is open",
    body: "The National Testing Agency has opened the application window. Complete your form before the last date and download the confirmation page.",
    type: "Exam Update",
    publishedAt: "2026-08-02",
    pinned: true,
  },
  {
    id: "a2",
    title: "New 4,000 question NEET Biology bank added",
    body: "Chapter-wise NCERT aligned questions with detailed explanations are now live inside the NEET course question bank.",
    type: "Announcement",
    publishedAt: "2026-07-28",
    pinned: false,
  },
  {
    id: "a3",
    title: "Weekly all-India mock test every Sunday 10 AM",
    body: "Compete with thousands of aspirants, get percentile and rank analysis within two hours of submission.",
    type: "Notice",
    publishedAt: "2026-07-21",
    pinned: false,
  },
  {
    id: "a4",
    title: "Scheduled maintenance on 12 August, 2 AM to 4 AM IST",
    body: "Practice and mock test modules may be briefly unavailable while we upgrade our analytics engine.",
    type: "Maintenance",
    publishedAt: "2026-07-15",
    pinned: false,
  },
];

export const studyMaterials: StudyMaterial[] = courses.flatMap((course) =>
  course.subjects.map((subject, index) => ({
    id: `${course.slug}-${subject}-mat`,
    title: `${course.name} ${subject} Master Notes`,
    description: `Condensed theory, solved examples and revision tables for the complete ${subject} syllabus.`,
    courseSlug: course.slug,
    subject,
    type: pick(["Notes", "Formula Sheet", "Revision", "Solutions"] as const, index),
    pages: 60 + index * 24,
    updatedAt: "2026-07-30",
  })),
);

export const files: QuestionFile[] = courses.flatMap((course, courseIndex) =>
  course.subjects.map((subject, index) => ({
    id: `${course.slug}-file-${index}`,
    name: `${course.name}-${subject}-paper-2026.pdf`,
    extension: pick(["pdf", "docx", "csv", "zip", "png"] as const, index),
    sizeKb: 420 + courseIndex * 130 + index * 90,
    folder: `${course.name}/${subject}`,
    courseSlug: course.slug,
    subject,
    chapter: pick(chapterMap[subject], index),
    uploadedBy: "Admin",
    uploadedAt: "2026-07-24",
    category: pick(
      ["Question Paper", "Notes", "Solutions", "Formula Sheet"] as const,
      index,
    ),
  })),
);

const rankerNames = [
  "Aarav Sharma",
  "Diya Patel",
  "Rohan Verma",
  "Ananya Reddy",
  "Kabir Nair",
  "Ishita Rao",
  "Vivaan Gupta",
  "Meera Krishnan",
  "Arjun Menon",
  "Saanvi Iyer",
  "Aditya Bose",
  "Nitya Joshi",
];

export const leaderboard: LeaderboardEntry[] = rankerNames.map((name, index) => ({
  id: `lb-${index}`,
  rank: index + 1,
  name,
  xp: 18400 - index * 720,
  testsAttempted: 96 - index * 3,
  accuracy: 94 - index * 1.4,
}));

export const users: User[] = [
  {
    id: "u1",
    name: "Aarav Sharma",
    email: "student@exampathway.com",
    role: "student",
    status: "active",
    xp: 12480,
    streak: 24,
    joinedAt: "2026-01-12",
  },
  {
    id: "u2",
    name: "Platform Admin",
    email: "admin@exampathway.com",
    role: "admin",
    status: "active",
    xp: 0,
    streak: 0,
    joinedAt: "2025-11-02",
  },
  ...rankerNames.slice(1, 10).map((name, index) => ({
    id: `u${index + 3}`,
    name,
    email: `${name.split(" ")[0]?.toLowerCase() ?? "user"}${index}@mail.com`,
    role: "student" as const,
    status: (index % 5 === 0 ? "suspended" : "active") as User["status"],
    xp: 9800 - index * 480,
    streak: 18 - index,
    joinedAt: "2026-02-18",
  })),
];

export const progressData: Progress[] = [
  { subject: "Physics", completion: 72, accuracy: 68, questionsSolved: 1840 },
  { subject: "Chemistry", completion: 84, accuracy: 79, questionsSolved: 2210 },
  { subject: "Mathematics", completion: 61, accuracy: 58, questionsSolved: 1490 },
];

export const results: Result[] = mockTests.slice(0, 8).map((test, index) => ({
  id: `r-${index}`,
  testId: test.id,
  testTitle: test.title,
  userId: "u1",
  score: Math.round(test.totalMarks * (0.55 + (index % 5) * 0.06)),
  totalMarks: test.totalMarks,
  accuracy: 62 + (index % 6) * 4,
  rank: 120 + index * 45,
  takenAt: `2026-0${(index % 7) + 1}-1${index % 9}`,
}));

export const performanceTrend = [
  { label: "Week 1", score: 48, accuracy: 54 },
  { label: "Week 2", score: 55, accuracy: 58 },
  { label: "Week 3", score: 61, accuracy: 63 },
  { label: "Week 4", score: 59, accuracy: 66 },
  { label: "Week 5", score: 68, accuracy: 71 },
  { label: "Week 6", score: 74, accuracy: 76 },
  { label: "Week 7", score: 81, accuracy: 80 },
];

export const getCourseBySlug = (slug: ExamSlug | string) =>
  courses.find((course) => course.slug === slug);

export const getSubjectsForCourse = (slug: ExamSlug | string) =>
  subjects.filter((subject) => subject.courseSlug === slug);

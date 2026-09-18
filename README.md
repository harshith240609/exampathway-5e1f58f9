# Exam Pathway

You are an expert Full Stack Software Engineer, UI/UX Designer, and System Architect.

Your task is to build a complete modern educational coaching website called

# EXAMPATHWAY

Tagline:
"Your Complete Entrance Exam Preparation Platform."

The website should be professional, minimal, modern, responsive, and premium looking like Coursera, Unacademy, PhysicsWallah, Allen Digital, or Khan Academy.

Use clean spacing, beautiful typography, rounded corners, subtle shadows, smooth animations, glassmorphism where appropriate, and a blue-white color palette with small orange highlights.

DO NOT create dummy-looking designs.
Create a real production-ready UI.

----------------------------------------------------
TECH STACK
----------------------------------------------------

Use

React
TypeScript
Vite
Tailwind CSS
React Router
Lucide Icons
Framer Motion
Shadcn UI Components

The backend connection will be added later using Supabase.

So design the application in a way that all API calls can easily be replaced with Supabase.

Do NOT hardcode backend logic.

Use placeholder services.

----------------------------------------------------
MAIN WEBSITE STRUCTURE
----------------------------------------------------

Create these pages:

Home

About

Courses

Question Bank

Mock Tests

Daily Practice

PYQs

Study Materials

Announcements

Leaderboard

Pricing

FAQ

Contact

Login

Register

Forgot Password

Student Dashboard

Admin Dashboard

404 Page

----------------------------------------------------
HOME PAGE
----------------------------------------------------

Create a premium landing page.

Include

Large Hero Section

Beautiful headline

Call To Action buttons

Browse Courses

Student Login

Scrolling statistics

50,000+ Questions

10,000+ Students

500+ Mock Tests

95% Success Rate

Feature cards

Latest announcements

Testimonials

Top Rankers

FAQ

Footer

----------------------------------------------------
COURSES
----------------------------------------------------

The courses page should contain beautiful cards.

Create separate sections for

JEE Main

JEE Advanced

BITSAT

EAMCET

EAPCET

NEET

Each course card should contain

Course Image

Course Name

Description

Subjects Covered

Difficulty

Number of Questions

Number of Mock Tests

View Course Button

----------------------------------------------------
INSIDE EVERY COURSE
----------------------------------------------------

Each course should have its own dedicated page.

For example

/course/jee-main

/course/jee-advanced

/course/bitsat

/course/eamcet

/course/eapcet

/course/neet

Each course contains

Overview

Subjects

Question Bank

PYQs

Mock Tests

Practice Mode

Bookmarks

Performance

Resources

----------------------------------------------------
QUESTION BANK
----------------------------------------------------

This is the heart of the website.

Every course has its own Question Bank.

Separate questions by

Physics

Chemistry

Mathematics

Biology (only for NEET)

Each subject should have

Chapters

Difficulty

Easy

Medium

Hard

Question Types

MCQ

Integer

Numerical

Match

Assertion Reason

Filters

Search

Bookmarks

Recently Viewed

Attempted

Not Attempted

----------------------------------------------------
QUESTION PAGE
----------------------------------------------------

Beautiful layout

Question on top

Options

Timer

Bookmark

Previous

Next

Report Question

Discussion

Solution

Hints

Answer Explanation

Performance Analytics

----------------------------------------------------
MOCK TESTS
----------------------------------------------------

Separate section

JEE Main

JEE Advanced

BITSAT

EAMCET

EAPCET

NEET

Each mock test has

Duration

Marks

Instructions

Start Test

Resume Test

Submit

Review Answers

Detailed Analysis

Leaderboard

----------------------------------------------------
PYQ SECTION
----------------------------------------------------

Previous Year Questions

Categorized by

Exam

Year

Subject

Chapter

Difficulty

Allow filters

----------------------------------------------------
DAILY PRACTICE
----------------------------------------------------

Daily quizzes

Daily targets

Daily streak

Daily XP

Progress bar

----------------------------------------------------
LEADERBOARD
----------------------------------------------------

Weekly

Monthly

Overall

Show

Rank

Name

XP

Tests Attempted

Accuracy

----------------------------------------------------
STUDENT DASHBOARD
----------------------------------------------------

Create a premium dashboard.

Sidebar

Overview

My Courses

Question Bank

Bookmarks

Mock Tests

Performance

Achievements

Profile

Settings

Main dashboard should contain

Overall Progress

Recent Activity

Today's Practice

Weak Subjects

Strong Subjects

Upcoming Tests

Performance Graph

Accuracy

Average Score

Completion Percentage

----------------------------------------------------
ADMIN DASHBOARD
----------------------------------------------------

Admin Dashboard must be completely separate from student users.

Use role-based authentication architecture.

There should be

Admin Login

Admin Layout

Admin Sidebar

Admin Topbar

Admin Profile

Admin Logout

----------------------------------------------------
ADMIN FEATURES
----------------------------------------------------

Dashboard Overview

Total Students

Total Courses

Total Questions

Total Files

Total Mock Tests

Recent Uploads

Analytics

----------------------------------------------------
QUESTION MANAGEMENT
----------------------------------------------------

Admin can

Add Question

Edit Question

Delete Question

Upload Bulk Questions

Search Questions

Filter Questions

----------------------------------------------------
FILE MANAGEMENT
----------------------------------------------------

Very important.

Create a dedicated Upload Center.

Admin should be able to upload

PDF

DOCX

Images

CSV

ZIP

Question Papers

Notes

Solutions

Formula Sheets

Store metadata only for now.

DO NOT connect storage.

Create placeholder upload service.

Include

Upload Button

Drag & Drop

Progress Bar

Recent Uploads

Delete

Rename

Preview

Folders

Course-wise folders

Subject-wise folders

Chapter-wise folders

----------------------------------------------------
MOCK TEST MANAGEMENT
----------------------------------------------------

Admin can

Create Mock Test

Edit Mock Test

Delete Mock Test

Assign Questions

Publish Test

----------------------------------------------------
ANNOUNCEMENTS
----------------------------------------------------

Admin can create

Announcements

Notices

Exam Updates

Maintenance Notices

----------------------------------------------------
USER MANAGEMENT
----------------------------------------------------

Admin can

View Users

Search Users

Suspend Users

Activate Users

Delete Users

Reset Password

----------------------------------------------------
ROLE SYSTEM
----------------------------------------------------

Design application using Role Based Access Control.

Roles

Student

Admin

Protected Routes

Student routes cannot access Admin.

Admin routes cannot access Student dashboard unless intentionally allowed.

----------------------------------------------------
AUTHENTICATION
----------------------------------------------------

Create architecture ready for Supabase Auth.

Use placeholder functions

login()

logout()

register()

forgotPassword()

getCurrentUser()

checkRole()

----------------------------------------------------
DATABASE STRUCTURE
----------------------------------------------------

Prepare interfaces only.

Users

Courses

Subjects

Chapters

Questions

QuestionFiles

StudyMaterials

MockTests

Announcements

Results

Bookmarks

Progress

----------------------------------------------------
SEARCH
----------------------------------------------------

Global Search

Course Search

Question Search

Chapter Search

Subject Search

----------------------------------------------------
NOTIFICATIONS
----------------------------------------------------

Toast Notifications

Success

Error

Warning

Info

----------------------------------------------------
UI REQUIREMENTS
----------------------------------------------------

Use

Cards

Modals

Dialogs

Dropdowns

Breadcrumbs

Progress bars

Charts

Accordions

Badges

Tabs

Tables

Pagination

Loading Skeletons

Empty States

Responsive Sidebar

Dark Mode Toggle

----------------------------------------------------
RESPONSIVENESS
----------------------------------------------------

Fully responsive

Desktop

Tablet

Mobile

----------------------------------------------------
ANIMATIONS
----------------------------------------------------

Use Framer Motion

Fade

Slide

Scale

Hover Effects

Page Transition

----------------------------------------------------
CODE STRUCTURE
----------------------------------------------------

Use scalable architecture.

src/

components/

pages/

layouts/

hooks/

services/

utils/

types/

contexts/

assets/

routes/

----------------------------------------------------
SERVICES
----------------------------------------------------

Create placeholder services.

AuthService

QuestionService

CourseService

FileService

MockTestService

AnnouncementService

Later these will be connected to Supabase.

----------------------------------------------------
SUPABASE PREPARATION
----------------------------------------------------

Do NOT integrate Supabase.

Only prepare clean architecture so I can later replace placeholder services with Supabase.

----------------------------------------------------
QUALITY
----------------------------------------------------

Generate production-quality code.

Use reusable components.

No repeated code.

No inline styles.

No unnecessary comments.

Strong TypeScript typing.

Professional folder structure.

Clean naming conventions.

----------------------------------------------------
EXTRA FEATURES
----------------------------------------------------

Dark Mode

Bookmarks

Recent Activity

Continue Practice

Top Rankers

Exam Countdown

Study Planner

Achievement Badges

Streak Counter

Progress Charts

Question Discussion Placeholder

Feedback Form

Contact Form

----------------------------------------------------
FINAL REQUIREMENTS
----------------------------------------------------

The website should look premium, modern, fast, and professional.

It should feel like a real educational platform used by thousands of students.

Keep the UI extremely clean with excellent spacing and typography.

Focus on scalability because Supabase backend will be integrated later.

Ensure all components are reusable and the project follows best React and TypeScript practices.

The project should be ready for future integration with Supabase Authentication, Database, Storage, and Row Level Security without requiring major restructuring.

This project was built with [Lovable](https://lovable.dev).

**Live app**: https://exampathway.lovable.app

## Build with Lovable

Continue developing this project in the [Lovable editor](https://lovable.dev/projects/d1ced830-02a1-4566-b4cc-7df236b459ab).

- **Ship faster**: describe what you want to build and Lovable handles the code.
- **Stay in sync**: every change made in Lovable is committed straight to this repository.
- **Full ownership**: this code is yours. Push to `main` on GitHub and your changes sync back into Lovable, ready for your next prompt.

## Development

Prefer working locally? You need Node.js and npm — [install with nvm](https://github.com/nvm-sh/nvm#installing-and-updating).

```sh
git clone <this-repository-url>
cd <repository-name>
npm i
npm run dev
```

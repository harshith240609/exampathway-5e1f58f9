export type UserRole = "student" | "admin";

export const CLASS_LEVELS = ["Class 11", "Class 12", "Dropper / Repeater"] as const;
export type ClassLevel = (typeof CLASS_LEVELS)[number];

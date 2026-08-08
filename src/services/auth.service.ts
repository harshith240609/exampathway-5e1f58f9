import { users } from "@/data/mock";
import type { User, UserRole } from "@/types";
import { delay, fail, ok, type ServiceResponse } from "./base";

const STORAGE_KEY = "exampathway.session";

export interface Credentials {
  email: string;
  password: string;
}

export interface RegisterPayload extends Credentials {
  name: string;
}

const readStoredUser = (): User | null => {
  if (typeof window === "undefined") return null;
  const raw = window.localStorage.getItem(STORAGE_KEY);
  if (!raw) return null;
  try {
    return JSON.parse(raw) as User;
  } catch {
    return null;
  }
};

const writeStoredUser = (user: User | null) => {
  if (typeof window === "undefined") return;
  if (user) window.localStorage.setItem(STORAGE_KEY, JSON.stringify(user));
  else window.localStorage.removeItem(STORAGE_KEY);
};

export const AuthService = {
  async login({ email }: Credentials): Promise<ServiceResponse<User | null>> {
    await delay();
    const match =
      users.find((user) => user.email.toLowerCase() === email.toLowerCase()) ??
      null;
    if (!match) return fail<User | null>(null, "No account found for this email.");
    if (match.status === "suspended")
      return fail<User | null>(null, "This account has been suspended.");
    writeStoredUser(match);
    return ok<User | null>(match);
  },

  async register(payload: RegisterPayload): Promise<ServiceResponse<User>> {
    await delay();
    const user: User = {
      id: `u-${Date.now()}`,
      name: payload.name,
      email: payload.email,
      role: "student",
      status: "active",
      xp: 0,
      streak: 0,
      joinedAt: new Date().toISOString(),
    };
    writeStoredUser(user);
    return ok(user);
  },

  async logout(): Promise<ServiceResponse<null>> {
    await delay(120);
    writeStoredUser(null);
    return ok(null);
  },

  async forgotPassword(email: string): Promise<ServiceResponse<string>> {
    await delay();
    return ok(`Password reset instructions were sent to ${email}.`);
  },

  getCurrentUser(): User | null {
    return readStoredUser();
  },

  checkRole(user: User | null, role: UserRole): boolean {
    return user?.role === role;
  },
};

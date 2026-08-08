import { users } from "@/data/mock";
import type { User } from "@/types";
import { delay, ok, type ServiceResponse } from "./base";

export const UserService = {
  async list(search = ""): Promise<ServiceResponse<User[]>> {
    await delay(160);
    const term = search.trim().toLowerCase();
    return ok(
      term
        ? users.filter(
            (user) =>
              user.name.toLowerCase().includes(term) ||
              user.email.toLowerCase().includes(term),
          )
        : users,
    );
  },

  async setStatus(id: string, status: User["status"]): Promise<ServiceResponse<string>> {
    await delay();
    void status;
    return ok(id);
  },

  async remove(id: string): Promise<ServiceResponse<string>> {
    await delay();
    return ok(id);
  },

  async resetPassword(email: string): Promise<ServiceResponse<string>> {
    await delay();
    return ok(email);
  },
};

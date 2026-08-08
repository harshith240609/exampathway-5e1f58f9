import { announcements } from "@/data/mock";
import type { Announcement } from "@/types";
import { delay, ok, type ServiceResponse } from "./base";

export const AnnouncementService = {
  async list(): Promise<ServiceResponse<Announcement[]>> {
    await delay(140);
    return ok(announcements);
  },

  async create(
    announcement: Omit<Announcement, "id">,
  ): Promise<ServiceResponse<Announcement>> {
    await delay();
    return ok({ ...announcement, id: `an-${Date.now()}` });
  },

  async remove(id: string): Promise<ServiceResponse<string>> {
    await delay();
    return ok(id);
  },
};

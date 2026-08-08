import { files } from "@/data/mock";
import type { QuestionFile } from "@/types";
import { delay, ok, type ServiceResponse } from "./base";

export interface UploadProgressHandler {
  (progress: number): void;
}

export const FileService = {
  async list(folder?: string): Promise<ServiceResponse<QuestionFile[]>> {
    await delay(160);
    return ok(folder ? files.filter((file) => file.folder.startsWith(folder)) : files);
  },

  async upload(
    file: { name: string; size: number },
    onProgress?: UploadProgressHandler,
  ): Promise<ServiceResponse<QuestionFile>> {
    for (let progress = 20; progress <= 100; progress += 20) {
      await delay(160);
      onProgress?.(progress);
    }
    const extension = (file.name.split(".").pop() ?? "pdf").toLowerCase();
    return ok({
      id: `f-${Date.now()}`,
      name: file.name,
      extension: extension as QuestionFile["extension"],
      sizeKb: Math.max(1, Math.round(file.size / 1024)),
      folder: "Uploads",
      courseSlug: "jee-main",
      uploadedBy: "Admin",
      uploadedAt: new Date().toISOString().slice(0, 10),
      category: "Notes",
    });
  },

  async rename(id: string, name: string): Promise<ServiceResponse<string>> {
    await delay();
    void id;
    return ok(name);
  },

  async remove(id: string): Promise<ServiceResponse<string>> {
    await delay();
    return ok(id);
  },
};

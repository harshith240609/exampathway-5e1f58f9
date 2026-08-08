export const delay = (ms = 320) =>
  new Promise<void>((resolve) => {
    setTimeout(resolve, ms);
  });

export interface ServiceResponse<T> {
  data: T;
  error: string | null;
}

export const ok = <T,>(data: T): ServiceResponse<T> => ({ data, error: null });

export const fail = <T,>(data: T, error: string): ServiceResponse<T> => ({
  data,
  error,
});

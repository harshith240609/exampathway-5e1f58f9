import { createContext, useCallback, useContext, useEffect, useMemo, useState } from "react";
import type { ReactNode } from "react";
import { AuthService, type Credentials, type RegisterPayload } from "@/services/auth.service";
import type { User, UserRole } from "@/types";

interface AuthContextValue {
  user: User | null;
  loading: boolean;
  login: (credentials: Credentials) => Promise<{ user: User | null; error: string | null }>;
  register: (payload: RegisterPayload) => Promise<{ user: User | null; error: string | null }>;
  logout: () => Promise<void>;
  forgotPassword: (email: string) => Promise<string>;
  hasRole: (role: UserRole) => boolean;
}

const AuthContext = createContext<AuthContextValue | undefined>(undefined);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setUser(AuthService.getCurrentUser());
    setLoading(false);
  }, []);

  const login = useCallback(async (credentials: Credentials) => {
    const response = await AuthService.login(credentials);
    if (response.data) setUser(response.data);
    return { user: response.data, error: response.error };
  }, []);

  const register = useCallback(async (payload: RegisterPayload) => {
    const response = await AuthService.register(payload);
    setUser(response.data);
    return { user: response.data, error: response.error };
  }, []);

  const logout = useCallback(async () => {
    await AuthService.logout();
    setUser(null);
  }, []);

  const forgotPassword = useCallback(async (email: string) => {
    const response = await AuthService.forgotPassword(email);
    return response.data;
  }, []);

  const value = useMemo<AuthContextValue>(
    () => ({
      user,
      loading,
      login,
      register,
      logout,
      forgotPassword,
      hasRole: (role: UserRole) => AuthService.checkRole(user, role),
    }),
    [user, loading, login, register, logout, forgotPassword],
  );

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (!context) throw new Error("useAuth must be used within an AuthProvider");
  return context;
}

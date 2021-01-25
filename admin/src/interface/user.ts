export default interface userType {
  id: string;
  email: string;
  password: string;
  avatar: string;
  role: number;
  countryId: number;
  interests: number[];
}

export interface authState {
  isAuthenticated: boolean;
  user: null | userType;
  token: string;
  authLoaded: boolean;
  authenticateUser?: any;
}

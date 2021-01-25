export default interface OptionType {
  id?: number;
  preferred_email: number;
  preferred_address: number;
  who_pays: string;
  membership_duration: number;
  interests?: number[];
  userId?: number;
}

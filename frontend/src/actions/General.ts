import Axios from "axios";
import { URL } from "../config";

// Get Countries
export const getCountries = async () => await Axios.get(`${URL}/countries`);

// Get Languages
export const getLanguages = async () => await Axios.get(`${URL}/languages`);

// Get Jobs
export const getJobs = async () => await Axios.get(`${URL}/jobs`);

// Post Applicant
export const addApplicant = async (data: any) =>
  Axios.post(`${URL}/generals`, data);

// Post Student
export const addStudent = async (data: any) =>
  Axios.post(`${URL}/students`, data);

// Post Business
export const addBusiness = async (data: any) =>
  Axios.post(`${URL}/businesses`, data);

// Post Family
export const addFamily = async (data: any) =>
  Axios.post(`${URL}/families`, data);

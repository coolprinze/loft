import Axios from 'axios'
import { apiURL } from '../config'

// Get Utilities
export const getUtilities = async () =>
  await Axios.get(`${apiURL}/utilities`)

// Get Countries
export const getCountries = async () =>
  await Axios.get(`${apiURL}/utilities/countries`)

// Get Degrees
export const getDegrees = async () =>
  await Axios.get(`${apiURL}/utilities/degrees`)

// Get Occupations
export const getOccupations = async () =>
  await Axios.get(`${apiURL}/utilities/occupations`)

// Get Occupations
export const getLanguages = async () =>
  await Axios.get(`${apiURL}/utilities/occupations`)

// Get Fund Ranges
export const getFundRanges = async (type: string) =>
  await Axios.get(`${apiURL}/utilities/funds/${type}`)

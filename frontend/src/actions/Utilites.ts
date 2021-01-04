import Axios from 'axios'
import { apiURL } from '../config'

// Get Countries
export const getCountries = async () =>
  await Axios.get(`${apiURL}/utilities/countries`)

// Get Fund Ranges
export const getFundRanges = async (type: string) =>
  await Axios.get(`${apiURL}/utilities/funds/${type}`)

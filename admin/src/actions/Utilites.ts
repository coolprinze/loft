import Axios from 'axios'
import { URL } from '../config'

// Get Countries
export const getCountries = async () =>
  await Axios.get(`${URL}/utilities/countries`)

// Get Fund Ranges
export const getFundRanges = async (type: string) =>
  await Axios.get(`${URL}/utilities/funds/${type}`)

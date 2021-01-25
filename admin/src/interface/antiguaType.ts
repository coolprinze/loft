import { countryType, fundType } from '.'

export type antiguaType = {
  id?: number
  first_name: string
  last_name: string
  email: string
  phone: string
  married: string
  old_dependents: number
  young_dependents: number
  teen_dependents: number
  average_dependents: number
  rejected: true
  deported: true
  contact_medium: string
  referee: string
  createdAt: string
  updatedAt: string
  investRange: fundType
  networthRange: fundType
  residenceCountry: countryType
  nationalityCountry: countryType
  RejectedCountries: countryType[]
  DeportedCountries: countryType[]
}

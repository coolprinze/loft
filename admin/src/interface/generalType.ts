import { countryType, qualificationType, spouseType } from '.'

export type generalType = {
  id?: number
  first_name: string
  last_name: string
  email: string
  phone: string
  maritalStatusId: number
  dob: string
  group: number
  eligible_party: number
  createdAt: string
  updatedAt: string
  residenceCountry: countryType
  citizenshipCountry: countryType
  qualifications: qualificationType[]
  work_histories: []
  spouse: spouseType
}

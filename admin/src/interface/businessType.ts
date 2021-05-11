import { countryType, fundType, qualificationType, spouseType } from '.'

export type businessType = {
  id: number
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
  managerial_experience: boolean
  client_status: boolean
  investRange: fundType
  networthRange: fundType
  residenceCountry: countryType
  citizenshipCountry: countryType
  qualifications: qualificationType[]
  work_histories: []
  spouse: spouseType
}

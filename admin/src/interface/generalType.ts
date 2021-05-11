import {
  countryType,
  experienceType,
  languageProfType,
  qualificationType,
  spouseType,
} from '.'

export type generalType = {
  id: number
  first_name: string
  last_name: string
  email: string
  phone: string
  comment: string
  maritalStatusId: number
  dob: string
  group: number
  eligible_party: number
  createdAt: string
  updatedAt: string
  residenceCountry: countryType
  citizenshipCountry: countryType
  qualifications: qualificationType[]
  work_histories: experienceType[]
  language_proficiencies: languageProfType[]
  spouse: spouseType
  children: number
  client_status: boolean
  criminal_record: boolean
  family_in_canada: boolean
  job_offer: boolean
  medical_condition: boolean
}

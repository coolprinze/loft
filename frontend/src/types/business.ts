export interface createBusinessDataType {
  first_name: string
  last_name: string
  email: string
  phone: string
  dob: string
  managerial_experience: boolean
  maritalStatusId: number
  networth: number
  invest_funds: number
  residenceId: number
  citizenshipId: number
  qualifications?: qualification[]
  spouse?: {
    first_name: string
    last_name: string
    dob: string
    country_of_birth: number
    qualifications?: qualification[]
  }
}

export type qualification = {
  from: string
  to: string
  school: string
  city: string
  countryId: number
  stateId: number
  degreeId: number
}

export type experience = {
  from: string
  to: string
  employer: string
  city: string
  countryId: number
  stateId: number
  occupationId: number
}

export type languageProficiency = {
  level: string
  languageId: number | null
}

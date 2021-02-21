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
  educational_histories?: {
    from: string
    to: string
    school: string
    city: string
    countryId: number
    stateId: number
    degreeId: number
  }[]
  spouse?: {
    first_name: string
    last_name: string
    dob: string
    country_of_birth: number
    educational_histories?: {
      from: string
      to: string
      school: string
      city: string
      countryId: number
      stateId: number
      degreeId: number
    }[]
  }
}

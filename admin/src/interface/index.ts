export type fundType = {
  id: number
  min: number
  max: number
  type: string
  createdAt: string
  updatedAt: string
}
export type spouseType = {
  first_name: string
  last_name: string
  dob: string
  birthCountry: countryType
  qualifications: qualificationType[]
  work_histories: experienceType[]
  language_proficiencies: languageProfType[]
}

export type countryType = {
  id: number
  name: string
  code: string
  slug: string
  flag: string
  desc: string
  createdAt: string
  updatedAt: string
}

export type jobType = {
  id: number
  name: string
  slug: string
  desc: string
  createdAt: string
  updatedAt: string
}

export type stateType = {
  id: number
  name: string
  slug: string
  desc: string
  createdAt: string
  updatedAt: string
}

export type degreeType = {
  id: number
  title: string
  desc: string
  createdAt: string
  updatedAt: string
}

export type experienceType = {
  id: number
  from: string
  to: string
  employer: string
  city: string
  occupation: jobType
  country: countryType
  createdAt: string
  updatedAt: string
}

export type qualificationType = {
  id: number
  from: string
  to: string
  school: string
  city: string
  country: countryType
  state: stateType
  degree: degreeType
  createdAt: string
  updatedAt: string
}

export type languageProfType = {
  id: number
  level: string
  language: { name: string }
  createdAt: string
  updatedAt: string
}

export type errorKey =
  | 'fname'
  | 'lname'
  | 'password'
  | 'countryId'
  | 'interests'
  | 'personal_profile'
  | 'business_profile'
  | 'fname'
  | 'lname'
  | 'title'
  | 'gender'
  | 'dob'
  | 'employment'
  | 'address1'
  | 'address2'
  | 'address3'
  | 'town'
  | 'state'
  | 'zip'
  | 'day_phone'
  | 'mobile_phone'
  | 'personal_email'
  | 'business_email'
  | 'cv'
  | 'qualification_docs'
  | 'more_docs'
  | 'job_title'
  | 'company_name'
  | 'business_phone'
  | 'countryId'
  | 'membership_duration'
  | 'preferred_email'
  | 'preferred_address'
  | 'who_pays'
  | 'interests'
  | 'nationalityId'

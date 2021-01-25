export type fundType = {
  id: number
  min: number
  max: number
  type: string
  createdAt: string
  updatedAt: string
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

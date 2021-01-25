export interface userState {
  id: number;
  username: string;
  email: string;
  role: { id: number };
}

export interface authState {
  isAuthenticated: boolean;
  user: null | userState;
  token: string;
  authLoaded: boolean;
  authenticateUser?: any;
}

export interface generalType {
  id: string;
  fname: string;
  lname: string;
  email: string;
  citizenship: string;
  residence: string;
  age: number;
  married: boolean;
  children: number;
  phone: string;
  job_offer: boolean;
  family_in_canada: boolean;
  criminal_record: boolean;
  medical_condition: boolean;
  comment: string;
  language1: string;
  proficiency1: string;
  language2: string;
  proficiency2: string;
  spouse: {
    id: string;
    age: number;
    experiences: [
      {
        id: string;
        duration: number;
        type: string;
        job: string;
        location: string;
      }
    ];
    qualifications: [
      {
        id: string;
        program: string;
        course: string;
        country: string;
      }
    ];
    language1: string;
    proficiency1: string;
    language2: string;
    proficiency2: string;
  };
  qualifications: [
    {
      id: string;
      program: string;
      course: string;
      country: string;
    }
  ];
  experiences: [
    {
      id: string;
      duration: number;
      type: string;
      job: string;
      location: string;
    }
  ];
}

export interface personalProfile {
  id: number;
  title: string;
  gender: string;
  dob: string;
  employment: string;
  address1: string;
  address2: string;
  address3: string;
  town: string;
  state: string;
  zip: string;
  day_phone: string;
  mobile_phone: string;
  personal_email: string;
  business_email: string;
  cv: string;
  qualification_docs: string;
  more_docs: string;
  createdAt: string;
  updatedAt: string;
  nationalityId: number;
  countryId: number;
  qualificationId: null;
  userId: number;
  nationality: { name: string };
}

export interface membershipType {
  id: number;
  title: string;
  price: number;
  application_fee: number;
  createdAt: string;
  updatedAt: string;
}

export interface optionsType {
  id: number;
  membership_duration: number;
  preferred_email: number;
  preferred_address: number;
  who_pays: string;
  createdAt: string;
  updatedAt: string;
  userId: number;
}

export interface memberType {
  id: number;
  fname: string;
  lname: string;
  oname: null;
  email: string;
  password: string;
  avatar: string;
  role: number;
  createdAt: string;
  updatedAt: string;
  membershipId: number;
  personal_profile: personalProfile;
  business_profile: null;
  membership: membershipType;
  option: optionsType;
}

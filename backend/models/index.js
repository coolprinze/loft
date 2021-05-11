const BusinessImmigrant = require('./BusinessImmigrant')
const {
  Country,
  Visited_Countries,
  Rejected_Countries,
  Deported_Countries,
} = require('./Country')
const Company = require('./Company')
const Qualification = require('./Qualification')
const State = require('./State')
const Occupation = require('./Occupation')
const MaritalStatus = require('./MaritalStatus')
const Experience = require('./WorkHistory')
const Spouse = require('./Spouse')
const BusinessProfile = require('./BusinessProfile')
const { Language, LanguageProficiency } = require('./Language')
const AntiguaImmigrant = require('./AntiguaImmigrant')
const StkittsImmigrant = require('./StkittsImmigrant')
const Fund = require('./Fund')
const MailQueue = require('./MailQueue')
const Degree = require('./Degree')
const {
  successEmailTemplate,
  reviewedEmailTemplate,
  sendMail,
} = require('../mail/index.js')
const { _calculateAge } = require('../helpers/utilities')
const GeneralImmigrant = require('./General')

/* -----------------------------------------------------------------*/
/* --------------------- Degree Associations -----------------------*/
/* -----------------------------------------------------------------*/
Degree.hasMany(Qualification)

/* -----------------------------------------------------------------*/
/* -------------------- Language Associations ----------------------*/
/* -----------------------------------------------------------------*/
Language.hasMany(LanguageProficiency)

/* -----------------------------------------------------------------*/
/* -------------- LanguageProficiency Associations -----------------*/
/* -----------------------------------------------------------------*/
LanguageProficiency.belongsTo(Language)

/* -----------------------------------------------------------------*/
/* --------------- Educational History Associations ----------------*/
/* -----------------------------------------------------------------*/
Qualification.belongsTo(Country)
Qualification.belongsTo(State)
Qualification.belongsTo(Degree)

/* -----------------------------------------------------------------*/
/* --------------------- Country Associations ----------------------*/
/* -----------------------------------------------------------------*/
Country.hasMany(State)
// Country.belongsToMany(StkittsImmigrant, {
//   through: {
//     model: Deported_Countries,
//     unique: false,
//   },
//   foreignKey: 'countryId',
//   constraints: false,
// })
// Country.belongsToMany(StkittsImmigrant, {
//   through: {
//     model: Rejected_Countries,
//     unique: false,
//   },
//   foreignKey: 'countryId',
//   constraints: false,
// })
// Country.belongsToMany(AntiguaImmigrant, {
//   through: {
//     model: Deported_Countries,
//     unique: false,
//   },
//   foreignKey: 'countryId',
//   constraints: false,
// })

// Country.belongsToMany(AntiguaImmigrant, {
//   through: {
//     model: Rejected_Countries,
//     unique: false,
//   },
//   foreignKey: 'countryId',
//   constraints: false,
// })

/* -----------------------------------------------------------------*/
/* ------------------ Marital Status Associations ------------------*/
/* -----------------------------------------------------------------*/
MaritalStatus.hasMany(BusinessImmigrant)
MaritalStatus.hasMany(GeneralImmigrant)

/* -----------------------------------------------------------------*/
/* ---------------------- Spouse Associations ----------------------*/
/* -----------------------------------------------------------------*/
Spouse.belongsTo(Country, {
  foreignKey: 'country_of_birth',
  as: 'birthCountry',
})
// Spouse.belongsTo(BusinessImmigrant, {
//   foreignKey: 'immigrantId',
// })
// Spouse.belongsTo(GeneralImmigrant, {
//   foreignKey: 'immigrantId',
// })
Spouse.hasMany(Qualification, {
  constraints: false,
  scope: {
    immigrantType: 'business',
    refType: 'spouse',
  },
  foreignKey: 'immigrantId',
})
Spouse.hasMany(Qualification, {
  constraints: false,
  scope: {
    immigrantType: 'general',
    refType: 'spouse',
  },
  foreignKey: 'immigrantId',
})
Spouse.hasMany(Experience, {
  constraints: false,
  scope: {
    immigrantType: 'general',
    refType: 'spouse',
  },
  foreignKey: 'immigrantId',
})
Spouse.hasMany(LanguageProficiency, {
  scope: {
    immigrantType: 'business',
    refType: 'spouse',
  },
  foreignKey: 'immigrantId',
  constraints: false,
})
Spouse.hasMany(LanguageProficiency, {
  scope: {
    immigrantType: 'general',
    refType: 'spouse',
  },
  foreignKey: 'immigrantId',
  constraints: false,
})

/* -----------------------------------------------------------------*/
/* ------------------- Work History Associations -------------------*/
/* -----------------------------------------------------------------*/
Experience.belongsTo(Country)
Experience.belongsTo(State)
Experience.belongsTo(Occupation)

/* -----------------------------------------------------------------*/
/* ----------------- Business Profile Associations -----------------*/
/* -----------------------------------------------------------------*/
BusinessProfile.hasMany(Experience, {
  foreignKey: 'immigrantId',
  constraints: false,
  scope: {
    immigrantType: 'business',
    refType: 'applicant',
  },
})
BusinessProfile.belongsTo(State, {
  foreignKey: 'currect_city',
  as: 'currentCity',
})
BusinessProfile.belongsTo(Country, {
  foreignKey: 'currect_country',
  as: 'currentCountry',
})
BusinessProfile.belongsToMany(Country, {
  through: 'citizenshipId',
  as: 'citizenshipCountries',
})
BusinessProfile.belongsTo(MaritalStatus)
BusinessProfile.hasOne(Company)
BusinessProfile.belongsTo(State, {
  foreignKey: 'city_of_birth',
  as: 'birthCity',
})
BusinessProfile.belongsTo(Country, {
  foreignKey: 'country_of_birth',
  as: 'birthCountry',
})
BusinessProfile.belongsTo(State, {
  foreignKey: 'preferred_state',
  as: 'preferredState',
})
BusinessProfile.hasMany(LanguageProficiency, {
  scope: {
    immigrantType: 'business',
    refType: 'applicant',
  },
  foreignKey: 'immigrantId',
  constraints: false,
})
BusinessProfile.belongsToMany(Country, {
  through: {
    model: Visited_Countries,
    unique: false,
    scope: {
      visitedType: 'business',
    },
  },
  as: 'VisitedCountries',
  foreignKey: 'visitedId',
  constraints: false,
})

/* -----------------------------------------------------------------*/
/* ------------------- Fund Associations -------------------*/
/* -----------------------------------------------------------------*/
// Fund.hasMany(AntiguaImmigrant, {
//   foreignKey: 'networth',
//   as: 'antiguaNetworths',
// })
// Fund.hasMany(AntiguaImmigrant, {
//   foreignKey: 'invest_funds',
//   as: 'antiguaInvests',
// })
// Fund.hasMany(StkittsImmigrant, {
//   foreignKey: 'networth',
//   as: 'stkittsNetworths',
// })
// Fund.hasMany(StkittsImmigrant, {
//   foreignKey: 'invest_funds',
//   as: 'stkittsInvests',
// })
// Fund.hasMany(BusinessImmigrant, {
//   foreignKey: 'networth',
//   as: 'businessNetworths',
// })
// Fund.hasMany(BusinessImmigrant, {
//   foreignKey: 'invest_funds',
//   as: 'businessInvests',
// })

/* -----------------------------------------------------------------*/
/* ---------------- Antigua Immigrant Associations -----------------*/
/* -----------------------------------------------------------------*/

AntiguaImmigrant.belongsTo(Fund, {
  foreignKey: 'invest_funds',
  as: 'investRange',
})
AntiguaImmigrant.belongsTo(Fund, {
  foreignKey: 'networth',
  as: 'networthRange',
})
AntiguaImmigrant.belongsTo(Country, {
  foreignKey: 'residence',
  as: 'residenceCountry',
})
AntiguaImmigrant.belongsTo(Country, {
  foreignKey: 'nationality',
  as: 'nationalityCountry',
})
AntiguaImmigrant.hasMany(MailQueue, {
  foreignKey: 'immigrantId',
  constraints: false,
  scope: {
    immigrantType: 'antigua',
  },
})

AntiguaImmigrant.belongsToMany(Country, {
  through: {
    model: Rejected_Countries,
    unique: false,
    scope: {
      rejectedType: 'antigua',
    },
  },
  as: 'RejectedCountries',
  foreignKey: 'rejectedId',
  constraints: false,
})

AntiguaImmigrant.belongsToMany(Country, {
  through: {
    model: Deported_Countries,
    unique: false,
    scope: {
      deportedType: 'antigua',
    },
  },
  as: 'DeportedCountries',
  foreignKey: 'deportedId',
  constraints: false,
})

AntiguaImmigrant.beforeCreate((immigrant) => {
  let { contact_medium } = immigrant,
    contactString = ''

  if (contact_medium && typeof contact_medium === 'object') {
    contact_medium.forEach((contact) => {
      contactString += contact
    })
    immigrant.contact_medium = contactString
  }
})

AntiguaImmigrant.afterCreate((immigrant) => {
  let { email } = immigrant
  const date = new Date()
  const type = 'Antigua'
  date.setMinutes(date.getMinutes() + 10)
  console.log(`Will send 2nd mail to ${email} on: `, date)
  sendMail(
    {
      to: email,
      from: {
        name: `Loft Immigration | ${type} Assessment`,
        address: 'immigrants@loftimmigration.com',
      },
      subject: 'Application Successful',
      html: successEmailTemplate(immigrant, type),
    },
    (res) => console.log(res.envelope || res)
  )
  immigrant.createMailQueue({
    to: email,
    from_name: `Loft Immigration | ${type} Assessment`,
    from_address: 'immigrants@loftimmigration.com',
    subject: 'Application Reviewed',
    message: reviewedEmailTemplate(immigrant, type),
    title: `2nd Mail to ${type} Immigrant`,
    schedule: date,
  })
})
/* -----------------------------------------------------------------*/
/* ---------------- St.Kitts Immigrant Associations ----------------*/
/* -----------------------------------------------------------------*/
StkittsImmigrant.belongsTo(Fund, {
  foreignKey: 'invest_funds',
  as: 'investRange',
})
StkittsImmigrant.belongsTo(Fund, {
  foreignKey: 'networth',
  as: 'networthRange',
})
StkittsImmigrant.belongsTo(Country, {
  foreignKey: 'residence',
  as: 'residenceCountry',
})
StkittsImmigrant.belongsTo(Country, {
  foreignKey: 'nationality',
  as: 'nationalityCountry',
})
StkittsImmigrant.hasMany(MailQueue, {
  foreignKey: 'immigrantId',
  constraints: false,
  scope: {
    immigrantType: 'stkitt',
  },
})
StkittsImmigrant.belongsToMany(Country, {
  through: {
    model: Rejected_Countries,
    unique: false,
    scope: {
      rejectedType: 'stkitt',
    },
  },
  as: 'RejectedCountries',
  foreignKey: 'rejectedId',
  constraints: false,
})
StkittsImmigrant.belongsToMany(Country, {
  through: {
    model: Deported_Countries,
    unique: false,
    scope: {
      deportedType: 'stkitt',
    },
  },
  as: 'DeportedCountries',
  foreignKey: 'deportedId',
  constraints: false,
})
/*--Hooks--*/
StkittsImmigrant.beforeCreate((immigrant) => {
  let { contact_medium } = immigrant,
    contactString = ''

  if (contact_medium && typeof contact_medium === 'object') {
    contact_medium.forEach((contact) => {
      contactString += contact
    })
    immigrant.contact_medium = contactString
  }
})
StkittsImmigrant.afterCreate((immigrant) => {
  let { email } = immigrant
  const date = new Date()
  const type = 'St. Kitts'
  date.setMinutes(date.getMinutes() + 10)
  console.log(`Will send 2nd mail to ${email} on: `, date)
  sendMail(
    {
      to: email,
      from: {
        name: `Loft Immigration | ${type} Assessment`,
        address: 'immigrants@loftimmigration.com',
      },
      subject: 'Application Successful',
      html: successEmailTemplate(immigrant, type),
    },
    (res) => console.log(res.envelope || res)
  )
  immigrant.createMailQueue({
    to: email,
    from_name: `Loft Immigration | ${type} Assessment`,
    from_address: 'immigrants@loftimmigration.com',
    subject: 'Application Reviewed',
    message: reviewedEmailTemplate(immigrant, type),
    title: `2nd Mail to ${type} Immigrant`,
    schedule: date,
  })
})

/* -----------------------------------------------------------------*/
/* ---------------- Business Immigrant Associations ----------------*/
/* -----------------------------------------------------------------*/

BusinessImmigrant.hasMany(Qualification, {
  foreignKey: 'immigrantId',
  constraints: false,
  scope: {
    immigrantType: 'business',
    refType: 'applicant',
  },
})
BusinessImmigrant.hasMany(MailQueue, {
  foreignKey: 'immigrantId',
  constraints: false,
  scope: {
    immigrantType: 'business',
  },
})
BusinessImmigrant.hasOne(Spouse, {
  scope: {
    spouseType: 'business',
  },
  foreignKey: 'immigrantId',
  constraints: false,
})
BusinessImmigrant.belongsTo(Fund, {
  foreignKey: 'networth',
  as: 'networthRange',
})
BusinessImmigrant.belongsTo(Fund, {
  foreignKey: 'invest_funds',
  as: 'investRange',
})
BusinessImmigrant.hasOne(BusinessProfile)
BusinessImmigrant.belongsTo(Country, {
  foreignKey: 'residenceId',
  as: 'residenceCountry',
})
BusinessImmigrant.belongsTo(Country, {
  foreignKey: 'citizenshipId',
  as: 'citizenshipCountry',
})

BusinessImmigrant.beforeCreate(async (immigrant) => {
  const {
    invest_funds,
    qualifications: quals,
    spouse,
    dob,
  } = (immigrant = immigrant)

  const fund = await Fund.findByPk(Number(invest_funds))

  let isMsc = quals.some((qual) => Number(qual.degreeId) > 2),
    age = _calculateAge(dob),
    spouseAge = !!spouse ? _calculateAge(spouse.dob) : 100,
    spouseMsc = !!spouse
      ? spouse.qualifications.some((qual) => Number(qual.degreeId) > 2)
      : false,
    group = 0,
    eligible_party = null

  if (fund) {
    const gt150k = fund.min >= 150000
    const gt25k = fund.min >= 25000
    if (gt150k) {
      group = 1
      eligible_party = 'applicant'
    } else if (
      gt25k &&
      ((age <= 30 && isMsc) || (spouseAge <= 30 && spouseMsc))
    ) {
      group = 5
      eligible_party = age <= 30 && isMsc ? 'applicant' : 'spouse'
    } else if ((age < 30 && !isMsc) || (spouseAge < 30 && !spouseMsc)) {
      group = 8
      eligible_party = age < 30 && !isMsc ? 'applicant' : 'spouse'
    } else if (
      gt25k &&
      ((age > 30 && isMsc) || (spouseAge > 30 && spouseMsc))
    ) {
      group = 6
      eligible_party = age > 30 && isMsc ? 'applicant' : 'spouse'
    } else if (
      gt25k &&
      ((age > 30 && !isMsc) || (spouseAge > 30 && !spouseMsc))
    ) {
      group = 7
      eligible_party = age > 30 && !isMsc ? 'applicant' : 'spouse'
    }
  }

  immigrant.group = group
  immigrant.eligible_party = eligible_party
})

BusinessImmigrant.afterCreate((immigrant) => {
  let { email, group } = immigrant
  const date = new Date()
  const type = 'Business'
  date.setMinutes(date.getMinutes() + 10)
  console.log(`Will send 2nd mail to ${email} on: `, date)
  sendMail(
    {
      to: email,
      from: {
        name: `Loft Immigration | Canada ${type} Immigration`,
        address: 'clientsupport@loftimmigration.com',
      },
      subject: 'Assessment Form Received',
      html: successEmailTemplate(immigrant, type),
    },
    (res) => console.log(res.envelope || res)
  )
  if (group == 1)
    immigrant.createMailQueue({
      to: email,
      from_name: `Loft Immigration | Canada ${type} Immigration`,
      from_address: 'clientsupport@loftimmigration.com',
      subject: 'Assessment Reviewed',
      message: reviewedEmailTemplate(immigrant, type),
      title: `2nd Mail to ${type} Immigrant`,
      schedule: date,
    })
})
/* -----------------------------------------------------------------*/
/* ---------------- General Immigrant Associations ----------------*/
/* -----------------------------------------------------------------*/

GeneralImmigrant.hasOne(Spouse, {
  scope: {
    spouseType: 'general',
  },
  foreignKey: 'immigrantId',
  constraints: false,
})
GeneralImmigrant.belongsTo(Country, {
  foreignKey: 'citizenshipId',
  as: 'citizenshipCountry',
})
GeneralImmigrant.belongsTo(Country, {
  foreignKey: 'residenceId',
  as: 'residenceCountry',
})
GeneralImmigrant.hasMany(Qualification, {
  foreignKey: 'immigrantId',
  constraints: false,
  scope: {
    immigrantType: 'general',
    refType: 'applicant',
  },
})
GeneralImmigrant.hasMany(LanguageProficiency, {
  scope: {
    immigrantType: 'general',
    refType: 'applicant',
  },
  foreignKey: 'immigrantId',
  constraints: false,
})
GeneralImmigrant.hasMany(Experience, {
  foreignKey: 'immigrantId',
  constraints: false,
  scope: {
    immigrantType: 'general',
    refType: 'applicant',
  },
})
GeneralImmigrant.hasMany(MailQueue, {
  foreignKey: 'immigrantId',
  constraints: false,
  scope: {
    immigrantType: 'general',
  },
})

GeneralImmigrant.beforeCreate((immigrant) => {
  const { qualifications: quals, spouse, dob } = immigrant

  let isMsc = quals.some((qual) => Number(qual.degreeId) > 2),
    age = _calculateAge(dob),
    spouseAge = !!spouse ? _calculateAge(spouse.dob) : 100,
    spouseMsc = !!spouse
      ? spouse.qualifications.some((qual) => Number(qual.degreeId) > 2)
      : false,
    group = 0,
    eligible_party = null

  if ((age <= 30 && isMsc) || (spouseAge <= 30 && spouseMsc)) {
    group = 5
    eligible_party = age <= 30 && isMsc ? 'applicant' : 'spouse'
  } else if ((age < 30 && !isMsc) || (spouseAge < 30 && !spouseMsc)) {
    group = 8
    eligible_party = age < 30 && !isMsc ? 'applicant' : 'spouse'
  } else if ((age > 30 && isMsc) || (spouseAge > 30 && spouseMsc)) {
    group = 6
    eligible_party = age > 30 && isMsc ? 'applicant' : 'spouse'
  } else if ((age > 30 && !isMsc) || (spouseAge > 30 && !spouseMsc)) {
    group = 7
    eligible_party = age > 30 && !isMsc ? 'applicant' : 'spouse'
  }

  immigrant.group = group
  immigrant.eligible_party = eligible_party
})

GeneralImmigrant.afterCreate((immigrant) => {
  let { email } = immigrant
  const date = new Date()
  const type = 'General'
  date.setMinutes(date.getMinutes() + 10)
  console.log(`Will send 2nd mail to ${email} on: `, date)
  sendMail(
    {
      to: email,
      from: {
        name: `Loft Immigration | ${type} Assessment`,
        address: 'immigrants@loftimmigration.com',
      },
      subject: 'Application Successful',
      html: successEmailTemplate(immigrant, type),
    },
    (res) => console.log(res.envelope || res)
  )
  immigrant.createMailQueue({
    to: email,
    from_name: `Loft Immigration | ${type} Assessment`,
    from_address: 'immigrants@loftimmigration.com',
    subject: 'Application Reviewed',
    message: reviewedEmailTemplate(immigrant, type),
    title: `2nd Mail to ${type} Immigrant`,
    schedule: date,
  })
})

module.exports = {
  Company,
  Qualification,
  State,
  Occupation,
  MaritalStatus,
  Experience,
  Spouse,
  BusinessProfile,
  Language,
  LanguageProficiency,
  Country,
  Visited_Countries,
  Fund,
  AntiguaImmigrant,
  StkittsImmigrant,
  BusinessImmigrant,
  GeneralImmigrant,
  Degree,
}

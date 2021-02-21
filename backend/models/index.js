const BusinessImmigrant = require('./BusinessImmigrant')
const {
  Country,
  Visited_Countries,
  Rejected_Countries,
  Deported_Countries,
} = require('./Country')
const Company = require('./Company')
const EducationalHistory = require('./EducationalHistory')
const State = require('./State')
const Occupation = require('./Occupation')
const MaritalStatus = require('./MaritalStatus')
const WorkHistory = require('./WorkHistory')
const Spouse = require('./Spouse')
const BusinessProfile = require('./BusinessProfile')
const { Language, LanguageProficiencies } = require('./Language')
const AntiguaImmigrant = require('./AntiguaImmigrant')
const StkittsImmigrant = require('./StkittsImmigrant')
const Fund = require('./Fund')
const MailQueue = require('./MailQueue')
const Degree = require('./Degree')

/* -----------------------------------------------------------------*/
/* --------------------- Degree Associations -----------------------*/
/* -----------------------------------------------------------------*/
Degree.hasMany(EducationalHistory)

/* -----------------------------------------------------------------*/
/* --------------- Educational History Associations ----------------*/
/* -----------------------------------------------------------------*/
EducationalHistory.belongsTo(Country)
EducationalHistory.belongsTo(State)
EducationalHistory.belongsTo(Degree)

/* -----------------------------------------------------------------*/
/* --------------------- Country Associations ----------------------*/
/* -----------------------------------------------------------------*/
Country.hasMany(State)
Country.belongsToMany(StkittsImmigrant, {
  through: {
    model: Deported_Countries,
    unique: false,
  },
  foreignKey: 'countryId',
  constraints: false,
})
Country.belongsToMany(StkittsImmigrant, {
  through: {
    model: Rejected_Countries,
    unique: false,
  },
  foreignKey: 'countryId',
  constraints: false,
})

/* -----------------------------------------------------------------*/
/* ------------------ Marital Status Associations ------------------*/
/* -----------------------------------------------------------------*/
MaritalStatus.hasMany(BusinessImmigrant)

/* -----------------------------------------------------------------*/
/* ---------------------- Spouse Associations ----------------------*/
/* -----------------------------------------------------------------*/
Spouse.belongsTo(Country, {
  foreignKey: 'country_of_birth',
  as: 'birthCountry',
})
Spouse.belongsTo(BusinessImmigrant, {
  foreignKey: 'immigrantId',
})
Spouse.hasMany(EducationalHistory, {
  unique: false,
  scope: {
    immigrantType: 'business',
    refType: 'spouse',
  },
  foreignKey: 'immigrantId',
})

/* -----------------------------------------------------------------*/
/* ------------------- Work History Associations -------------------*/
/* -----------------------------------------------------------------*/
WorkHistory.belongsTo(Country)
WorkHistory.belongsTo(State)
WorkHistory.belongsTo(Occupation)

/* -----------------------------------------------------------------*/
/* ----------------- Business Profile Associations -----------------*/
/* -----------------------------------------------------------------*/
BusinessProfile.hasMany(WorkHistory, {
  unique: false,
  scope: {
    immigrantType: 'business',
  },
  foreignKey: 'immigrantId',
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
BusinessProfile.belongsToMany(Language, {
  through: {
    model: LanguageProficiencies,
    unique: false,
    scope: {
      immigrantType: 'business',
    },
  },
  foreignKey: 'refId',
  constraints: false,
  as: 'littleProficiencies',
})
BusinessProfile.belongsToMany(Language, {
  through: {
    model: LanguageProficiencies,
    unique: false,
    scope: {
      immigrantType: 'business',
    },
  },
  foreignKey: 'refId',
  constraints: false,
  as: 'moderateProficiencies',
})
BusinessProfile.belongsToMany(Language, {
  through: {
    model: LanguageProficiencies,
    unique: false,
    scope: {
      immigrantType: 'business',
    },
  },
  foreignKey: 'refId',
  constraints: false,
  as: 'highProficiencies',
})
BusinessProfile.belongsToMany(Language, {
  through: {
    model: LanguageProficiencies,
    unique: false,
    scope: {
      immigrantType: 'business',
    },
  },
  foreignKey: 'refId',
  constraints: false,
  as: 'spouseLittleProficiencies',
})
BusinessProfile.belongsToMany(Language, {
  through: {
    model: LanguageProficiencies,
    unique: false,
    scope: {
      immigrantType: 'business',
    },
  },
  foreignKey: 'refId',
  constraints: false,
  as: 'spouseModerateProficiencies',
})
BusinessProfile.belongsToMany(Language, {
  through: {
    model: LanguageProficiencies,
    unique: false,
    scope: {
      immigrantType: 'business',
    },
  },
  foreignKey: 'refId',
  constraints: false,
  as: 'spouseHighProficiencies',
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
StkittsImmigrant.hasMany(MailQueue)
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

/* -----------------------------------------------------------------*/
/* ---------------- Business Immigrant Associations ----------------*/
/* -----------------------------------------------------------------*/

BusinessImmigrant.hasMany(EducationalHistory, {
  unique: false,
  scope: {
    immigrantType: 'business',
    refType: 'applicant',
  },
  foreignKey: 'immigrantId',
})
BusinessImmigrant.hasOne(Spouse, {
  unique: false,
  scope: {
    spouseType: 'business',
  },
  foreignKey: 'immigrantId',
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
BusinessImmigrant.beforeFindAfterExpandIncludeAll('huih', (immigrant) => {})

module.exports = {
  Company,
  EducationalHistory,
  State,
  Occupation,
  MaritalStatus,
  WorkHistory,
  Spouse,
  BusinessProfile,
  Language,
  Country,
  Visited_Countries,
  Fund,
  AntiguaImmigrant,
  StkittsImmigrant,
  BusinessImmigrant,
}

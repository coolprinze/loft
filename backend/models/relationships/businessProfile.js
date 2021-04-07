
const {
  Country,
  Visited_Countries,
} = require('./Country')
const Company = require('./Company')
const State = require('./State')
const MaritalStatus = require('./MaritalStatus')
const Experience = require('./WorkHistory')
const BusinessProfile = require('./BusinessProfile')
const { Language, LanguageProficiencies } = require('./Language')

/* -----------------------------------------------------------------*/
/* ----------------- Business Profile Associations -----------------*/
/* -----------------------------------------------------------------*/
BusinessProfile.hasMany(Experience, {
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
    foreignKey: 'languageId',
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
    foreignKey: 'languageId',
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
    foreignKey: 'languageId',
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
    foreignKey: 'languageId',
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
    foreignKey: 'languageId',
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
    foreignKey: 'languageId',
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

  module.exports = BusinessProfile
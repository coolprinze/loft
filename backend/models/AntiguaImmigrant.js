const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')
const { Country, Rejected_Countries, Deported_Countries } = require('./Country')
const {
  successEmailTemplate,
  reviewedEmailTemplate,
  sendMail,
} = require('../mail/index.js')
const MailQueue = require('./MailQueue.js')
const Fund = require('./Fund')

const { DataTypes } = Sequelize

const AntiguaImmigrant = sequelize.define('antigua_immigrant', {
  first_name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  last_name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
  phone: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  // networth: {
  //   type: DataTypes.STRING,
  //   allowNull: false,
  // },
  // invest_funds: {
  //   type: DataTypes.STRING,
  //   allowNull: false,
  // },

  married: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  old_dependents: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: 0,
  },
  young_dependents: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: 0,
  },
  teen_dependents: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: 0,
  },
  average_dependents: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: 0,
  },
  rejected: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
    defaultValue: false,
  },
  deported: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
    defaultValue: false,
  },
  contact_medium: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  referee: {
    type: DataTypes.STRING,
    allowNull: true,
  },
})

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
AntiguaImmigrant.hasMany(MailQueue)

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
      html: successEmailTemplate(immigrant),
    },
    (res) => console.log(res.envelope || res)
  )
  immigrant.createMailQueue({
    to: email,
    from_name: `Loft Immigration | ${type} Assessment`,
    from_address: 'immigrants@loftimmigration.com',
    subject: 'Application Reviewed',
    message: reviewedEmailTemplate(immigrant),
    title: `2nd Mail to ${type} Immigrant`,
    schedule: date,
  })
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

Country.belongsToMany(AntiguaImmigrant, {
  through: {
    model: Deported_Countries,
    unique: false,
  },
  foreignKey: 'countryId',
  constraints: false,
})

Country.belongsToMany(AntiguaImmigrant, {
  through: {
    model: Rejected_Countries,
    unique: false,
  },
  foreignKey: 'countryId',
  constraints: false,
})

module.exports = AntiguaImmigrant

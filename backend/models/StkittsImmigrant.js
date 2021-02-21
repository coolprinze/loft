const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')
const {
  successEmailTemplate,
  reviewedEmailTemplate,
  sendMail,
} = require('../mail/index.js')

const { DataTypes } = Sequelize

const StkittsImmigrant = sequelize.define('stkitts_immigrant', {
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
module.exports = StkittsImmigrant

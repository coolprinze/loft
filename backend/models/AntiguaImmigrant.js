const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')
const Country = require('./Country')

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
  contact_medium: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  referee: {
    type: DataTypes.STRING,
    allowNull: true,
  },
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

AntiguaImmigrant.belongsTo(Country, { foreignKey: 'residence' })
AntiguaImmigrant.belongsTo(Country, { foreignKey: 'nationality' })

module.exports = AntiguaImmigrant

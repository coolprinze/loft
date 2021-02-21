const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')
const {
  successEmailTemplate,
  reviewedEmailTemplate,
  sendMail,
} = require('../mail/index.js')

const { DataTypes } = Sequelize

const BusinessImmigrant = sequelize.define('business_immigrant', {
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
    validate: { isEmail: true },
  },
  phone: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  dob: {
    type: DataTypes.DATE,
    allowNull: false,
  },
  managerial_experience: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
  },
})

module.exports = BusinessImmigrant

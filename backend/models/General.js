const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const GeneralImmigrant = sequelize.define('general_immigrant', {
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
  dob: {
    type: DataTypes.DATE,
    allowNull: false,
  },
  children: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 0,
  },
  phone: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  job_offer: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
  },
  family_in_canada: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
  },
  criminal_record: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
  },
  medical_condition: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
  },
  comment: {
    type: DataTypes.TEXT,
    allowNull: true,
  },
  group: {
    type: DataTypes.INTEGER,
    defaultValue: 0,
  },
  eligible_party: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  client_status: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
  },
})

module.exports = GeneralImmigrant

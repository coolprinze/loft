const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const IntlTransfer = sequelize.define('intl_transfer', {
  employees_total: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  company_name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  managers_to_transfer: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  employees_to_transfer: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  revenue: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  hq_location: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  business_activity: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  phone: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  website: {
    type: DataTypes.STRING,
    allowNull: false,
  },
})

module.exports = IntlTransfer

const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')
const { companyInfo } = require('./types.js')

const { DataTypes } = Sequelize

const IntlTransfer = sequelize.define('intl_transfer', {
  ...companyInfo,
  employees_total: {
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
})

module.exports = IntlTransfer

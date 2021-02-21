const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const Company = sequelize.define('company', {
  employees: {
    allowNull: false,
    type: DataTypes.INTEGER,
  },
  gross_annual_salses: {
    allowNull: false,
    type: DataTypes.INTEGER,
  },
  business_type: {
    allowNull: false,
    type: DataTypes.STRING,
  },
})

module.exports = Company

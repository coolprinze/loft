const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')
const { companyInfo } = require('./types.js')

const { DataTypes } = Sequelize

const CanadianEmployer = sequelize.define('canadian_employer', {
  ...companyInfo,
  employees_total: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  employees_fulltime: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  employees_parttime: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  employees_needed: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  situation: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  positions: {
    type: DataTypes.STRING,
    allowNull: false,
  },
})

module.exports = CanadianEmployer

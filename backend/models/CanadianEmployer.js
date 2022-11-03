const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const CanadianEmployer = sequelize.define('canadian_employer', {
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
  business_activity: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  location: {
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
  positions: {
    type: DataTypes.STRING,
    allowNull: false,
  },
})

module.exports = CanadianEmployer

const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')
const WorkHistory = require('./WorkHistory.js')

const { DataTypes } = Sequelize

const Occupation = sequelize.define('occupation', {
  name: {
    allowNull: false,
    type: DataTypes.STRING,
    unique: true,
  },

  slug: {
    allowNull: false,
    type: DataTypes.STRING,
    unique: true,
  },
  desc: {
    allowNull: true,
    type: DataTypes.TEXT,
  },
})

module.exports = Occupation

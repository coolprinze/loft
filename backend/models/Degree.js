const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const Degree = sequelize.define('degree', {
  title: {
    allowNull: false,
    type: DataTypes.STRING,
    unique: true,
  },

  desc: {
    allowNull: true,
    type: DataTypes.TEXT,
  },
})

module.exports = Degree

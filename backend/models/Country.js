const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const Country = sequelize.define('country', {
  name: {
    allowNull: false,
    type: DataTypes.STRING,
    unique: true,
  },

  code: {
    allowNull: false,
    type: DataTypes.STRING,
    unique: true,
  },

  slug: {
    allowNull: false,
    type: DataTypes.STRING,
    unique: true,
  },
  flag: {
    allowNull: true,
    type: DataTypes.STRING,
  },

  desc: {
    allowNull: true,
    type: DataTypes.TEXT,
  },
})

module.exports = Country

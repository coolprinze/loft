const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const State = sequelize.define('state', {
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

module.exports = State

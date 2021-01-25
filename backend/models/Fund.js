const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const Fund = sequelize.define('fund', {
  min: {
    allowNull: false,
    type: DataTypes.INTEGER,
    defaultValue: 0,
  },
  max: {
    allowNull: false,
    type: DataTypes.INTEGER,
    defaultValue: 0,
  },
  type: {
    allowNull: false,
    type: DataTypes.STRING,
  },
})

module.exports = Fund

const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const MaritalStatus = sequelize.define('marital_status', {
  title: {
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

module.exports = MaritalStatus

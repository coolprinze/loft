const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const Qualification = sequelize.define('qualification', {
  from: {
    allowNull: false,
    type: DataTypes.DATE,
  },

  to: {
    allowNull: false,
    type: DataTypes.DATE,
  },

  school: {
    allowNull: false,
    type: DataTypes.STRING,
  },

  city: {
    allowNull: false,
    type: DataTypes.STRING,
  },
  immigrantType: DataTypes.STRING,

  refType: DataTypes.STRING,

  immigrantId: DataTypes.INTEGER,
})

module.exports = Qualification

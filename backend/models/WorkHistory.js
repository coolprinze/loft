const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const WorkHistory = sequelize.define('work_history', {
  from: {
    allowNull: false,
    type: DataTypes.DATE,
  },

  to: {
    allowNull: false,
    type: DataTypes.DATE,
  },

  employer: {
    allowNull: false,
    type: DataTypes.STRING,
  },

  city: {
    allowNull: false,
    type: DataTypes.STRING,
  },
  immigrantType: {
    type: DataTypes.STRING,
    unique: 'tt_unique_constraint',
  },
  immigrantId: {
    type: DataTypes.INTEGER,
    unique: 'tt_unique_constraint',
    references: null,
  },
})

module.exports = WorkHistory

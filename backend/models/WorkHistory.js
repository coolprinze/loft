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
    allowNull: true,
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

module.exports = WorkHistory

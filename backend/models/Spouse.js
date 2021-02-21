const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const Spouse = sequelize.define('spouse', {
  first_name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  last_name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  dob: {
    type: DataTypes.DATE,
    allowNull: false,
  },
  spouseType: {
    type: DataTypes.STRING,
    unique: 'tt_unique_constraint',
  },
})

module.exports = Spouse

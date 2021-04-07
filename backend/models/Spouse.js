const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const Spouse = sequelize.define('spouse', {
  first_name: {
    type: DataTypes.STRING,
    allowNull: true,
    defaultValue: 'Nil',
  },
  last_name: {
    type: DataTypes.STRING,
    allowNull: true,
    defaultValue: 'Nil',
  },
  dob: {
    type: DataTypes.DATE,
    allowNull: false,
  },
  immigrantId: DataTypes.INTEGER,
  
  spouseType: DataTypes.STRING,
})

module.exports = Spouse

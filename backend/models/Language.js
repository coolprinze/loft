const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const Language = sequelize.define('language', {
  name: {
    allowNull: false,
    type: DataTypes.STRING,
    unique: true,
  },
  description: {
    allowNull: true,
    type: DataTypes.STRING,
  },
})

const LanguageProficiency = sequelize.define('language_proficiency', {
  level: {
    type: DataTypes.STRING,
    allowNull: false
  },
  immigrantType: DataTypes.STRING,

  refType: DataTypes.STRING,

  immigrantId: DataTypes.INTEGER,
  
})

module.exports = { Language, LanguageProficiency }

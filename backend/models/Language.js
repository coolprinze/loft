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

const LanguageProficiencies = sequelize.define('language_proficiencies', {
  languageId: {
    type: DataTypes.INTEGER,
    unique: 'tt_unique_constraint',
  },
  refId: {
    type: DataTypes.INTEGER,
    unique: 'tt_unique_constraint',
    references: null,
  },
  immigrantType: {
    type: DataTypes.STRING,
    unique: 'tt_unique_constraint',
  },
})

module.exports = { Language, LanguageProficiencies }

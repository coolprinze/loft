const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')
const AntiguaImmigrant = require('./AntiguaImmigrant.js')

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

Fund.hasMany(AntiguaImmigrant, { foreignKey: 'invest_funds' })
Fund.hasMany(AntiguaImmigrant, { foreignKey: 'networth' })

module.exports = Fund

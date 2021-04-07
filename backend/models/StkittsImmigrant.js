const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const StkittsImmigrant = sequelize.define('stkitts_immigrant', {
  first_name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  last_name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
  phone: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  // networth: {
  //   type: DataTypes.STRING,
  //   allowNull: false,
  // },
  // invest_funds: {
  //   type: DataTypes.STRING,
  //   allowNull: false,
  // },

  married: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  old_dependents: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: 0,
  },
  young_dependents: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: 0,
  },
  teen_dependents: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: 0,
  },
  average_dependents: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: 0,
  },
  rejected: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
    defaultValue: false,
  },
  deported: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
    defaultValue: false,
  },
  contact_medium: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  referee: {
    type: DataTypes.STRING,
    allowNull: true,
  },
})
module.exports = StkittsImmigrant

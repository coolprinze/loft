const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const MailQueue = sequelize.define('mailQueue', {
  to: { type: DataTypes.STRING, allowNull: false },
  from_name: { type: DataTypes.STRING, allowNull: false },
  from_address: { type: DataTypes.STRING, allowNull: false },
  subject: { type: DataTypes.STRING, allowNull: false },
  message: { type: DataTypes.TEXT('long'), allowNull: false },
  status: { type: DataTypes.STRING, defaultValue: 'waiting' },
  title: { type: DataTypes.STRING, allowNull: true },
  schedule: { type: DataTypes.DATE, allowNull: false },
  immigrantType: DataTypes.STRING,

  immigrantId: DataTypes.INTEGER,
})

// MailQueue.belongsTo(AntiguaImmigrant)

module.exports = MailQueue

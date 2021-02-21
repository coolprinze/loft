const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')
const {
  successEmailTemplate,
  reviewedEmailTemplate,
  sendMail,
} = require('../mail/index.js')

const { DataTypes } = Sequelize

const BusinessProfile = sequelize.define('business_profile', {
  currect_address: {
    type: DataTypes.DATE,
    allowNull: false,
  },
  skype_id: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  native_language: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  business_knowledge: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  business_experience: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  language_result: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  close_relative: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  child_enrolled: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
  },
  canadian_entry_visa: {
    type: DataTypes.DATE,
    allowNull: true,
  },

  mental_disorder: {
    type: DataTypes.TEXT,
    allowNull: true,
  },

  past_application: {
    type: DataTypes.TEXT,
    allowNull: true,
  },

  denied: {
    type: DataTypes.TEXT,
    allowNull: true,
  },

  ordered_to_leave: {
    type: DataTypes.TEXT,
    allowNull: true,
  },

  commited_offense: {
    type: DataTypes.TEXT,
    allowNull: true,
  },

  military_record: {
    type: DataTypes.TEXT,
    allowNull: true,
  },

  government_employed: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
  },

  commited_offense: {
    type: DataTypes.TEXT,
    allowNull: true,
  },
  preferred_city: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  preferred_business: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  preferred_migration_date: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  business_owner: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
  },
})

module.exports = BusinessProfile

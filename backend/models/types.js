const { DataTypes } = require('sequelize')

const companyInfo = {
  company_name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  contact_person: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  contact_position: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  phone: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  business_activity: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  location: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  website: {
    type: DataTypes.STRING,
    allowNull: false,
  },
}
module.exports = { companyInfo }

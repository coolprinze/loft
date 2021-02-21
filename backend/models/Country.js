const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')

const { DataTypes } = Sequelize

const Country = sequelize.define('country', {
  name: {
    allowNull: false,
    type: DataTypes.STRING,
    unique: true,
  },

  code: {
    allowNull: false,
    type: DataTypes.STRING,
    unique: true,
  },

  slug: {
    allowNull: false,
    type: DataTypes.STRING,
    unique: true,
  },
  flag: {
    allowNull: true,
    type: DataTypes.STRING,
  },

  desc: {
    allowNull: true,
    type: DataTypes.TEXT,
  },
})

Country.prototype.getRejectees = async (options) => {
  const antiguaImmigrants = await this.getAntiguaImmigrants(options)
  const stkittsImmigrants = await this.getStkittsImmigrants(options)
  return antiguaImmigrants.concat(stkittsImmigrants)
}

Country.prototype.getDeportees = async (options) => {
  const antiguaImmigrants = await this.getAntiguaImmigrants(options)
  const stkittsImmigrants = await this.getStkittsImmigrants(options)
  return antiguaImmigrants.concat(stkittsImmigrants)
}

Country.prototype.getVisitors = async (options) => {
  const businessImmigrants = await this.getBusinessImmigrants(options)
  return businessImmigrants
}

const Rejected_Countries = sequelize.define('rejected_countries', {
  countryId: {
    type: DataTypes.INTEGER,
    unique: 'tt_unique_constraint',
  },
  rejectedId: {
    type: DataTypes.INTEGER,
    unique: 'tt_unique_constraint',
    references: null,
  },
  rejectedType: {
    type: DataTypes.STRING,
    unique: 'tt_unique_constraint',
  },
})

const Deported_Countries = sequelize.define('deported_countries', {
  countryId: {
    type: DataTypes.INTEGER,
    unique: 'tt_unique_constraint',
  },
  deportedId: {
    type: DataTypes.INTEGER,
    unique: 'tt_unique_constraint',
    references: null,
  },
  deportedType: {
    type: DataTypes.STRING,
    unique: 'tt_unique_constraint',
  },
})

const Visited_Countries = sequelize.define('visited_countries', {
  countryId: {
    type: DataTypes.INTEGER,
    unique: 'tt_unique_constraint',
  },
  visitedId: {
    type: DataTypes.INTEGER,
    unique: 'tt_unique_constraint',
    references: null,
  },
  visitedType: {
    type: DataTypes.STRING,
    unique: 'tt_unique_constraint',
  },
})

module.exports = {
  Country,
  Rejected_Countries,
  Deported_Countries,
  Visited_Countries,
}

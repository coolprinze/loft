const sequelize = require('../config/db.js')
const Sequelize = require('sequelize')
const bcrypt = require('bcryptjs')

const { DataTypes } = Sequelize

const User = sequelize.define('user', {
  fname: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  lname: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  isAdmin: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
    defaultValue: false,
  },
})

// userSchema.methods.matchPassword = async function (enteredPassword) {
//   return await bcrypt.compare(enteredPassword, this.password)
// }

User.beforeCreate(async (immigrant) => {
  const salt = await bcrypt.genSalt(10)
  immigrant.password = await bcrypt.hash(immigrant.password, salt)
})

User.beforeUpdate(async (immigrant) => {
  if (immigrant.password) {
    const salt = await bcrypt.genSalt(10)
    immigrant.password = await bcrypt.hash(immigrant.password, salt)
  }
})

User.prototype.matchPassword = async function (enteredPassword) {
  return await bcrypt.compare(enteredPassword, this.password)
}

module.exports = User

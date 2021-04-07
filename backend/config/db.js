const { Sequelize } = require('sequelize')
// import models from './models'

const sequelize = new Sequelize('loft_im', 'root', 'root', {
  host: 'localhost',
  dialect: 'mysql',
  dialectOptions: {
    charset: 'utf8',
    multipleStatements: true,
  },
  logging: false,
})

// const sequelize = new Sequelize(
//   "autoralc_loft_immi",
//   "autoralc_cybertech",
//   "ErSXxkih{Aj#",
//   {
//     host: "localhost",
//     dialect: "mysql",
//     dialectOptions: {
//       charset: "utf8",
//       multipleStatements: true,
//     },
//   }
// );

module.exports = sequelize

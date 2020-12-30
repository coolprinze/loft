const { Sequelize } = require('sequelize')
// import models from './models'

const sequelize = new Sequelize('loft_im', 'root', 'root', {
  host: 'localhost',
  dialect: 'mysql',
  dialectOptions: {
    charset: 'utf8',
    multipleStatements: true,
  },
})

// const sequelize = new Sequelize(
//   "sowstuma_app",
//   "sowstuma_cybertech",
//   "g]FL?)tNNlN2",
//   {
//     host: "localhost",
//     dialect: "mysql",
//     dialectOptions: {
//       charset: "utf8",
//       multipleStatements: true,
//     },
//     // logging: false,
//     models,
//   }
// );

module.exports = sequelize

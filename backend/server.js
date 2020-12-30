const { config } = require('dotenv')
const express = require('express')
const sequelize = require('./config/db.js')
const { mailer } = require('./config/mailer.js')
const { errorHandler, notFound } = require('./middleware/errorMiddleware.js')
const cors = require('cors')
const immigrantRoutes = require('./routes/immigrants.js')
// const Countries = require('./data/countries.js')
// const Country = require('./models/Country.js')
const Funds = require('./data/funds.js')
const utilityRoutes = require('./routes/Utilities.js')
const Fund = require('./models/Fund.js')

config()

const app = express()

// verify mailer connection configuration
mailer.verify(function (error, success) {
  if (error) console.log(error)
  else console.log('Server is ready to take our messages')
})

sequelize
  .authenticate()
  .then(() => console.log('Connection has been established successfully.'))
  .catch((error) => {
    console.error('Unable to connect to the database:', error)
  })

// sequelize
//   .sync({ force: true })
//   .then((res) => console.log(res))
//   .catch((err) => console.log(err))

// app.get('/create-countries', async (req, res) => {
//   Country.bulkCreate(
//     Countries.map((country) => ({
//       name: country.name,
//       desc: country.name,
//       code: country.code,
//       flag: country.flag,
//       slug: country.name
//         .toLowerCase()
//         .replace(/[^\w ]+/g, '')
//         .replace(/ +/g, '-'),
//     }))
//   )
//     .then((countries) => res.send(countries))
//     .catch((err) => res.send(err))
// })
// app.get('/create-funds', async (req, res) => {
//   Fund.bulkCreate(Funds)
//     .then((funds) => res.send(funds))
//     .catch((err) => res.send(err))
// })

app.use(express.json())

var corsOptions = {
  origin: [
    'http://localhost:3000',
    'https://loftimmigration.com',
    'http://127.0.0.1:3000',
  ],
  optionsSuccessStatus: 200,
}
app.get('/', (req, res) => res.send('API is running...'))
app.use('/api/utility', cors(corsOptions), utilityRoutes)
app.use('/api/immigrants', cors(corsOptions), immigrantRoutes)

app.use(notFound)

app.use(errorHandler)

const PORT = process.env.PORT || 5000

app.listen(
  PORT,
  console.log(`Server running in ${process.env.NODE_ENV} mode on port ${PORT}`)
)

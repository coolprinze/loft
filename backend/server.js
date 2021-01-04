const { config } = require('dotenv')
const express = require('express')
const sequelize = require('./config/db.js')
const { mailer } = require('./config/mailer.js')
const { errorHandler, notFound } = require('./middleware/errorMiddleware.js')
const cors = require('cors')
const immigrantRoutes = require('./routes/immigrants.js')
const utilityRoutes = require('./routes/Utilities.js')
const seederRoutes = require('./routes/seeders.js')

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
//   .sync({})
//   .then((res) => console.log(res))
//   .catch((err) => console.log(err))

app.use(express.json())

var corsOptions = {
  origin: [
    'http://localhost:3000',
    'https://loftimmigration.com',
    'http://127.0.0.1:3000',
  ],
  optionsSuccessStatus: 200,
}
app.get('/test', (req, res) => res.send('API is running...'))
app.get('/seed', seederRoutes)
app.use('/utilities', cors(corsOptions), utilityRoutes)
app.use('/immigrants', cors(corsOptions), immigrantRoutes)

app.use(notFound)

app.use(errorHandler)

const PORT = process.env.PORT || 5000

app.listen(
  PORT,
  console.log(`Server running in ${process.env.NODE_ENV} mode on port ${PORT}`)
)

const { config } = require('dotenv')
const express = require('express')
// const fs = require('fs')
// const path = require('path')
// const morgan = require('morgan')
const sequelize = require('./config/db.js')
const { mailer } = require('./config/mailer.js')
const { errorHandler, notFound } = require('./middleware/errorMiddleware.js')
const cors = require('cors')
const immigrantRoutes = require('./routes/immigrants.js')
const utilityRoutes = require('./routes/Utilities.js')
const seederRoutes = require('./routes/seeders.js')
const employerRoutes = require('./routes/employer.js')
const Job = require('./cronjobs.js')
const MailQueue = require('./models/MailQueue.js')
const { sendMail } = require('./mail')
const { Op } = require('sequelize')
const userRoutes = require('./routes/userRoutes.js')

config()

const app = express()

// // create a write stream (in append mode)
// var accessLogStream = fs.createWriteStream(
//   path.join(__dirname, 'logfile.log'),
//   {
//     flags: 'a',
//   }
// )

// // setup the logger
// app.use(morgan('combined', { stream: accessLogStream }))

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
//   .sync()
//   .then((res) => console.log(res))
//   .catch((err) => console.log(err))

const job = Job('*/30 * * * * *', async () => {
  const now = new Date(),
    mails = await MailQueue.findAll({
      where: { schedule: { [Op.lte]: now }, status: 'waiting' },
    })

  mails.forEach((mail) => {
    const {
      to,
      from_name: name,
      from_address: address,
      subject,
      message: html,
      schedule,
    } = mail
    sendMail({ to, from: { name, address }, subject, html }, (err, res) => {
      if (err) {
        mail.update({ status: err.message })
        console.log(`Failed to send 2nd mail to ${to} on: `, schedule)
      } else if (res.envelope) {
        mail.update({ status: 'sent' })
        console.log(`Sent 2nd mail to ${to} on: `, schedule)
      }
    })
  })
})
job.start()

app.use(express.json())

var corsOptions = {
  origin: [
    'http://localhost:3000',
    'http://localhost:3001',
    'http://localhost:3006',
    'https://loftimmigration.com',
    'http://127.0.0.1:3000',
    'http://192.168.88.23',
    'http://192.168.88.20:3000',
    'http://192.168.88.20:3006',
  ],
  optionsSuccessStatus: 200,
}
app.get('/test', (req, res) => {
  console.log('Api Running')
  res.send('API is running fine...')
})
app.use('/seeds', seederRoutes)
app.use('/users', cors(corsOptions), userRoutes)
app.use('/utilities', cors(corsOptions), utilityRoutes)
app.use('/immigrants', cors(corsOptions), immigrantRoutes)
app.use('/employers', cors(corsOptions), employerRoutes)

app.use(notFound)

app.use(errorHandler)

const PORT = process.env.PORT || 5000

app.listen(
  PORT,
  console.log(`Server running in ${process.env.NODE_ENV} mode on port ${PORT}`)
)

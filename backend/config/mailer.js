const nodemailer = require('nodemailer')

const mailer = nodemailer.createTransport({
  // sendmail: true,
  host: 'server116.web-hosting.com',
  port: 465,
  secure: true,
  auth: {
    user: 'immigrants@loftimmigration.com',
    pass: 'm1P5?*tw7gcT',
  },
  tls: {
    rejectUnauthorized: false,
  },
})

module.exports = { mailer }

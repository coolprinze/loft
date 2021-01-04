const asyncHandler = require('express-async-handler')
const sequelize = require('../config/db.js')
const {
  successEmailTemplate,
  reviewedEmailTemplate,
  sendMail,
} = require('../mail/index.js')
const AntiguaImmigrant = require('../models/AntiguaImmigrant.js')
const { throwErr } = require('../utils/errorUtils.js')

// @desc    Register a new immigrant
// @route   Post /api/immigrants
// @access  Public
const registerAntiguaImmigrant = asyncHandler(async (req, res) => {
  const data = req.body,
    { email, contact_medium, rejected_countries, deported_countries } = data
  if (data.contact_medium) data.contact_medium = contact_medium.toString()
  const immigrantExists = await AntiguaImmigrant.findOne({ where: { email } })
  if (immigrantExists) {
    res.status(400)
    throwErr('Duplicate request')
  }
  await sequelize.transaction(async (transaction) => {
    const immigrant = await AntiguaImmigrant.create(data, { transaction })
    if (rejected_countries.length)
      await immigrant.setRejectedCountries(rejected_countries, { transaction })
    if (deported_countries.length)
      await immigrant.setDeportedCountries(deported_countries, { transaction })

    if (immigrant) {
      sendMail(
        {
          to: email,
          from: {
            name: 'Loft Immigration | Antigua Assessment',
            address: 'immigrants@loftimmigration.com',
          },
          subject: 'Application Successful',
          html: successEmailTemplate(data),
        },
        (res) => console.log(res)
      )
      setTimeout(
        () =>
          sendMail(
            {
              to: email,
              from: {
                name: 'Loft Immigration | Antigua Assessment',
                address: 'immigrants@loftimmigration.com',
              },
              subject: 'Application Reviewed',
              html: reviewedEmailTemplate(data),
            },
            (res) => console.log(res)
          ),
        600000
      )
      res.status(201).json({
        success: true,
      })
    } else {
      res.status(400)

      throwErr('Invalid data')
    }
  })
})

module.exports = { registerAntiguaImmigrant }

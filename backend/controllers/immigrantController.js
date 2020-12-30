const asyncHandler = require('express-async-handler')
const sequelize = require('../config/db.js')
const { emailTemplate, sendMail } = require('../mail/index.js')
const AntiguaImmigrant = require('../models/AntiguaImmigrant.js')
const { throwErr } = require('../utils/errorUtils.js')

// @desc    Register a new immigrant
// @route   Post /api/immigrants
// @access  Public
const registerAntiguaImmigrant = asyncHandler(async (req, res) => {
  const data = req.body,
    { email, contact_medium } = data
  if (data.contact_medium) data.contact_medium = contact_medium.toString()
  const immigrantExists = await AntiguaImmigrant.findOne({ email })
  if (immigrantExists) {
    res.status(400)
    throwErr('Duplicate request')
  }
  await sequelize.transaction(async (transaction) => {
    const immigrant = await AntiguaImmigrant.create(data, { transaction })

    if (immigrant) {
      // sendMail(
      //   {
      //     to: email,
      //     from: {
      //       name: 'Loft Immigration | Antigua Assessment Form',
      //       address: 'immigrants@loftimmigration.com',
      //     },
      //     subject: 'New Antigua Applicant',
      //     html: emailTemplate(data),
      //   },
      //   (data) => console.log(data)
      // )
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

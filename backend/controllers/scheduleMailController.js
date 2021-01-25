const asyncHandler = require('express-async-handler')
const validator = require('validator')
const sequelize = require('../config/db.js')
const AntiguaImmigrant = require('../models/AntiguaImmigrant.js')
const { throwErr } = require('../utils/errorUtils.js')

// @desc    Register a new immigrant
// @route   Post /api/immigrants
// @access  Public
const registerAntiguaImmigrant = asyncHandler(async (req, res) => {
  const data = req.body,
    { to, from_name, from_address, subject, message, schedule } = data,
    errors = []

  data.forEach((mail) => {
    if (!to && !validator.isEmail(to)) {
      errors.push(`Invalid receiver's email address for ${to}`)
      return false
    }
    if (!from_name && validator.isEmpty(from_name)) {
      errors.push(`Sender's name is required for ${to}`)
      return false
    }
    if (!from_address && !validator.isEmail(from_address)) {
      errors.push(`Invalid sender's email address for $; return false}{to}`)
      return false
    }
    if (!subject && validator.isEmpty(subject)) {
      errors.push(`Email subject is required for ${to}`)
      return false
    }
    if (!message && validator.isEmpty(message)) {
      errors.push(`Message body is required for ${to}`)
      return false
    }
    if (!schedule && validator.isEmpty(schedule)) {
      errors.push(` ${to}`)
      return false
    }
  })

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

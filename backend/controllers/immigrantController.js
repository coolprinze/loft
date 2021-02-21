const asyncHandler = require('express-async-handler')
const { Op } = require('sequelize')
const sequelize = require('../config/db.js')
const {
  StkittsImmigrant,
  AntiguaImmigrant,
  BusinessImmigrant,
  EducationalHistory,
  Spouse,
} = require('../models/index.js')
const { throwErr } = require('../utils/errorUtils.js')

const registerImmigrant = asyncHandler(async (req, res) => {
  const Immigrant =
    req.params.type === 'antigua'
      ? AntiguaImmigrant
      : req.params.type === 'stkitts'
      ? StkittsImmigrant
      : throwErr('Invalid Url')
  const data = req.body,
    { email, contact_medium, rejected_countries, deported_countries } = data
  if (data.contact_medium) data.contact_medium = contact_medium.toString()
  const immigrantExists = await Immigrant.findOne({ where: { email } })
  if (immigrantExists) {
    res.status(400)
    throwErr('Duplicate request')
  }
  await sequelize.transaction(async (transaction) => {
    const immigrant = await Immigrant.create(data, { transaction })
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

const registerBusinessImmigrant = asyncHandler(async (req, res) => {
  const data = req.body,
    { email, phone } = data
  const immigrantExists = await BusinessImmigrant.findOne({
    where: {
      [Op.or]: [{ email }, { phone }],
    },
  })
  if (immigrantExists) {
    res.status(400)
    throwErr('Duplicate request')
  }
  await sequelize.transaction(async (transaction) => {
    const immigrant = await BusinessImmigrant.create(data, {
      include: [
        EducationalHistory,
        { model: Spouse, include: [EducationalHistory] },
      ],
      transaction,
    })

    if (immigrant) {
      res.status(201).json({
        success: true,
        immigrant,
      })
    } else {
      res.status(400)

      throwErr('Invalid data')
    }
  })
})

const getImmigrants = asyncHandler(async (req, res) => {
  const Immigrant =
    req.params.type === 'antigua'
      ? AntiguaImmigrant
      : req.params.type === 'stkitts'
      ? StkittsImmigrant
      : req.params.type === 'business'
      ? BusinessImmigrant
      : throwErr('Invalid Url')
  const immigrants = await Immigrant.findAll({
    include: { all: true, include: { all: true } },
  })

  res.send(immigrants)
})
module.exports = { registerImmigrant, getImmigrants, registerBusinessImmigrant }

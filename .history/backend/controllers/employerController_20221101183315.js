const expressAsyncHandler = require('express-async-handler')
const sequelize = require('../config/db.js')
const { CanadianEmployer, IntlTransfer } = require('../models')
const { throwErr } = require('../utils/errorUtils')

const registerCanadianEmployer = expressAsyncHandler(async (req, res) => {
  const data = req.body,
    { email, phone } = data

  const employerExists = await CanadianEmployer.findOne({
    where: [{ email }, { phone }],
  })
  if (employerExists) {
    res.status(400)
    throwErr('Duplicate request')
  }
  await sequelize.transaction(async (transaction) => {
    const employer = await CanadianEmployer.create(data, { transaction })

    if (employer) {
      res.status(201).json({
        success: true,
      })
    } else {
      res.status(400)

      throwErr('Invalid data')
    }
  })
})

const registerIntlTransfer = expressAsyncHandler(async (req, res) => {
  const data = req.body,
    { email, phone } = data

  const employerExists = await IntlTransfer.findOne({
    where: [{ email }, { phone }],
  })
  if (employerExists) {
    res.status(400)
    throwErr('Duplicate request')
  }
  await sequelize.transaction(async (transaction) => {
    const transfer = await IntlTransfer.create(data, { transaction })

    if (transfer) {
      res.status(201).json({
        success: true,
      })
    } else {
      res.status(400)

      throwErr('Invalid data')
    }
  })
})

module.exports = {
  registerCanadianEmployer,
  registerIntlTransfer,
}

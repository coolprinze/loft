const expressAsyncHandler = require('express-async-handler')
const { Op } = require('sequelize')
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

const getEmployers = expressAsyncHandler(async (req, res) => {
  ;(searchQuery = {}), (q = {}), (dateRange = {})

  if (Object.keys(req.query).length) {
    if (req.query._q) {
      let { _q } = req.query
      _q = _q.toLowerCase()
      q = {
        [Op.or]: [
          'employees_total',
          'employees_fulltime',
          'employees_parttime',
          'employees_needed',
          'positions',
          'situation',
          'business_activity',
          'location',
          'phone',
          'email',
          'website',
        ].map((_) => ({ [_]: { [Op.like]: `%${_q}%` } })),
      }
      delete req.query._q
    }

    if (req.query.startDate && req.query.endDate) {
      let { startDate, endDate } = req.query
      dateRange = {
        createdAt: {
          [Op.between]: [startDate, endDate],
        },
      }
    }
    const moreQuery = {}

    searchQuery = {
      where: {
        ...q,
        ...moreQuery,
        ...dateRange,
      },
    }
  }
  const employers = await CanadianEmployer.findAll({
    ...searchQuery,
    order: ['id'],
  })

  res.send(employers)
})

const getTransfers = expressAsyncHandler(async (req, res) => {
  ;(searchQuery = {}), (q = {}), (dateRange = {})

  if (Object.keys(req.query).length) {
    if (req.query._q) {
      let { _q } = req.query
      _q = _q.toLowerCase()
      q = {
        [Op.or]: [
          'employees_total',
          'employees_fulltime',
          'employees_parttime',
          'employees_needed',
          'positions',
          'situation',
          'business_activity',
          'location',
          'phone',
          'email',
          'website',
        ].map((_) => ({ [_]: { [Op.like]: `%${_q}%` } })),
      }
      delete req.query._q
    }

    if (req.query.startDate && req.query.endDate) {
      let { startDate, endDate } = req.query
      dateRange = {
        createdAt: {
          [Op.between]: [startDate, endDate],
        },
      }
    }
    const moreQuery = {}

    searchQuery = {
      where: {
        ...q,
        ...moreQuery,
        ...dateRange,
      },
    }
  }
  const employers = await CanadianEmployer.findAll({
    ...searchQuery,
    order: ['id'],
  })

  res.send(employers)
})

module.exports = {
  registerCanadianEmployer,
  registerIntlTransfer,
  getEmployers,
  getTransfers,
}

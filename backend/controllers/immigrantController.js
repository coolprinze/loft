const asyncHandler = require('express-async-handler')
const { Op } = require('sequelize')
const sequelize = require('../config/db.js')
const {
  StkittsImmigrant,
  AntiguaImmigrant,
  BusinessImmigrant,
  Qualification,
  Spouse,
  GeneralImmigrant,
  Experience,
  LanguageProficiency
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
      include: [Qualification, { model: Spouse, include: [Qualification] }],
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

const registerGeneralImmigrant = asyncHandler(async (req, res) => {
  const data = req.body,
    { email, phone } = data
  const immigrantExists = await GeneralImmigrant.findOne({
    where: {
      [Op.or]: [{ email }, { phone }],
    },
  })
  if (immigrantExists) {
    res.status(400)
    throwErr('Duplicate request')
  }
  await sequelize.transaction(async (transaction) => {
    const immigrant = await GeneralImmigrant.create(data, {
      include: [
        Qualification, 
        Experience, 
        LanguageProficiency,
        { 
          model: Spouse, 
          include: [
            Qualification, 
            Experience, 
            LanguageProficiency
          ] 
        }
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
  const { type } = req.params
  let Immigrant,
    searchQuery = {},
    q = {},
    dateRange = {}
  validSearchParam = []
  if (type === 'antigua') Immigrant = AntiguaImmigrant
  else if (type === 'stkitts') Immigrant = StkittsImmigrant
  else if (type === 'businesses') {
    Immigrant = BusinessImmigrant
    validSearchParam = [
      'first_name',
      'last_name',
      'email',
      'phone',
      'dob',
      'managerial_experience',
      'group',
      'eligible_party',
      'invest_funds',
    ]
  } else if (type === 'generals') {
    Immigrant = GeneralImmigrant
    validSearchParam = [
      'first_name',
      'last_name',
      'email',
      'phone',
      'dob',
      'group',
      'eligible_party',
    ]
  } else throwErr('Invalid Url')

  if (Object.keys(req.query).length) {
    if (req.query._q) {
      let { _q } = req.query
      _q = _q.toLowerCase()
      q = {
        [Op.or]: [
          { first_name: { [Op.like]: `%${_q}%` } },
          { last_name: { [Op.like]: `%${_q}%` } },
          { email: { [Op.like]: `%${_q}%` } },
          { phone: { [Op.like]: `%${_q}%` } },
          { eligible_party: { [Op.like]: `%${_q}%` } },
          { group: { [Op.like]: `%${_q.replace('group', '').trim()}%` } },
        ],
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

    for (const [key, value] of Object.entries(req.query)) {
      if (validSearchParam.includes(key))
        moreQuery[key] = { [Op.like]: `%${value}%` }
    }
    
    searchQuery = {
      where: {
        ...q,
        ...moreQuery,
        ...dateRange,
      },
    }
  }
  const immigrants = await Immigrant.findAll({
    ...searchQuery,
    include: { all: true, include: { all: true } },
  })

  res.send(immigrants)
})
module.exports = { registerImmigrant, getImmigrants, registerBusinessImmigrant, registerGeneralImmigrant }

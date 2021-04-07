const { Router } = require('express')
const { getFundRanges } = require('../controllers/utilityController')
const { Country, Degree, Occupation, Language, Fund } = require('../models')
const { getAll } = require('./Common')
const utilityRouter = Router()

// @route   GET api/Skills/test
// @desc    Tests Skills route
// @access  Public
utilityRouter.get('/', async (req, res) => {

  const countries = await Country.findAll();
  const degrees = await Degree.findAll();
  const occupations = await Occupation.findAll();
  const languages = await Language.findAll();
  const worthRanges = await Fund.findAll({ where: { type: 'worth' } })
  const investRanges = await Fund.findAll({ where: { type: 'invest' } })

  res.send({countries, degrees, occupations, languages, worthRanges, investRanges})
})

// @route   Get api/utilities/countries
// @desc    Get Countries
// @access  Public
getAll('/countries', {}, Country, utilityRouter)

// @route   Get api/utilities/degrees
// @desc    Get Degree
// @access  Public
getAll('/degrees', {}, Degree, utilityRouter)

// @route   Get api/utilities/occupations
// @desc    Get Occupation
// @access  Public
getAll('/occupations', {}, Occupation, utilityRouter)

// @route   Get api/utilities/languages
// @desc    Get Language
// @access  Public
getAll('/languages', {}, Language, utilityRouter)

// @route   Get api/utilities/funds/:type
// @desc    Get Countries
// @access  Public
utilityRouter.get('/funds/:type', getFundRanges)

module.exports = utilityRouter

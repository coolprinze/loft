const { Router } = require('express')
const { getFundRanges } = require('../controllers/utilityController')
const Country = require('../models/Country')
const { getAll } = require('./Common')
const utilityRouter = Router()

// @route   GET api/Skills/test
// @desc    Tests Skills route
// @access  Public
utilityRouter.get('/', (req, res) => res.json({ msg: 'Utility Works' }))

// @route   Get api/utilities/countries
// @desc    Get Countries
// @access  Public
getAll('/countries', {}, Country, utilityRouter)

// @route   Get api/utilities/funds/:type
// @desc    Get Countries
// @access  Public
utilityRouter.get('/funds/:type', getFundRanges)

module.exports = utilityRouter

const asyncHandler = require('express-async-handler')
const Fund = require('../models/Fund.js')

const getFundRanges = asyncHandler(async (req, res) => {
  const type = req.params.type
  const funds = await Fund.findAll({ where: { type } })

  res.json(funds)
})

module.exports = { getFundRanges }

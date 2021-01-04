const asyncHandler = require('express-async-handler')
const Countries = require('../data/countries')
const Funds = require('../data/funds')
const Country = require('../models/Country')
const Fund = require('../models/Fund')

const createSeedData = asyncHandler(async (req, res) => {
  const countries = await Country.bulkCreate(
      Countries.map((country) => ({
        name: country.name,
        desc: country.name,
        code: country.code,
        flag: country.flag,
        slug: country.name
          .toLowerCase()
          .replace(/[^\w ]+/g, '')
          .replace(/ +/g, '-'),
      }))
    ),
    funds = await Fund.bulkCreate(Funds)

  res.json({ countries, funds })
})

module.exports = createSeedData

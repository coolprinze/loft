const asyncHandler = require('express-async-handler')
const Countries = require('../data/countries')
const Funds = require('../data/funds')
const Occupations = require('../data/occupations')
const { Occupation, Country, Fund } = require('../models')
const User = require('../models/User')

const createSeedData = asyncHandler(async (req, res) => {
  const // countries = await Country.bulkCreate(
    //   Countries.map((country) => ({
    //     name: country.name,
    //     desc: country.name,
    //     code: country.code,
    //     flag: country.flag,
    //     slug: country.name
    //       .toLowerCase()
    //       .replace(/[^\w ]+/g, '')
    //       .replace(/ +/g, '-'),
    //   }))
    // ),
    // funds = await Fund.bulkCreate(Funds),
    occupations = await Occupation.bulkCreate(
      Occupations.map((occupation) => ({
        name: occupation.toUpperCase(),
        slug: occupation
          .toLowerCase()
          .replace(/[^\w ]+/g, '')
          .replace(/ +/g, '-'),
      }))
    )
    // admin = await User.create({
    //   email: 'info@cybertechdigitals.com',
    //   password: 'cool1106',
    //   fname: 'Cybertech',
    //   lname: 'Digitals',
    //   isAdmin: true,
    // })

  res.json({ occupations })
})

module.exports = createSeedData

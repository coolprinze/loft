const { Router } = require('express')
const createSeedData = require('../controllers/seederController')

const seederRoutes = Router()

seederRoutes.get('/', createSeedData)

module.exports = seederRoutes

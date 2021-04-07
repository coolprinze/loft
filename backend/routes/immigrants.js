const { Router } = require('express')
const {
  registerImmigrant,
  getImmigrants,
  registerBusinessImmigrant,
  registerGeneralImmigrant,
} = require('../controllers/immigrantController')
const { protect, adminProtect } = require('../middleware/authMiddleware')

const immigrantRoutes = Router()

immigrantRoutes.get('/', (req, res) => res.json('Immigrant routes working '))
immigrantRoutes.route('/businesses').post(registerBusinessImmigrant)
immigrantRoutes.route('/generals').post(registerGeneralImmigrant)

immigrantRoutes
  .route('/:type')
  .post(registerImmigrant)
  .get(protect, adminProtect, getImmigrants)

module.exports = immigrantRoutes

const { Router } = require('express')
const {
  registerImmigrant,
  getImmigrants,
  registerBusinessImmigrant,
  registerGeneralImmigrant,
  updateBusinessImmigrant,
  updateGeneralImmigrant
} = require('../controllers/immigrantController')
const { protect, adminProtect } = require('../middleware/authMiddleware')

const immigrantRoutes = Router()

immigrantRoutes.get('/', (req, res) => res.json('Immigrant routes working '))

immigrantRoutes.route('/businesses').post(registerBusinessImmigrant)
immigrantRoutes.route('/businesses/:id')
  .patch(protect, adminProtect, updateBusinessImmigrant)
  // .delete(protect, adminProtect, deleteBusinessImmigrant)

immigrantRoutes.route('/generals').post(registerGeneralImmigrant)
immigrantRoutes.route('/generals/:id')
  .patch(protect, adminProtect, updateGeneralImmigrant)
  // .delete(protect, adminProtect, deleteGeneralImmigrant)

immigrantRoutes
  .route('/:type')
  .post(registerImmigrant)
  .get(protect, adminProtect, getImmigrants)

module.exports = immigrantRoutes

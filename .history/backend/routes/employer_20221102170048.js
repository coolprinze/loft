const { Router } = require('express')
const {
  registerCanadianEmployer,
  registerIntlTransfer,
  getEmployers,
  getTransfers,
} = require('../controllers/employerController')

const { protect, adminProtect } = require('../middleware/authMiddleware')

const employerRoutes = Router()

employerRoutes.get('/', (req, res) => res.json('employer routes working '))

employerRoutes
  .route('/canadian-employers')
  .post(registerCanadianEmployer)
  .get(protect, adminProtect, getEmployers)

employerRoutes
  .route('/intl-transfer')
  .post(registerIntlTransfer)
  .get(protect, adminProtect, getTransfers)

module.exports = employerRoutes

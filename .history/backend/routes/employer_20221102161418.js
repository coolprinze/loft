const { Router } = require('express')
const {
  registerCanadianEmployer,
  registerIntlTransfer,
  getEmployers,
} = require('../controllers/employerController')

const { protect, adminProtect } = require('../middleware/authMiddleware')

const employerRoutes = Router()

employerRoutes.get('/', (req, res) => res.json('employer routes working '))

employerRoutes
  .route('/canadian-employers')
  .post(registerCanadianEmployer)
  .get(protect, adminProtect, getEmployers)
// employerRoutes.route('/canadian-employers/:id')
//   .patch(protect, adminProtect, updateBusinessemployer)
// .delete(protect, adminProtect, deleteBusinessemployer)

employerRoutes.route('/intl-transfer').post(registerIntlTransfer)
// employerRoutes.route('/intl-transfer/:id')
//   .patch(protect, adminProtect, updateBusinessemployer)
// .delete(protect, adminProtect, deleteBusinessemployer)

// employerRoutes.route('/employers').get(protect, adminProtect, getemployers)

module.exports = employerRoutes

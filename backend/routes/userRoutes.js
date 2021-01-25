const express = require('express')
const userRoutes = express.Router()
const {
  authUser,
  getUserProfile,
  registerUser,
  updateUserProfile,
} = require('../controllers/userController.js')
const { protect } = require('../middleware/authMiddleware.js')

userRoutes.route('/').post(registerUser)
userRoutes.post('/login', authUser)
userRoutes
  .route('/profile')
  .get(protect, getUserProfile)
  .put(protect, updateUserProfile)

module.exports = userRoutes

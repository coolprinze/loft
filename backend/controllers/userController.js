const asyncHandler = require('express-async-handler')
const generateToken = require('../utils/generateToken.js')
const { throwErr } = require('../utils/errorUtils.js')
const User = require('../models/User.js')

// @desc    Auth user & get token
// @route   Post /api/users/login
// @access  Public
const authUser = asyncHandler(async (req, res) => {
  const { email, password } = req.body
  const user = await User.findOne({ email })
  if (user && (await user.matchPassword(password)))
    res.json({
      id: user.id,
      fname: user.fname,
      lname: user.lname,
      email: user.email,
      isAdmin: user.isAdmin,
      token: generateToken(user.id),
    })
  else {
    res.status(401)
    throwErr('Invalid email or password')
  }
})

// @desc    GET user profile
// @route   GET /api/users/profile
// @access  Private
const getUserProfile = asyncHandler(async (req, res) => {
  const user = await User.findById(req.user._id)
  if (user)
    res.json({
      _id: user._id,
      fname: user.fname,
      lname: user.lname,
      email: user.email,
      isAdmin: user.isAdmin,
    })
  else {
    res.status(404)
    throwErr('User not found')
  }
})

// @desc    Register a new user
// @route   Post /api/users
// @access  Public
const registerUser = asyncHandler(async (req, res) => {
  const { email, password, fname, lname } = req.body
  const userExists = await User.findOne({ email })
  if (userExists) {
    res.status(400)
    throwErr('User already exists')
  }

  const user = await User.create({ email, password, fname, lname })

  if (user)
    res.status(201).json({
      id: user.id,
      fname: user.fname,
      lname: user.lname,
      email: user.email,
      isAdmin: user.isAdmin,
      token: generateToken(user.id),
    })
  else {
    res.status(400)

    throwErr('Invalid user data')
  }
})

// @desc    Update user profile
// @route   PUT /api/users/profile
// @access  Private
const updateUserProfile = asyncHandler(async (req, res) => {
  const user = await User.findById(req.user._id)
  if (user) {
    user.fname = req.body.fname || user.fname
    user.lname = req.body.lname || user.lname
    user.email = req.body.email || user.email
    if (req.body.password) user.password = req.body.password

    const updatedUser = await user.save()

    res.json({
      _id: updatedUser._id,
      fname: updatedUser.fname,
      lname: updatedUser.lname,
      email: updatedUser.email,
      isAdmin: updatedUser.isAdmin,
    })
  } else {
    res.status(404)
    throwErr('User not found')
  }
})

module.exports = { authUser, getUserProfile, registerUser, updateUserProfile }

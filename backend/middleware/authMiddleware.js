const expressAsyncHandler = require('express-async-handler')
const jwt = require('jsonwebtoken')
const { JWT_SECRET } = require('../config')
const User = require('../models/User')

const protect = expressAsyncHandler(async (req, res, next) => {
  let token

  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith('Bearer')
  ) {
    try {
      token = req.headers.authorization.split(' ')[1]
      const decoded = jwt.verify(token, JWT_SECRET)
      console.log(decoded)
      req.user = await User.findByPk(decoded.id)
    } catch (err) {
      console.error(err)
      res.status(401)
      throw new Error('Not authorized, token failed')
    }
  }
  if (!token) {
    res.status(401)
    throw new Error('Not authorized, no token')
  }

  next()
})

const adminProtect = (req, res, next) => {
  req.user.isAdmin
    ? next()
    : res.status(401).send({
        message: 'Unauthorised Access',
      })
}

module.exports = { protect, adminProtect }

const jwt = require('jsonwebtoken')

const titleCase = (str) => {
  var splitStr = str.toLowerCase().split(' ')
  for (var i = 0; i < splitStr.length; i++) {
    // You do not need to check if i is larger than splitStr length, as your for does that for you
    // Assign it back to the array
    splitStr[i] = splitStr[i].charAt(0).toUpperCase() + splitStr[i].substring(1)
  }
  // Directly return the joined string
  return splitStr.join(' ')
}

const generatePassword = (length) => {
  let result = ''
  let characters =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
  let charactersLength = characters.length
  for (let i = 0; i < length; i++) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength))
  }
  return result
}

const cleanFilename = (text) =>
  `${text
    .split('.')[0]
    .toLowerCase()
    .replace(/[^\w ]+/g, '')
    .replace(/ +/g, '-')}.${text.split('.').pop()}`

const generateToken = (data) => {
  return jwt.sign(data, process.env.JWT_SECRET || 'enjk3enrio24;hruy4j45pot;', {
    expiresIn: '30d',
  })
}

const _calculateAge = (birthday) => {
  var ageDifMs = Date.now() - birthday.getTime()
  var ageDate = new Date(ageDifMs) // miliseconds from epoch
  return Math.abs(ageDate.getUTCFullYear() - 1970)
}

module.exports = {
  titleCase,
  generatePassword,
  cleanFilename,
  generateToken,
  _calculateAge,
}

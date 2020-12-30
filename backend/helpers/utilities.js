import * as jwt from 'jsonwebtoken'

export const titleCase = (str: string) => {
  var splitStr = str.toLowerCase().split(' ')
  for (var i = 0; i < splitStr.length; i++) {
    // You do not need to check if i is larger than splitStr length, as your for does that for you
    // Assign it back to the array
    splitStr[i] = splitStr[i].charAt(0).toUpperCase() + splitStr[i].substring(1)
  }
  // Directly return the joined string
  return splitStr.join(' ')
}

export const generatePassword = (length: number) => {
  let result = ''
  let characters =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
  let charactersLength = characters.length
  for (let i = 0; i < length; i++) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength))
  }
  return result
}

export const cleanFilename = (text: string) =>
  `${text
    .split('.')[0]
    .toLowerCase()
    .replace(/[^\w ]+/g, '')
    .replace(/ +/g, '-')}.${text.split('.').pop()}`

export const generateToken = (data: any) => {
  return jwt.sign(data, process.env.JWT_SECRET || 'enjk3enrio24;hruy4j45pot;', {
    expiresIn: '30d',
  })
}

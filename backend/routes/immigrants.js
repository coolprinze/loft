const { Router } = require('express')
const {
  registerAntiguaImmigrant,
} = require('../controllers/immigrantController')

const immigrantRoutes = Router()

immigrantRoutes.get('/', (req, res) => res.json('Immigrant routes working '))
immigrantRoutes.post('/antigua', registerAntiguaImmigrant)

module.exports = immigrantRoutes

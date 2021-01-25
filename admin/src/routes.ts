import Antigua from './pages/Antigua'
import Stkitts from './pages/Stkitts'

var routes = [
  {
    path: '/antigua',
    name: 'All Antigua',
    component: Antigua,
  },
  {
    path: '/stkitts',
    name: 'All St. Kitts',
    component: Stkitts,
  },

  {
    path: '/',
    name: 'All Antigua',
    component: Antigua,
  },
]

export default routes

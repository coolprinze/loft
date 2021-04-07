import Antigua from './pages/Antigua'
import Business from './pages/Business'
import General from './pages/General'
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
    path: '/businesses',
    name: 'All Business Immigrants',
    component: Business,
  },
  {
    path: '/generals',
    name: 'All General Immigrants',
    component: General,
  },

  {
    path: '/',
    name: 'All Antigua',
    component: Antigua,
  },
]

export default routes

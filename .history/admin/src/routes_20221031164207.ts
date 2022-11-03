import Antigua from './pages/Antigua'
import Business from './pages/Business'
import General from './pages/General'
import Stkitts from './pages/Stkitts'

var routes = [
  {
    path: `${process.env.PUBLIC_URL}/antigua`,
    name: 'All Antigua',
    component: Antigua,
  },
  {
    path: `${process.env.PUBLIC_URL}/stkitts`,
    name: 'All St. Kitts',
    component: Stkitts,
  },
  {
    path: `${process.env.PUBLIC_URL}/businesses`,
    name: 'All Business Immigrants',
    component: Business,
  },
  {
    path: `${process.env.PUBLIC_URL}/business/:id`,
    name: 'All Business',
    component: Business,
  },
  // {
  //   path: `${process.env.PUBLIC_URL}/business/leads`,
  //   name: 'All Business Leads',
  //   component: Business,
  // },
  {
    path: `${process.env.PUBLIC_URL}/generals`,
    name: 'All General Immigrants',
    component: General,
  },
  {
    path: `${process.env.PUBLIC_URL}/general/:id`,
    name: 'All General',
    component: General,
  },
  // {
  //   path: `${process.env.PUBLIC_URL}/general/leads`,
  //   name: 'All General Leads',
  //   component: General,
  // },

  {
    path: `${process.env.PUBLIC_URL}/`,
    name: 'All Business Leads',
    component: Business,
  },
]

export default routes

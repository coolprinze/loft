import Antigua from './pages/Antigua'
import Business from './pages/Business'
import CanadianEmployer from './pages/CanadianEmployer'
import General from './pages/General'
import IntlTransfer from './pages/IntlTransfer'
import Stkitts from './pages/Stkitts'

var routes = [
  {
    path: `${process.env.PUBLIC_URL}/antigua`,
    name: 'All Antigua',
    element: Antigua,
  },
  {
    path: `${process.env.PUBLIC_URL}/stkitts`,
    name: 'All St. Kitts',
    element: Stkitts,
  },
  {
    path: `${process.env.PUBLIC_URL}/businesses`,
    name: 'All Business Immigrants',
    element: Business,
  },
  {
    path: `${process.env.PUBLIC_URL}/business/:id`,
    name: 'All Business',
    element: Business,
  },
  // {
  //   path: `${process.env.PUBLIC_URL}/business/leads`,
  //   name: 'All Business Leads',
  //   element: Business,
  // },
  {
    path: `${process.env.PUBLIC_URL}/generals`,
    name: 'All General Immigrants',
    element: General,
  },
  {
    path: `${process.env.PUBLIC_URL}/general/:id`,
    name: 'All General',
    element: General,
  },
  // {
  //   path: `${process.env.PUBLIC_URL}/general/leads`,
  //   name: 'All General Leads',
  //   element: General,
  // },

  {
    path: `${process.env.PUBLIC_URL}/canadian-employers`,
    name: 'All Canadian Employers Leads',
    element: CanadianEmployer,
  },
  {
    path: `${process.env.PUBLIC_URL}/intl-transfer`,
    name: 'All Intl Transfer Leads',
    element: IntlTransfer,
  },
  {
    path: `${process.env.PUBLIC_URL}/`,
    name: 'All Business Leads',
    element: Business,
  },
]

export default routes

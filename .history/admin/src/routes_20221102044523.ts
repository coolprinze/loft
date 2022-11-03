import { createBrowserRouter } from 'react-router-dom'
import Antigua from './pages/Antigua'
import Business from './pages/Business'
import General from './pages/General'
import Stkitts from './pages/Stkitts'

var routes = createBrowserRouter([
  {
    path: `${process.env.PUBLIC_URL}/antigua`,
    name: 'All Antigua',
    element: <Antigua />,
  },
  {
    path: `${process.env.PUBLIC_URL}/stkitts`,
    name: 'All St. Kitts',
    element: <Stkitts />,
  },
  {
    path: `${process.env.PUBLIC_URL}/businesses`,
    name: 'All Business Immigrants',
    element: <Business />,
  },
  {
    path: `${process.env.PUBLIC_URL}/business/:id`,
    name: 'All Business',
    element: <Business />,
  },
  // {
  //   path: `${process.env.PUBLIC_URL}/business/leads`,
  //   name: 'All Business Leads',
  //   element: <Business />,
  // },
  {
    path: `${process.env.PUBLIC_URL}/generals`,
    name: 'All General Immigrants',
    element: <General />,
  },
  {
    path: `${process.env.PUBLIC_URL}/general/:id`,
    name: 'All General',
    element: <General />,
  },
  // {
  //   path: `${process.env.PUBLIC_URL}/general/leads`,
  //   name: 'All General Leads',
  //   element: <General />,
  // },

  {
    path: `${process.env.PUBLIC_URL}/`,
    name: 'All Business Leads',
    element: <Business />,
  },
])

export default routes

import { connect } from 'react-redux'
import { createBrowserRouter, Navigate, RouterProvider } from 'react-router-dom'
import { ToastContainer } from 'react-toastify'
import 'react-toastify/dist/ReactToastify.css'
import userType from './interface/user'
import AdminLayout from './layouts/AdminLayout'
import Auth from './pages/Auth'
import routes from './routes'

function App({ user }: { user?: userType }) {
  const ProtectedRoute: any = ({ children }: any) =>
    !user ? <Navigate to={'/login'} /> : children
  const router = createBrowserRouter([
    {
      path: process.env.PUBLIC_URL,
      element: (
        <ProtectedRoute>
          <AdminLayout logOut={() => {}} />
        </ProtectedRoute>
      ),
      children: routes.map((_) => ({
        path: _.path,
        //@ts-ignore
        element: <_.element />,
      })),
    },
    {
      path: '/login',
      //@ts-ignore
      element: <Auth />,
    },
  ])

  // const
  // initFunc = async () => {
  //     setLoading(true)
  //     try {
  //       const res1 = await getCountries()
  //       // const res2 = await getFundRanges('worth')
  //       const res3 = await getFundRanges('invest')
  //       // setCountries(res1.data)
  //       // setInvestRanges(res3.data)
  //     } catch (err) {
  //       //@ts-ignore
  //       errHandler(err?.response?.data, toast)
  //     }
  //     setLoading(false)
  //   }
  return (
    <>
      <ToastContainer
        autoClose={8000}
        draggable
        enableMultiContainer
        containerId={'A'}
        position={'top-right'}
      />
      <ToastContainer
        autoClose={8000}
        draggable
        enableMultiContainer
        containerId={'B'}
        position={'bottom-left'}
      />
      <ToastContainer autoClose={8000} draggable />

      <RouterProvider router={router} />
    </>
  )
}

const mapStateToProps = ({ auth }: any) => ({
  ...auth,
})

export default connect(mapStateToProps)(App)

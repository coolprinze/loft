import { createBrowserRouter, Navigate, RouterProvider } from 'react-router-dom'
import { ToastContainer } from 'react-toastify'
import 'react-toastify/dist/ReactToastify.css'
import AdminLayout from './layouts/AdminLayout'
import Auth from './pages/Auth'
import routes from './routes'

function App() {
  const ProtectedRoute: any = ({ children }: any) =>
    !true ? <Navigate to={'/login'} /> : children
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

export default App

import React, { Component } from 'react'
import { Provider } from 'react-redux'
import { BrowserRouter, createBrowserRouter, Navigate } from 'react-router-dom'
import { ToastContainer } from 'react-toastify'
import 'react-toastify/dist/ReactToastify.css'
import AdminLayout from './layouts/AdminLayout'
import Auth from './pages/Auth'
import routes from './routes'
import store from './store'

function App() {
  const ProtectedRoute: any = ({ children }: any) =>
    !true ? <Navigate to={'/login'} /> : children
  const _routes = createBrowserRouter([
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
  ])
  return (
    <Provider store={store}>
      <BrowserRouter>
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
        {
          //@ts-ignore
          <Auth />
        }
      </BrowserRouter>
    </Provider>
  )
}

export default App

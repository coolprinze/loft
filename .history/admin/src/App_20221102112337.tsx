import React, { Component } from 'react'
import { Provider } from 'react-redux'
import { BrowserRouter } from 'react-router-dom'
import { ToastContainer } from 'react-toastify'
import 'react-toastify/dist/ReactToastify.css'
import Auth from './pages/Auth'
import store from './store'

function App() {
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

import React, { StrictMode, useEffect, useState } from 'react'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import { toast, ToastContainer } from 'react-toastify'
import 'react-toastify/dist/ReactToastify.css'
import { getUtilities } from './actions/Utilites'
import './App.css'
import Loading from './components/Loading'
import { fundsAction } from './helper'
import { errHandler } from './helper/errorHandler'
import Business2 from './pages/Business2'
import CanadianEmployer from './pages/CanadianEmployer'
import Family from './pages/Family'
import General from './pages/General2'
import IntlEmployer from './pages/IntlEmployer'
import StKitts from './pages/StKitts'
import Study from './pages/Study'

function App() {
  const [loading, setLoading] = useState(false)
  const [
    { countries, worthRanges, investRanges, occupations, degrees, languages },
    setUtilities,
  ] = useState({
    countries: [],
    worthRanges: [],
    investRanges: [],
    occupations: [],
    degrees: [],
    languages: [],
  })

  const initFunc = async () => {
    setLoading(true)
    try {
      const res = await getUtilities()

      setUtilities(res.data)

      setLoading(false)
    } catch (err) {
      setLoading(false)
      errHandler(err, toast)
    }
  }

  useEffect(() => {
    initFunc()
  }, [])

  const router = createBrowserRouter([
    {
      path: `${process.env.PUBLIC_URL}/canadian-employer`,
      element: <CanadianEmployer />,
    },
    {
      path: `${process.env.PUBLIC_URL}/intl-company-transfer`,
      element: <IntlEmployer />,
    },
    {
      path: `${process.env.PUBLIC_URL}/stkitts`,
      element: (
        <StKitts
          countries={countries.map((country: { name: string; id: number }) => ({
            name: country.name,
            value: country.id,
          }))}
          worthRanges={fundsAction(worthRanges)}
          investRanges={fundsAction(investRanges)}
        />
      ),
    },
    {
      path: `${process.env.PUBLIC_URL}/business-immigration`,
      element: (
        <Business2
          countries={countries.map((country: { name: string; id: number }) => ({
            name: country.name,
            value: country.id,
          }))}
          degrees={degrees.map((degree: { title: string; id: number }) => ({
            name: degree.title,
            value: degree.id,
          }))}
          worthRanges={fundsAction(worthRanges)}
          investRanges={fundsAction(investRanges)}
        />
      ),
    },
    {
      path: `${process.env.PUBLIC_URL}/general`,
      element: (
        <General
          countries={countries.map((country: { name: string; id: number }) => ({
            name: country.name,
            value: country.id,
          }))}
          languages={languages.map(
            (language: { name: string; id: number }) => ({
              name: language.name,
              value: language.id,
            })
          )}
          degrees={degrees.map((degree: { title: string; id: number }) => ({
            name: degree.title,
            value: degree.id,
          }))}
          occupations={occupations.map(
            (occupation: { name: string; id: number }) => ({
              name: occupation.name,
              value: occupation.id,
            })
          )}
        />
      ),
    },
    {
      path: `${process.env.PUBLIC_URL}/family-sponsorship`,
      element: <Family />,
    },
    {
      path: `${process.env.PUBLIC_URL}/study-visa`,
      element: <Study />,
    },
    {
      path: process.env.PUBLIC_URL,
      element: (
        <General
          countries={countries.map((country: { name: string; id: number }) => ({
            name: country.name,
            value: country.id,
          }))}
          languages={languages.map(
            (language: { name: string; id: number }) => ({
              name: language.name,
              value: language.id,
            })
          )}
          degrees={degrees.map((degree: { title: string; id: number }) => ({
            name: degree.title,
            value: degree.id,
          }))}
          occupations={occupations.map(
            (occupation: { name: string; id: number }) => ({
              name: occupation.name,
              value: occupation.id,
            })
          )}
        />
      ),
    },
  ])

  return (
    <StrictMode>
      <ToastContainer
        autoClose={8000}
        draggable
        position={toast.POSITION.BOTTOM_LEFT}
      />
      <Loading show={loading} />

      <RouterProvider router={router} />
    </StrictMode>
  )
}

export default App

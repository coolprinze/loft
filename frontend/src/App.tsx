import React, { useEffect, useState } from 'react'
import { BrowserRouter, Route, Switch } from 'react-router-dom'
import { toast, ToastContainer } from 'react-toastify'
import 'react-toastify/dist/ReactToastify.css'
import {getUtilities} from './actions/Utilites'
import './App.css'
import Loading from './components/Loading'
import { fundsAction } from './helper'
import { errHandler } from './helper/errorHandler'
import Antigua from './pages/Antigua'
import Business2 from './pages/Business2'
import Family from './pages/Family'
import General from './pages/General2'
import StKitts from './pages/StKitts'
import Study from './pages/Study'

function App() {
  const [loading, setLoading] = useState(false)
  const [
    {
      countries, 
      worthRanges,
      investRanges,
      occupations,
      degrees,
      languages
    }, 
    setUtilities
  ] = useState({
    countries: [], 
    worthRanges: [],
    investRanges: [],
    occupations: [],
    degrees: [],
    languages: []
  })

  const initFunc = async () => {
    setLoading(true)
    try {
      const res = await getUtilities()

      setUtilities(res.data)

      setLoading(false)
    } catch (err) {
      setLoading(false)
      errHandler(err?.response?.data, toast)
    }
  }

  useEffect(() => {
    initFunc()
  }, [])
  return (
    <>
      <ToastContainer
        autoClose={8000}
        draggable
        position={toast.POSITION.BOTTOM_LEFT}
      />
      <BrowserRouter>
        <Loading show={loading} />
        <Switch>
          <Route
            path={`${process.env.PUBLIC_URL}/antigua`}
            component={() => (
              <Antigua
                countries={countries.map(
                  (country: { name: string; id: number }) => ({
                    name: country.name,
                    value: country.id,
                  })
                )}
                worthRanges={fundsAction(worthRanges)}
                investRanges={fundsAction(investRanges)}
              />
            )}
          />
          <Route
            path={`${process.env.PUBLIC_URL}/stkitts`}
            component={() => (
              <StKitts
                countries={countries.map(
                  (country: { name: string; id: number }) => ({
                    name: country.name,
                    value: country.id,
                  })
                )}
                worthRanges={fundsAction(worthRanges)}
                investRanges={fundsAction(investRanges)}
              />
            )}
          />
          {/* <Route
            path={`${process.env.PUBLIC_URL}/general`}
            component={General}
          /> */}
          <Route
            path={`${process.env.PUBLIC_URL}/business-immigration`}
            component={() => (
              <Business2
                countries={countries.map(
                  (country: { name: string; id: number }) => ({
                    name: country.name,
                    value: country.id,
                  })
                )}
                degrees={degrees.map(
                  (degree: { title: string; id: number }) => ({
                    name: degree.title,
                    value: degree.id,
                  })
                )}
                worthRanges={fundsAction(worthRanges)}
                investRanges={fundsAction(investRanges)}
              />
            )}
          />
          <Route
            path={`${process.env.PUBLIC_URL}/general`}
            component={() => (
              <General
                countries={countries.map(
                  (country: { name: string; id: number }) => ({
                    name: country.name,
                    value: country.id,
                  })
                )}
                languages={languages.map(
                  (language: { name: string; id: number }) => ({
                    name: language.name,
                    value: language.id,
                  })
                )}
                degrees={degrees.map(
                  (degree: { title: string; id: number }) => ({
                    name: degree.title,
                    value: degree.id,
                  })
                )}
                occupations={occupations.map(
                  (occupation: { name: string; id: number }) => ({
                    name: occupation.name,
                    value: occupation.id,
                  })
                )}
              />
            )}
          />
          <Route
            path={`${process.env.PUBLIC_URL}/family-sponsorship`}
            component={Family}
          />
          <Route
            path={`${process.env.PUBLIC_URL}/study-visa`}
            component={Study}
          />
          <Route path={`/`} component={() => (
              <General
                countries={countries.map(
                  (country: { name: string; id: number }) => ({
                    name: country.name,
                    value: country.id,
                  })
                )}
                languages={languages.map(
                  (language: { name: string; id: number }) => ({
                    name: language.name,
                    value: language.id,
                  })
                )}
                degrees={degrees.map(
                  (degree: { title: string; id: number }) => ({
                    name: degree.title,
                    value: degree.id,
                  })
                )}
                occupations={occupations.map(
                  (occupation: { name: string; id: number }) => ({
                    name: occupation.name,
                    value: occupation.id,
                  })
                )}
              />
            )} />
        </Switch>
      </BrowserRouter>
    </>
  )
}

export default App

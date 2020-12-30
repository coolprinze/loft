import React, { useEffect, useState } from 'react'
import { BrowserRouter, Route, Switch } from 'react-router-dom'
import { toast, ToastContainer } from 'react-toastify'
import 'react-toastify/dist/ReactToastify.css'
import { getCountries, getFundRanges } from './actions/Utilites'
import './App.css'
import Loading from './components/Loading'
import { fundsAction } from './helper'
import { errHandler } from './helper/errorHandler'
import Antigua from './pages/Antigua'

function App() {
  const [loading, setLoading] = useState(false)
  const [countries, setCountries]: [any, any] = useState([])
  const [worthRanges, setWorthRanges] = useState([])
  const [investRanges, setInvestRanges] = useState([])

  const initFunc = async () => {
    setLoading(true)
    try {
      const res1 = await getCountries()
      const res2 = await getFundRanges('worth')
      const res3 = await getFundRanges('invest')

      setCountries(res1.data)
      setWorthRanges(res2.data)
      setInvestRanges(res3.data)

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

          {/* <Route
            path={`${process.env.PUBLIC_URL}/business-immigration`}
            component={Business}
          />
          <Route
            path={`${process.env.PUBLIC_URL}/family-sponsorship`}
            component={Family}
          />
          <Route
            path={`${process.env.PUBLIC_URL}/study-visa`}
            component={Study}
          />
          <Route path={`/`} component={General} /> */}
        </Switch>
      </BrowserRouter>
    </>
  )
}

export default App

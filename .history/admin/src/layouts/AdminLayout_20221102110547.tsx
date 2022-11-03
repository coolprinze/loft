import React, { Component, useEffect, useState } from 'react'
import { connect } from 'react-redux'
import {
  Link,
  NavLink,
  Navigate,
  createBrowserRouter,
  RouterProvider,
} from 'react-router-dom'
import { Card, Col, Row, Button, Collapse } from 'reactstrap'
import { showcaseBg, avatar1, logo } from '../assets/img'
import Loading from '../components/Loading'
import Section from '../components/Section'
import './style.scss'
import routes from '../routes'
import { logOut } from '../actions'
import userType, { authState } from '../interface/user'
// import { getCountries, getFundRanges } from '../actions/Utilites'
// import { toast } from 'react-toastify'
// import { errHandler } from '../actions/errorHandler'
// import { fundsAction } from '../helpers'

const AdminLayout = ({
  user,
  logOut,
}: {
  user?: userType
  logOut: () => void
}) => {
  const [showMenu, setShowMenu] = useState(false)
  const [loading, setLoading] = useState(false)
  // const [countries, setCountries] = useState([])
  // const [investRanges, setInvestRanges] = useState([])
  const [isOpen, setIsOpen] = useState('')

  const // initFunc = async () => {
    //   setLoading(true)
    //   try {
    //     const res1 = await getCountries()
    //     // const res2 = await getFundRanges('worth')
    //     const res3 = await getFundRanges('invest')
    //     // setCountries(res1.data)
    //     // setInvestRanges(res3.data)
    //   } catch (err) {
    //     //@ts-ignore
    //     errHandler(err?.response?.data, toast)
    //   }
    //   setLoading(false)
    // },
    toggleMenu = () => setShowMenu(!showMenu),
    toggleMenuChildren = (menu: string = '') => setIsOpen(menu),
    getRoutes = (
      routes: {
        path: string
        name: string
        component: React.ComponentClass<{ title: string }>
      }[]
    ) =>
      createBrowserRouter(
        routes.map((_) => ({
          path: _.path,
          element: <_.component title={_.name} />,
        }))
      )

  // useEffect(() => {
  //   initFunc()

  //   return () => {}
  // }, [])

  return user ? (
    <Section
      bgImage
      bgImageSrc={showcaseBg}
      id='showcase'
      className='default-padding'
    >
      <div className='container' id='Dashboard'>
        <div>
          <Card className='p-3 bg-faded flex-md-row justify-content-between'>
            <h2 className='text-center'>
              <i
                className='float-left fa fa-bars d-md-none'
                onClick={toggleMenu}
              ></i>
              <span className='float-right float-md-none'>Dashboard</span>
            </h2>
            <div className='text-center'>
              <Link to={`${process.env.PUBLIC_URL}`}>
                <img src={`${logo}`} alt='Loft' height={60} />
              </Link>
            </div>
          </Card>
        </div>
        <Row className='row-eq-height'>
          <Col
            className={`mt-md-3 pr-0 menu ${
              showMenu ? ' show ' : ''
            }d-md-block`}
            sm='12'
            md='3'
            onClick={(e: any) => {
              if (e.target.classList.contains('menu')) toggleMenu()
            }}
          >
            <Card className='p-4 bg-faded h-100'>
              <h2 className='text-right'>
                <i
                  onClick={() => setShowMenu(false)}
                  className='d-md-none fa fa-times'
                ></i>
              </h2>
              <div className='mt-4 text-center'>
                <img
                  alt='...'
                  className='rounded-circle w-50'
                  src={`${avatar1}`}
                />
                <br />
                <strong>{`${user.email}`}</strong>
                <br />

                <div className='h5 font-weight-300'>{user.email}</div>
              </div>
              <div id='menu' className='mt-4'>
                <p className='mb-1'>
                  <Link
                    onClick={() => toggleMenuChildren('business')}
                    to={`${process.env.PUBLIC_URL}/business/leads`}
                  >
                    <i
                      className={`fa fa-angle-${
                        isOpen === 'business' ? 'down' : 'right'
                      }`}
                    ></i>{' '}
                    Business Immigrants
                  </Link>
                  <Collapse isOpen={isOpen === 'business'} className='pl-4'>
                    <p className='mb-1'>
                      <NavLink
                        className={(_) => (_ ? 'active' : '')}
                        onClick={toggleMenu}
                        to={`${process.env.PUBLIC_URL}/business/leads`}
                      >
                        Business Leads
                      </NavLink>
                    </p>
                    <p className='mb-1'>
                      <NavLink
                        className={(_) => (_ ? 'active' : '')}
                        onClick={toggleMenu}
                        to={`${process.env.PUBLIC_URL}/business/clients`}
                      >
                        Business Clients
                      </NavLink>
                    </p>
                  </Collapse>
                </p>
                <hr className='mt-0 mb-3' />
                <p className='mb-1'>
                  <Link
                    onClick={() => toggleMenuChildren('general')}
                    to={`${process.env.PUBLIC_URL}/general/leads`}
                  >
                    <i
                      className={`fa fa-angle-${
                        isOpen === 'general' ? 'down' : 'right'
                      }`}
                    ></i>{' '}
                    General Immigrants
                  </Link>
                  <Collapse isOpen={isOpen === 'general'} className='pl-4'>
                    <p className='mb-1'>
                      <NavLink
                        className={(_) => (_ ? 'active' : '')}
                        onClick={toggleMenu}
                        to={`${process.env.PUBLIC_URL}/general/leads`}
                      >
                        General Leads
                      </NavLink>
                    </p>
                    <p className='mb-1'>
                      <NavLink
                        className={(_) => (_ ? 'active' : '')}
                        onClick={toggleMenu}
                        to={`${process.env.PUBLIC_URL}/general/clients`}
                      >
                        General Clients
                      </NavLink>
                    </p>
                  </Collapse>
                </p>
                <hr className='mt-0 mb-3' />
                <p className='mb-1'>
                  <NavLink
                    className={(_) => (_ ? 'active' : '')}
                    onClick={toggleMenu}
                    to={`${process.env.PUBLIC_URL}/antigua`}
                  >
                    Antigua Immigrants
                  </NavLink>
                </p>
                <hr className='mt-0 mb-3' />
                <p className='mb-1'>
                  <NavLink
                    className={(_) => (_ ? 'active' : '')}
                    onClick={toggleMenu}
                    to={`${process.env.PUBLIC_URL}/stkitts`}
                  >
                    St. Kitts Immigrants
                  </NavLink>
                </p>
                <hr className='mt-0 mb-3' />

                <Button block onClick={logOut} color='danger'>
                  Logout
                </Button>
              </div>
            </Card>
          </Col>
          <Col className='mt-3' md='9'>
            <Card className='p-2 bg-faded p-sm-4 h-100'>
              <Loading show={loading} />
              {
                //@ts-ignore

                <RouterProvider router={getRoutes(routes)} />
              }
            </Card>
          </Col>
        </Row>
      </div>
    </Section>
  ) : (
    <Navigate to={`${process.env.PUBLIC_URL}/auth/login`} />
  )
}

const mapStateToProps = ({ auth }: { auth: authState }) => ({
  ...auth,
})

export default connect(mapStateToProps, { logOut })(AdminLayout)

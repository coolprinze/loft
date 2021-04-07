import React, { Component } from 'react'
import { connect } from 'react-redux'
import { Link, Redirect, Route, Switch, NavLink } from 'react-router-dom'
import { Card, Col, Row, Button } from 'reactstrap'
import { showcaseBg, avatar1, logo } from '../assets/img'
import Loading from '../components/Loading'
import Section from '../components/Section'
import './style.scss'
import routes from '../routes'
import { logOut } from '../actions'
import userType, { authState } from '../interface/user'
import { getCountries, getFundRanges } from '../actions/Utilites'
import { toast } from 'react-toastify'
import { errHandler } from '../actions/errorHandler'
import { fundsAction } from '../helpers'

class AdminLayout extends Component<{
  user: userType | null
  logOut: () => void
}> {
  state = {
    showMenu: false,
    loading: false,
    countries: [],
    investRanges: [],
  }

  componentDidMount() {
    this.initFunc()
  }

  initFunc = async () => {
    this.setState({ loading: true })
    try {
      const res1 = await getCountries()
      // const res2 = await getFundRanges('worth')
      const res3 = await getFundRanges('invest')

      this.setState({
        loading: false,
        countries: res1.data,
        investRanges: res3.data,
      })
    } catch (err) {
      this.setState({ loading: false })
      errHandler(err?.response?.data, toast)
    }
  }

  toggleMenu = () => this.setState({ showMenu: !this.state.showMenu })

  getRoutes = (
    routes: {
      path: string
      name: string
      component: React.ComponentClass<{ countries: any; investRanges: any }>
    }[]
  ) => {
    const { investRanges, countries } = this.state
    return routes.map((prop, key) => (
      <Route
        path={prop.path}
        component={() => (
          <prop.component
            countries={countries.map(
              (country: { name: string; id: number }) => ({
                name: country.name,
                value: country.id,
              })
            )}
            investRanges={fundsAction(investRanges)}
          />
        )}
        key={key}
      />
    ))
  }

  render() {
    const { user } = this.props,
      { showMenu } = this.state

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
                  className='fa fa-bars d-md-none float-left'
                  onClick={() => this.toggleMenu()}
                ></i>
                <Link to='/'>
                  <span className=' float-md-none float-right'>Dashboard</span>
                </Link>
              </h2>
              <div className='text-center'>
                <img src={`${logo}`} alt='Loft' height={60} />
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
                if (e.target.classList.contains('menu')) this.toggleMenu()
              }}
            >
              <Card className='bg-faded p-4 h-100'>
                <h2 className='text-right'>
                  <i
                    onClick={() => this.toggleMenu()}
                    className='d-md-none fa fa-times'
                  ></i>
                </h2>
                <div className='text-center mt-4'>
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
                    <NavLink
                      activeClassName='active'
                      onClick={this.toggleMenu}
                      to='/antigua'
                    >
                      Antigua Immigrants
                    </NavLink>
                  </p>
                  <hr className='mt-0 mb-3' />
                  <p className='mb-1'>
                    <NavLink
                      activeClassName='active'
                      onClick={this.toggleMenu}
                      to='/stkitts'
                    >
                      St. Kitts Immigrants
                    </NavLink>
                  </p>
                  <hr className='mt-0 mb-3' />
                  <p className='mb-1'>
                    <NavLink
                      activeClassName='active'
                      onClick={this.toggleMenu}
                      to='/businesses'
                    >
                      Business Immigrants
                    </NavLink>
                  </p>
                  <hr className='mt-0 mb-3' />
                  <p className='mb-1'>
                    <NavLink
                      activeClassName='active'
                      onClick={this.toggleMenu}
                      to='/generals'
                    >
                      General Immigrants
                    </NavLink>
                  </p>
                  <hr className='mt-0 mb-3' />
                  {/* <p className="mb-1">
                    <NavLink
                      activeClassName="active"
                      onClick={this.toggleMenu}
                      to="/student-visa"
                    >
                      Students
                    </NavLink>
                  </p>
                  <hr className="mt-0 mb-3" /> */}

                  <Button block onClick={this.props.logOut} color='danger'>
                    Logout
                  </Button>
                </div>
              </Card>
            </Col>
            <Col className='mt-3' md='9'>
              <Card className='bg-faded p-sm-4 p-2 h-100'>
                <Loading show={this.state.loading} />
                {
                  //@ts-ignore
                  <Switch>{this.getRoutes(routes)}</Switch>
                }
              </Card>
            </Col>
          </Row>
        </div>
      </Section>
    ) : (
      <Redirect to='/auth/login' />
    )
  }
}
const mapStateToProps = ({ auth }: { auth: authState }) => ({
  ...auth,
})

export default connect(mapStateToProps, { logOut })(AdminLayout)

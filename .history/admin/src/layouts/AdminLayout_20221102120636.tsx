import { useState } from 'react'
import { connect } from 'react-redux'
import { Link, NavLink, Outlet } from 'react-router-dom'
import { Button, Card, Col, Collapse, Row } from 'reactstrap'
import { logOut } from '../actions'
import { avatar1, logo, showcaseBg } from '../assets/img'
import Section from '../components/Section'
import userType from '../interface/user'
import './style.scss'

const AdminLayout = ({
  user,
  logOut,
}: {
  user?: userType
  logOut: () => void
}) => {
  const [showMenu, setShowMenu] = useState(false)

  const [isOpen, setIsOpen] = useState('')

  const toggleMenu = () => setShowMenu(!showMenu),
    toggleMenuChildren = (menu: string = '') => setIsOpen(menu)

  return (
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
                <strong>{`${user?.email}`}</strong>
                <br />

                <div className='h5 font-weight-300'>{user?.email}</div>
              </div>
              <div id='menu' className='mt-4'>
                <div className='mb-1'>
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
                    <div className='mb-1'>
                      <NavLink
                        className={(_) => (_ ? 'active' : '')}
                        onClick={toggleMenu}
                        to={`${process.env.PUBLIC_URL}/business/leads`}
                      >
                        Business Leads
                      </NavLink>
                    </div>
                    <div className='mb-1'>
                      <NavLink
                        className={(_) => (_ ? 'active' : '')}
                        onClick={toggleMenu}
                        to={`${process.env.PUBLIC_URL}/business/clients`}
                      >
                        Business Clients
                      </NavLink>
                    </div>
                  </Collapse>
                </div>
                <hr className='mt-0 mb-3' />
                <div className='mb-1'>
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
                    <div className='mb-1'>
                      <NavLink
                        className={(_) => (_ ? 'active' : '')}
                        onClick={toggleMenu}
                        to={`${process.env.PUBLIC_URL}/general/leads`}
                      >
                        General Leads
                      </NavLink>
                    </div>
                    <div className='mb-1'>
                      <NavLink
                        className={(_) => (_ ? 'active' : '')}
                        onClick={toggleMenu}
                        to={`${process.env.PUBLIC_URL}/general/clients`}
                      >
                        General Clients
                      </NavLink>
                    </div>
                  </Collapse>
                </div>
                <hr className='mt-0 mb-3' />
                <div className='mb-1'>
                  <NavLink
                    className={(_) => (_ ? 'active' : '')}
                    onClick={toggleMenu}
                    to={`${process.env.PUBLIC_URL}/antigua`}
                  >
                    Antigua Immigrants
                  </NavLink>
                </div>
                <hr className='mt-0 mb-3' />
                <div className='mb-1'>
                  <NavLink
                    className={(_) => (_ ? 'active' : '')}
                    onClick={toggleMenu}
                    to={`${process.env.PUBLIC_URL}/stkitts`}
                  >
                    St. Kitts Immigrants
                  </NavLink>
                </div>
                <hr className='mt-0 mb-3' />

                <Button block onClick={logOut} color='danger'>
                  Logout
                </Button>
              </div>
            </Card>
          </Col>
          <Col className='mt-3' md='9'>
            <Card className='p-2 bg-faded p-sm-4 h-100'>
              <Outlet />
            </Card>
          </Col>
        </Row>
      </div>
    </Section>
  )
}

const mapStateToProps = ({ auth }: any) => ({
  ...auth,
})

export default connect(mapStateToProps, { logOut })(AdminLayout)

import React from 'react'
import { Container } from 'reactstrap'
import { NavLink } from 'react-router-dom'

const Header = () => {
  return (
    <div className='header-wrapper'>
      <div className='container-fluid header py-3'>
        <Container>
          <h2>Free General Canadian immigration Assessment Form</h2>
        </Container>
      </div>
      <Container className='subheader py-3'>
        <h2>Choose your evaluation form</h2>
        <div className='section mt-3 py-3'>
          <nav>
            <ul className='nav'>
              <li className='nav-item mx-3'>
                <NavLink
                  className='nav-link'
                  to={`${process.env.PUBLIC_URL}/general`}
                  onClick={() =>
                    (window.location.href = `${process.env.PUBLIC_URL}/general`)
                  }
                  activeClassName='active'
                >
                  General Immigration
                </NavLink>
              </li>
              <li className='nav-item mx-3'>
                <NavLink
                  className='nav-link'
                  to={`${process.env.PUBLIC_URL}/business-immigration`}
                  onClick={() =>
                    (window.location.href = `${process.env.PUBLIC_URL}/business-immigration`)
                  }
                  activeClassName='active'
                >
                  Business Immigration
                </NavLink>
              </li>

              <li className='nav-item mx-3'>
                <NavLink
                  className='nav-link'
                  to={`${process.env.PUBLIC_URL}/family-sponsorship`}
                  onClick={() =>
                    (window.location.href = `${process.env.PUBLIC_URL}/family-sponsorship`)
                  }
                  activeClassName='active'
                >
                  Family Sponsorship
                </NavLink>
              </li>
              <li className='nav-item mx-3'>
                <NavLink
                  className='nav-link'
                  to={`${process.env.PUBLIC_URL}/study-visa`}
                  onClick={() =>
                    (window.location.href = `${process.env.PUBLIC_URL}/study-visa`)
                  }
                  activeClassName='active'
                >
                  Study Visa
                </NavLink>
              </li>
              <li className='nav-item mx-3'>
                <NavLink
                  className='nav-link'
                  to={`${process.env.PUBLIC_URL}/antigua`}
                  onClick={() =>
                    (window.location.href = `${process.env.PUBLIC_URL}/antigua`)
                  }
                  activeClassName='active'
                >
                  Antigua & Barbuda
                </NavLink>
              </li>
            </ul>
          </nav>
        </div>
      </Container>
    </div>
  )
}

export default Header

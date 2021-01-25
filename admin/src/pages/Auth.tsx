import React, { Component } from 'react'
import { connect } from 'react-redux'
import { Button, Col, Container, Row, Form } from 'reactstrap'
import { authenticateUser } from '../actions'
import { TextInputGroup } from '../components/Form'
import Loading from '../components/Loading'
import AdminLayout from '../layouts/AdminLayout'
import { logo } from '../assets/img'
import { authState } from '../interface/user'

const initialState = {
  email: '',
  password: '',
  prevPath: '/',
  loading: false,
}

class Auth extends Component<authState> {
  state = initialState

  onChange = (e?: any) => {
    this.setState({ [e.target.name]: e.target.value })
  }

  loginUser = (e: any) => {
    e.preventDefault()
    this.setState({ loading: true })
    this.props.authenticateUser(this.state, (res: any, err: any) =>
      res ? this.setState(initialState) : this.setState(err)
    )
  }

  render() {
    return this.props.isAuthenticated ? (
      //@ts-ignore
      <AdminLayout />
    ) : (
      <>
        <Container id='Quote' className='mt-5 pt-5'>
          <Row className='mb-4'>
            <Col className='text-center'>
              <img src={logo} style={{ maxHeight: '5rem' }} alt='Logo' />
            </Col>
          </Row>
          <Form onSubmit={this.loginUser.bind(this)}>
            <Row>
              <Loading show={this.state.loading} />
              <Col sm='6' lg={4} className='offset-sm-3 offset-lg-4 py-2'>
                <TextInputGroup
                  onChange={(e: any) => this.onChange(e)}
                  name={'email'}
                  value={this.state.email}
                  isRequired
                  placeholder='Username'
                  iconClass='ni ni-email-83'
                  autoFocus={true}
                  className='mb-1'
                />

                <TextInputGroup
                  onChange={(e: any) => this.onChange(e)}
                  name={'password'}
                  type='password'
                  value={this.state.password}
                  isRequired
                  isPassword
                  placeholder='Password'
                  iconClass='ni ni-lock-circle-open'
                />
                <div className='text-center'>
                  <Button
                    block
                    className='mt-4 mb-2'
                    color='primary'
                    type='submit'
                  >
                    Login
                  </Button>
                </div>
              </Col>
            </Row>
          </Form>
        </Container>
      </>
    )
  }
}

const mapStateToProps = ({ auth }: { auth: any }) => ({
  ...auth,
})

export default connect(mapStateToProps, { authenticateUser })(Auth)

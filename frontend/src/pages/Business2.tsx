import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { toast } from 'react-toastify'
import { Button, Col, Collapse, Row } from 'reactstrap'
import validator from 'validator'
import { addBusiness } from '../actions/General'
import { RadioInput, SelectGroup, TextInputGroup } from '../components/Form'
import Loading from '../components/Loading'
import MainLayout from '../layouts/MainLayout'
import Countries from '../static/countries'
import Currencies from '../static/currencies'
import { errorKey } from '../types'
import { maritalOptions } from './General'

const experiencedOptions = [
  {
    label: 'Yes',
    id: 'experienced',
    value: 'true',
  },
  {
    label: 'No',
    id: 'notexperienced',
    value: 'false',
  },
]

const initialState = {
  isOpen: 1,
  userData: {
    first_name: 'Ebuka',
    last_name: 'Nwosu',
    email: 'ebuksnwosu45@gmail.com',
    phone: '+2348107539186',
    dob: '11-06-1993',
    managerial_experience: true,
    maritalStatusId: 2,
    networth: 2,
    invest_funds: 2,
    residenceId: 162,
    citizenshipId: '162',
    educational_histories: [
      {
        from: '12-3-2000',
        to: '12-3-2020',
        school: 'Yaba College of Technology',
        city: 'Yaba',
        countryId: '162',
        stateId: '1',
        degreeId: '2',
      },
    ],
    spouse: {
      first_name: 'Chioma',
      last_name: 'Osita',
      dob: '11-06-1994',
      country_of_birth: 162,
      educational_histories: [
        {
          from: '12-3-2000',
          to: '12-3-2020',
          school: 'Unilag',
          city: 'Yaba',
          countryId: '162',
          stateId: '1',
          degreeId: '1',
        },
      ],
    },
  },

  countries: Countries,
  currencies: Currencies.map((currency) => ({
    name: currency.name,
    value: currency.name,
  })),
  loading: false,
  // eslint-disable-next-line @typescript-eslint/no-array-constructor
  errors: new Array(),
}

class Business2 extends Component {
  state = initialState

  validateStep = (val: number) => {
    let {
      userData: {
        first_name,
        last_name,
        email,
        phone: phn,
        dob,
        managerial_experience,
        maritalStatusId,
        networth,
        invest_funds,
        residenceId,
        citizenshipId,
      },
    } = this.state
    const errors: any = []
    if (val === 1) {
      const phone = phn.replace(/\D/g, '').slice(-10)

      !first_name && errors.push('first_name')
      !last_name && errors.push('last_name')
      !citizenshipId && errors.push('citizenshipId')
      !residenceId && errors.push('residenceId')
      !dob && errors.push('dob')
      !maritalStatusId && errors.push('maritalStatusId')
      !validator.isEmail(email) && errors.push('email')
      !validator.isMobilePhone(phone) && errors.push('phone')

      if (!errors.length) {
        this.setState({ isOpen: 2 })
      }
    } else if (val === 2) {
      !networth && errors.push('networth')
      !invest_funds && errors.push('invest_funds')
      !validator.isNumeric(`${networth}`) && errors.push('networth')
      !validator.isNumeric(`${invest_funds}`) && errors.push('invest_funds')

      if (!errors.length) {
        this.setState({ isOpen: 3 })
      }
    } else if (val === 3) {
      !managerial_experience && errors.push('managerial_experience')

      if (!errors.length) {
        this.setState({ loading: true }, this.onSubmit)
      }
    } else {
      this.setState({ isOpen: 1 })
    }
    this.setState({ errors })
  }

  hasErrors = (key: errorKey, errors = this.state.errors) =>
    errors.includes(key)

  toggleStep = (val: number) => this.validateStep(val - 1)

  onSubmit = () =>
    addBusiness(this.state.userData)
      .then((res) => {
        this.setState(initialState, () => {
          toast('Your request have been logged')
          window.location.href = '/thank-you-buz'
        })
      })
      .catch((err) =>
        this.setState({ loading: false }, () =>
          toast(
            'An error occured, kindly avoid duplicate request, (Email or Phone)'
          )
        )
      )

  onChange = (e?: any) => {
    this.setState({
      userData: {
        ...this.state.userData,
        [e.target.name]: ['networth'].includes(e.target.name)
          ? parseInt(e.target.value)
          : e.target.value,
      },
    })
  }

  section1 = (isOpen: number) => {
    const {
      countries,
      userData: {
        first_name,
        last_name,
        email,
        citizenshipId,
        residenceId,
        phone,
      },
    } = this.state

    return (
      <div className='section mb-2 p-3'>
        <Link
          className={`${(isOpen === 1 && 'active') || ''} collapse-btn`}
          onClick={() => this.toggleStep(1)}
          to='#'
        >
          <h2>Your personal profile</h2>
        </Link>
        <Collapse isOpen={isOpen === 1}>
          <Row>
            <Col md={4} sm={6} className='py-1'>
              <TextInputGroup
                invalid={this.hasErrors('first_name')}
                label='First Name'
                name='first_name'
                value={first_name}
                required
                onChange={this.onChange}
              />
            </Col>
            <Col md={4} sm={6} className='py-1'>
              <TextInputGroup
                invalid={this.hasErrors('last_name')}
                label='Last Name'
                name='last_name'
                value={last_name}
                required
                onChange={this.onChange}
              />
            </Col>
            <Col md={4} sm={6} className='py-1'>
              <TextInputGroup
                invalid={this.hasErrors('email')}
                label='Email Address'
                name='email'
                value={email}
                required
                isEmail
                type='email'
                onChange={this.onChange}
              />
            </Col>
            <Col md={4} sm={6} className='py-1'>
              <SelectGroup
                invalid={this.hasErrors('citizenshipId')}
                id='citizenshipId'
                name='citizenshipId'
                value={citizenshipId}
                options={countries}
                placeholder='SELECT A COUNTRY'
                onSelect={this.onChange}
                required
                label='Country of Citizenship'
              />
            </Col>
            <Col md={4} sm={6} className='py-1'>
              <SelectGroup
                invalid={this.hasErrors('residenceId')}
                id='residenceId'
                name='residenceId'
                value={`${residenceId}`}
                options={countries}
                placeholder='SELECT A COUNTRY'
                onSelect={this.onChange}
                required
                label='Country of Residence'
              />
            </Col>
            <Col md={4} sm={6} className='py-1'>
              <TextInputGroup
                invalid={this.hasErrors('phone')}
                label='Phone'
                name='phone'
                value={phone}
                required
                type='tel'
                onChange={this.onChange}
              />
            </Col>
            <Col sm={12} className='py-1'>
              <RadioInput
                invalid={this.hasErrors('married')}
                type='radio'
                name='maritalStatusId'
                id='maritalStatusId'
                title='Martal Status'
                inline
                required
                options={maritalOptions}
                onSelect={this.onChange}
              />
            </Col>
            <Col className='text-right'>
              <Button
                color='danger'
                onClick={() => this.validateStep(1)}
                className='px-5'
                size='lg'
              >
                Next Step
              </Button>
            </Col>
          </Row>
        </Collapse>
      </div>
    )
  }

  section2 = (isOpen: number) => {
    const {
      currencies,
      userData: { networth },
    } = this.state

    return (
      <div className='section mb-2 p-3'>
        <Link
          className={`${(isOpen === 2 && 'active') || ''} collapse-btn`}
          onClick={() => this.toggleStep(2)}
          to='#'
        >
          <h2>Your personal net worth</h2>
        </Link>
        <Collapse isOpen={isOpen === 2}>
          <p>
            Your Personal Net Worth is the current value of all the assets (e.g.
            properties, investments, stocks, bonds, bank accounts) that you (and
            your spouse/common-law partner, if applicable) personally own, MINUS
            the current value of all your combined personal liabilities (e.g.
            mortgages, loans, credit card balances).
          </p>
          <p>
            Please be sure to include your share of the value of any businesses
            that you own.
          </p>
          <Row>
            <Col sm={12} className='py-1'></Col>
            <Col sm={12} className='py-1'>
              <TextInputGroup
                invalid={this.hasErrors('networth')}
                label='Net Worth'
                name='networth'
                value={networth}
                type='number'
                required
                onChange={this.onChange}
              />
            </Col>

            <Col className='text-right'>
              <Button
                color='danger'
                onClick={() => this.validateStep(2)}
                className='px-5'
                size='lg'
              >
                Next Step
              </Button>
            </Col>
          </Row>
        </Collapse>
      </div>
    )
  }

  section3 = (isOpen: number) => {
    return (
      <div className='section mb-2 p-3'>
        <Link
          className={`${(isOpen === 3 && 'active') || ''} collapse-btn`}
          onClick={() => this.toggleStep(3)}
          to='#'
        >
          <h2>Your management experience</h2>
        </Link>
        <Collapse isOpen={isOpen === 3}>
          <p>
            Your management experience may have been gained in a private or
            public business, international agency, government or government
            department, professional practice, or farming.
          </p>
          <Row className='row-eq-height'>
            <Col sm={12} className='py-1'>
              <RadioInput
                invalid={this.hasErrors('experienced')}
                type='radio'
                name='experienced'
                id='experienced'
                title='Do you have at least 2 years of management experience'
                required
                options={experiencedOptions}
                onSelect={this.onChange}
              />
            </Col>
          </Row>
          <Row className='mt-2'>
            <Col>
              <Button
                color='danger'
                onClick={() => this.validateStep(3)}
                className='px-5'
                size='lg'
              >
                SUBMIT
              </Button>
            </Col>
          </Row>
        </Collapse>
      </div>
    )
  }

  render() {
    const { isOpen, loading } = this.state

    return (
      <MainLayout title='Business' showMenu>
        <>
          <Loading show={loading} />
          <div>
            {this.section1(isOpen)}
            {this.section2(isOpen)}
            {this.section3(isOpen)}
          </div>
        </>
      </MainLayout>
    )
  }
}

export default Business2

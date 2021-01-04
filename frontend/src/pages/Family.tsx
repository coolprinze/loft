import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { toast } from 'react-toastify'
import { Button, Card, CardBody, Col, Collapse, Row } from 'reactstrap'
import validator from 'validator'
import { addFamily } from '../actions/General'
import { RadioInput, SelectGroup, TextInputGroup } from '../components/Form'
import Loading from '../components/Loading'
import MainLayout from '../layouts/MainLayout'
import Countries from '../static/countries'
import { errorKey } from '../types'
import { experiencedOptions, jobOptions, maritalOptions } from './General'

const provinces = [
  'Alberta',
  'British Columbia',
  'Manitoba',
  'New Brunswick',
  'Newfoundland and Labrador',
  'Nova Scotia',
  'Northwest Territories',
  'Nunavut',
  'Ontario',
  'Prince Edward Island',
  'Québec',
  'Saskatchewan',
  'Yukon',
].map((province) => ({ name: province, value: province }))

const planOptions = [
  {
    name: 'I want to sponsor my foreign relative for Canadian immigration',
    value: 'Sponsor',
  },
  {
    name: 'I want my relative in Canada to sponsor me for immigration',
    value: 'Be Sponsored',
  },
]

const relationshipOptions = [
  {
    name: 'Spouse or Common-Law Partner',
    value: 'Spouse or Common-Law Partner',
  },
  {
    name: 'Daughter or Son',
    value: 'Daughter or Son',
  },
  {
    name: 'Mother or Father',
    value: 'Mother or Father',
  },
  {
    name: 'Grandmother or Grandfather',
    value: 'Grandmother or Grandfather',
  },
  {
    name: 'Granddaughter or Grandson',
    value: 'Granddaughter or Grandson',
  },
  {
    name: 'Orphaned Sibling, Grandchild or Niece/Nephew',
    value: 'Orphaned Sibling, Grandchild or Niece/Nephew',
  },
  {
    name: 'Other relative - Please describe in comments',
    value: 'Other relative - Please describe in comments',
  },
]

const stayOptions = [
  {
    name: 'CITIZEN',
    value: 'CITIZEN',
  },
  {
    name: 'PERMANENT RESIDENT',
    value: 'PERMANENT RESIDENT',
  },
]

const initialState = {
  isOpen: 1,
  userData: {
    fname: '',
    lname: '',
    email: '',
    phone: '',
    nationality: '',
    age: '',
    married: null,
    plan: '',
    relative_name: '',
    relationship: '',
    gov_assistance: null,
    stay_type: '',
    province: '',
    canada_residence: null,
  },
  countries: Countries,
  loading: false,
  // eslint-disable-next-line @typescript-eslint/no-array-constructor
  errors: new Array(),
}

class Family extends Component {
  state = initialState

  validateStep = (val: number) => {
    let {
      userData: {
        fname,
        lname,
        email,
        phone: phn,
        nationality,
        age,
        married,
        plan,
        relative_name,
        relationship,
        gov_assistance,
        stay_type,
        province,
        canada_residence,
      },
    } = this.state
    const errors: any = []
    if (val === 1) {
      const phone = phn.replace(/\D/g, '').slice(-10)

      !fname && errors.push('fname')
      !lname && errors.push('lname')
      !nationality && errors.push('nationality')
      !nationality && errors.push('nationality')
      !age && errors.push('age')
      !plan && errors.push('plan')
      !validator.isEmail(email) && errors.push('email')
      !validator.isMobilePhone(phone) && errors.push('phone')
      !validator.isNumeric(`${age}`) && errors.push('age')
      !married && errors.push('married')

      if (!errors.length) {
        this.setState({ isOpen: 2 })
      }
    } else if (val === 2) {
      !relative_name && errors.push('relative_name')
      !relationship && errors.push('relationship')
      !gov_assistance && errors.push('gov_assistance')
      !stay_type && errors.push('stay_type')
      !canada_residence && errors.push('canada_residence')

      canada_residence === 'true' && !province && errors.push('province')

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
    addFamily(this.state.userData)
      .then((res) => {
        this.setState(initialState, () => {
          toast('Your request have been logged')
          window.location.href = '/thank-you-fam'
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
        [e.target.name]: ['age'].includes(e.target.name)
          ? parseInt(e.target.value)
          : e.target.value,
      },
    })
  }

  section1 = (isOpen: number) => {
    const {
      countries,
      userData: { fname, lname, email, phone, nationality, age, plan },
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
                invalid={this.hasErrors('fname')}
                label='First Name'
                name='fname'
                value={fname}
                required
                onChange={this.onChange}
              />
            </Col>
            <Col md={4} sm={6} className='py-1'>
              <TextInputGroup
                invalid={this.hasErrors('lname')}
                label='Last Name'
                name='lname'
                value={lname}
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
            <Col md={4} sm={6} className='py-1'>
              <SelectGroup
                invalid={this.hasErrors('nationality')}
                id='nationality'
                name='nationality'
                value={nationality}
                options={countries}
                placeholder='SELECT A COUNTRY'
                onSelect={this.onChange}
                required
                label='Country of Citizenship'
              />
            </Col>
            <Col md={4} sm={6} className='py-1'>
              <TextInputGroup
                invalid={this.hasErrors('age')}
                label='Age'
                name='age'
                value={age}
                required
                type='number'
                onChange={this.onChange}
              />
            </Col>
            <Col md={4} sm={6} className='py-1'>
              <RadioInput
                invalid={this.hasErrors('married')}
                type='radio'
                name='married'
                id='married'
                title='Martal Status'
                inline
                required
                options={maritalOptions}
                onSelect={this.onChange}
              />
            </Col>
            <Col md={8} sm={6} className='py-1'>
              <SelectGroup
                invalid={this.hasErrors('plan')}
                id='plan'
                name='plan'
                value={plan}
                options={planOptions}
                placeholder='PLEASE SELECTY'
                onSelect={this.onChange}
                required
                label='What would you like to do'
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
      userData: {
        relative_name,
        relationship,
        stay_type,
        province,
        canada_residence,
      },
    } = this.state

    return (
      <div className='section mb-2 p-3'>
        <Link
          className={`${(isOpen === 2 && 'active') || ''} collapse-btn`}
          onClick={() => this.toggleStep(2)}
          to='#'
        >
          <h2>Your relative's information</h2>
        </Link>
        <Collapse isOpen={isOpen === 2}>
          <Row>
            <Col sm={6} className='py-1'>
              <TextInputGroup
                invalid={this.hasErrors('relative_name')}
                label="What is your relative's full name"
                name='relative_name'
                value={relative_name}
                required
                onChange={this.onChange}
              />
            </Col>
            <Col sm={6} className='py-1'>
              <SelectGroup
                invalid={this.hasErrors('relationship')}
                id='relationship'
                name='relationship'
                value={relationship}
                options={relationshipOptions}
                placeholder='PLEASE SELECT'
                onSelect={this.onChange}
                required
                label='What is your relationship to your relative'
              />
            </Col>
          </Row>
          <Card>
            <CardBody className='bg-light'>
              <h6>Sponsorship Information</h6>
              <Row>
                <Col sm={6} className='py-1'>
                  <RadioInput
                    invalid={this.hasErrors('gov_assistance')}
                    type='radio'
                    name='gov_assistance'
                    id='gov_assistance'
                    title='Are you currently getting any kind of social assistance from the Government'
                    required
                    options={experiencedOptions}
                    onSelect={this.onChange}
                  />
                </Col>
                <Col sm={6} className='py-1'>
                  <SelectGroup
                    invalid={this.hasErrors('stay_type')}
                    id='stay_type'
                    name='stay_type'
                    value={stay_type}
                    options={stayOptions}
                    placeholder='PLEASE SELECT'
                    onSelect={this.onChange}
                    required
                    label=' 
                Are you a citizen or permanent resident of Canada'
                  />
                </Col>
                <Col sm={6} className='py-1'>
                  <RadioInput
                    invalid={this.hasErrors('canada_residence')}
                    type='radio'
                    name='canada_residence'
                    id='canada_residence'
                    title='Are you currently residing in Canada'
                    required
                    options={jobOptions}
                    onSelect={this.onChange}
                  />
                </Col>
                {canada_residence === 'true' && (
                  <Col sm={6} className='py-1'>
                    <SelectGroup
                      invalid={this.hasErrors('province')}
                      id='province'
                      name='province'
                      value={province}
                      options={provinces}
                      placeholder='PLEASE SELECT'
                      onSelect={this.onChange}
                      required
                      label='Which province of Canada do you reside in'
                    />
                  </Col>
                )}
              </Row>
            </CardBody>
          </Card>

          <Row className='mt-2'>
            <Col>
              <Button
                color='danger'
                onClick={() => this.validateStep(2)}
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
      <MainLayout>
        <>
          <Loading show={loading} />
          <div>
            {this.section1(isOpen)}
            {this.section2(isOpen)}
          </div>
        </>
      </MainLayout>
    )
  }
}

export default Family

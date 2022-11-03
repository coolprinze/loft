import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { toast } from 'react-toastify'
import { Button, Card, CardBody, Col, Collapse, Row } from 'reactstrap'
import validator from 'validator'
import { addBusinessImmigrant } from '../actions/General'
import {
  DateInputGroup,
  RadioInput,
  SelectGroup,
  TextInputGroup,
} from '../components/Form'
import Loading from '../components/Loading'
import MainLayout from '../layouts/MainLayout'
import Currencies from '../static/currencies'
import { qualification } from '../types/business'
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

const educatedOptions = [
  {
    label: 'Yes',
    id: 'educated',
    value: 'true',
  },
  {
    label: 'No',
    id: 'noteducated',
    value: 'false',
  },
]

const spouseEducatedOptions = [
  {
    label: 'Yes',
    id: 'seducated',
    value: 'true',
  },
  {
    label: 'No',
    id: 'snoteducated',
    value: 'false',
  },
]

const initialState = {
  isOpen: 1,
  educated: null,
  spouseEducated: null,
  userData: {
    first_name: '',
    last_name: '',
    email: '',
    citizenshipId: null,
    residenceId: null,
    phone: '',
    married: '',
    dob: '',

    networth: null,
    invest_funds: null,
    managerial_experience: undefined,
    qualifications: [],
    spouse: {
      country_of_birth: null,
      dob: undefined,
      qualifications: [],
    },
  },

  currencies: Currencies.map((currency) => ({
    name: currency.name,
    value: currency.name,
  })),
  loading: false,
  // eslint-disable-next-line @typescript-eslint/no-array-constructor
  errors: new Array(),
}

class Business2 extends Component<{
  countries: { name: string; value: number }[]
  degrees: { name: string; value: number }[]
  worthRanges: { name: string; value: number }[]
  investRanges: { name: string; value: number }[]
}> {
  state = initialState

  enableKeyboard = () => (document.onkeypress = () => true)
  disableKeyboard = () => (document.onkeypress = () => false)
  validateStep = (val: number) => {
    let {
      educated,
      spouseEducated,
      userData: {
        first_name,
        last_name,
        email,
        phone: phn,
        dob,
        residenceId,
        citizenshipId,
        married,

        networth,
        invest_funds,

        managerial_experience,
        qualifications,

        spouse,
      },
      userData,
    } = this.state

    const errors: any = []

    const validateQualification = (
      qualifications: qualification[],
      type: string = ''
    ) => {
      if (type === 's' ? spouseEducated : educated)
        qualifications.map((qualification, index) => {
          let { from, to, school, city, degreeId, countryId } = qualification
          errors.push([])

          !from && errors[index].push(`${type}from`)
          !to && errors[index].push(`${type}to`)
          !school && errors[index].push(`${type}school`)
          !city && errors[index].push(`${type}city`)
          !degreeId && errors[index].push(`${type}degree`)
          !countryId && errors[index].push(`${type}country`)
          return null
        })
      else errors.push(`${type}educated`)

      return !errors.find((error: any) => error.length) || false
    }
    const validateStep1 = () => {
        const phone = phn.replace(/\D/g, '').slice(-10)

        !first_name && errors.push('first_name')
        !last_name && errors.push('last_name')
        !citizenshipId && errors.push('citizenshipId')
        !residenceId && errors.push('residenceId')
        !dob && errors.push('dob')

        !married && errors.push('married')
        !validator.isEmail(email) && errors.push('email')
        !validator.isMobilePhone(phone) && errors.push('phone')

        married !== 'true' &&
          this.setState({
            userData: {
              ...userData,
              spouse: {
                country_of_birth: null,
                dob: undefined,
                qualifications: [],
              },
            },
          })

        return !errors.length || false
      },
      validateStep2 = () => {
        !networth && errors.push('networth')
        !invest_funds && errors.push('invest_funds')
        !validator.isNumeric(`${networth}`) && errors.push('networth')
        !validator.isNumeric(`${invest_funds}`) && errors.push('invest_funds')

        return !errors.length || false
      },
      validateStep4 = () => {
        if (married === 'true') {
          let { dob, qualifications, country_of_birth } = spouse

          validateQualification(qualifications, 's')
          !country_of_birth && errors.push('country_of_birth')
          !validator.isNumeric(`${country_of_birth}`) &&
            errors.push('country_of_birth')
          !dob && errors.push('sdob')
        }
        return !errors.find((error: any) => error.length) || false
      },
      validateStep3 = () => {
        !managerial_experience && errors.push('managerial_experience')

        return validateQualification(qualifications)
      }

    if (val === 1) {
      validateStep1() && this.setState({ isOpen: 2 })
    } else if (val === 2) {
      validateStep1()
        ? validateStep2() && this.setState({ isOpen: 3 })
        : this.setState({ isOpen: 1 })
    } else if (val === 3) {
      validateStep1()
        ? validateStep2()
          ? validateStep3()
            ? married === 'true'
              ? this.setState({ isOpen: 4 })
              : this.setState({ loading: true }, this.onSubmit)
            : console.log(errors)
          : this.setState({ isOpen: 2 })
        : this.setState({ isOpen: 1 })
    } else if (val === 4) {
      validateStep1()
        ? validateStep2()
          ? validateStep3()
            ? validateStep4()
              ? this.setState({ loading: true }, this.onSubmit)
              : console.log(errors)
            : this.setState({ isOpen: 3 })
          : this.setState({ isOpen: 2 })
        : this.setState({ isOpen: 1 })
    } else {
      this.setState({ isOpen: 1 })
    }
    this.setState({ errors })
  }

  hasErrors = (key: any, errors = this.state.errors) => {
    return errors.includes(key)
  }

  toggleStep = (val: number) => this.validateStep(val - 1)

  onSubmit = () => {
    let {
      userData,
      userData: { married, spouse },
    } = this.state

    let data = { ...userData, spouse: married === 'true' ? spouse : null }

    addBusinessImmigrant(data)
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
  }

  onChangeEducated = (e?: any, type: string = '') => {
    if (e.target.value === 'true') {
      type === 's' ? this.addQualification('s') : this.addQualification()
    } else {
      const { userData, educated, spouseEducated } = this.state
      this.setState({
        userData:
          type === 's'
            ? {
                ...userData,
                spouse: { ...userData.spouse, qualifications: [] },
              }
            : {
                ...userData,
                qualifications: [],
              },
        educated: type === '' ? 'false' : educated,
        spouseEducated: type === 's' ? 'false' : spouseEducated,
      })
    }
  }

  onChange = (e?: any, type: string = '') => {
    const userData = this.state.userData
    if (type === 's')
      this.setState({
        userData: {
          ...userData,
          spouse: {
            ...userData.spouse,
            [e.target.name]: e.target.value,
          },
        },
      })
    else
      this.setState({
        userData: {
          ...userData,
          [e.target.name]: ['age', 'children'].includes(e.target.name)
            ? parseInt(e.target.value)
            : e.target.value,
        },
      })
  }

  /*------------------------------------*/
  /*------ Qualificaton Functions ------*/
  /*------------------------------------*/
  addQualification = (type: string = '') => {
    const { userData, spouseEducated, educated } = this.state,
      { qualifications } = type === 's' ? userData.spouse : userData
    const errors: any = []

    qualifications.map((qualification, index) => {
      let {
        degreeId,
        from,
        to,
        school,
        city,
        // stateId,
        countryId,
      } = qualification
      errors.push([])

      !degreeId && errors[index].push(`${type}degreeId`)
      !from && errors[index].push(`${type}from`)
      !to && errors[index].push(`${type}to`)
      !school && errors[index].push(`${type}school`)
      !city && errors[index].push(`${type}city`)
      // !stateId && errors[index].push(`${type}state`)
      !countryId && errors[index].push(` ${type}country`)
      return null
    })

    if (!errors.find((error: any) => error.length)) {
      const newQual = {
        degreeId: null,
        from: '',
        to: '',
        school: '',
        city: '',
        stateId: null,
        countryId: null,
      }
      this.setState({
        userData:
          type === 's'
            ? {
                ...userData,
                spouse: {
                  ...userData.spouse,
                  qualifications: [...userData.spouse.qualifications, newQual],
                },
              }
            : {
                ...userData,
                qualifications: [...userData.qualifications, newQual],
              },
        errors: [],
        educated: type === '' ? true : educated,
        spouseEducated: type === 's' ? true : spouseEducated,
      })
    } else {
      this.setState({ loading: false, errors })
    }
  }

  removeQualification = (index: number, type: string = '') => {
    const userData = this.state.userData,
      { qualifications } = type === 's' ? userData.spouse : userData

    qualifications.splice(index, 1)

    this.setState({
      userData:
        type === 's'
          ? {
              ...userData,
              spouse: { ...userData.spouse, qualifications },
            }
          : {
              ...userData,
              qualifications,
            },
    })
  }

  onChangeQualification = (index: number, e?: any, type: string = '') => {
    const userData = this.state.userData,
      { qualifications }: { qualifications: qualification[] } =
        type === 's' ? userData.spouse : userData
    qualifications[index] = {
      ...qualifications[index],
      [e.target.name]: e.target.value,
    }

    this.setState({
      userData:
        type === 's'
          ? {
              ...userData,
              spouse: { ...userData.spouse, qualifications },
            }
          : { ...this.state.userData, qualifications },
    })
  }

  qualification = (
    q: qualification,
    index: number,
    title: string,
    type: string = ''
  ) => {
    const { countries, degrees } = this.props

    const { errors } = this.state

    return (
      <Col sm={6} className='py-3'>
        <div className='p-4 bg-light justify-content-bottom h-100'>
          <h5>
            <strong>{title}</strong>
            <Button
              size='sm'
              outline
              className='btn float-right btn-outline-secondary'
              onClick={() => index && this.removeQualification(index, type)}
            >
              x
            </Button>
          </h5>
          <Row className='mx-0'>
            <Col xs={6} className='py-1 p-0 pr-1'>
              <DateInputGroup
                inputProps={{
                  style: {
                    type: 'date',
                  },
                  required: true,
                }}
                invalid={this.hasErrors(`${type}from`, errors[index])}
                label='From'
                onFocus={this.disableKeyboard}
                onBlur={this.enableKeyboard}
                value={q.from}
                autoComplete='off'
                id={`${type}from`}
                onChange={(e) =>
                  this.onChangeQualification(
                    index,
                    {
                      ...e,
                      target: { ...e.target, name: 'from' },
                    },
                    type
                  )
                }
                required
              />
            </Col>
            <Col xs={6} className='py-1 px-0 pl-1'>
              <DateInputGroup
                inputProps={{
                  style: { type: 'date' },
                  required: true,
                }}
                invalid={this.hasErrors(`${type}to`, errors[index])}
                label='To'
                onFocus={this.disableKeyboard}
                onBlur={this.enableKeyboard}
                value={q.to}
                autoComplete='off'
                name='to'
                id={`${type}to`}
                onChange={(e) =>
                  this.onChangeQualification(
                    index,
                    {
                      ...e,
                      target: { ...e.target, name: 'to' },
                    },
                    type
                  )
                }
                required
              />
            </Col>
          </Row>

          <TextInputGroup
            invalid={this.hasErrors(`${type}school`, errors[index])}
            label='School'
            name='school'
            value={q.school}
            required
            onChange={(e: any) => this.onChangeQualification(index, e, type)}
          />

          <TextInputGroup
            invalid={this.hasErrors(`${type}city`, errors[index])}
            label='City'
            name='city'
            value={q.city}
            required
            onChange={(e: any) => this.onChangeQualification(index, e, type)}
          />
          <SelectGroup
            invalid={this.hasErrors(`${type}degreeId`, errors[index])}
            id={`${type}degreeId`}
            name='degreeId'
            value={q.degreeId}
            options={degrees}
            placeholder='PLEASE SELECT'
            onSelect={(e: any) => this.onChangeQualification(index, e, type)}
            required
            label='What Degree'
          />
          <SelectGroup
            invalid={this.hasErrors(`${type}country`, errors[index])}
            id={`${type}country`}
            name='countryId'
            value={q.countryId}
            options={countries}
            placeholder='SELECT A COUNTRY'
            onSelect={(e: any) => this.onChangeQualification(index, e, type)}
            required
            label='Location'
          />
        </div>
      </Col>
    )
  }

  section1 = (isOpen: number) => {
    const {
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
                options={this.props.countries}
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
                value={residenceId}
                options={this.props.countries}
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
            <Col sm={6} className='py-1'>
              <RadioInput
                invalid={this.hasErrors('married')}
                name='married'
                id='married'
                title='Martal Status'
                inline
                required
                options={maritalOptions}
                onSelect={this.onChange}
              />
            </Col>
            <Col sm={6} className='py-1'>
              <DateInputGroup
                invalid={this.hasErrors('dob')}
                label='Date of Birth'
                onFocus={this.disableKeyboard}
                onBlur={this.enableKeyboard}
                autoComplete='off'
                name='dob'
                id='dob'
                onChange={this.onChange}
                required
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
    const { networth, invest_funds } = this.state.userData,
      { investRanges, worthRanges } = this.props

    return (
      <div className='section mb-2 p-3'>
        <Link
          className={`${(isOpen === 2 && 'active') || ''} collapse-btn`}
          onClick={() => this.toggleStep(2)}
          to='#'
        >
          <h2>Your Financials</h2>
        </Link>
        <Collapse isOpen={isOpen === 2}>
          <Row>
            <Col sm={12} className='py-1'>
              <SelectGroup
                invalid={this.hasErrors('networth')}
                id='networth'
                name='networth'
                value={networth}
                options={worthRanges}
                placeholder='PLEASE SELECT'
                onSelect={this.onChange}
                required
                label='Net Worth (the sum total of all assets such as properties, investments, savings, etc.) (CAD)'
              />
            </Col>
            <Col sm={12} className='py-1'>
              <SelectGroup
                invalid={this.hasErrors('invest_funds')}
                id='invest_funds'
                name='invest_funds'
                value={invest_funds}
                options={investRanges}
                placeholder='PLEASE SELECT'
                onSelect={this.onChange}
                required
                label='Funds Available to Invest in Canada (CAD)'
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
    const {
      userData: { qualifications, married },
    } = this.state
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
                invalid={this.hasErrors('managerial_experience')}
                name='managerial_experience'
                id='managerial_experience'
                title='Do you have at least 2 years of management experience'
                required
                options={experiencedOptions}
                onSelect={this.onChange}
              />
            </Col>
          </Row>

          <Row className='row-eq-height'>
            <Col sm={12} className='py-1'>
              <RadioInput
                invalid={this.hasErrors('educated')}
                name='educated'
                id='educated'
                title='Have you received any post-secondary education or training?'
                inline
                required
                options={educatedOptions}
                onSelect={this.onChangeEducated}
                autoFocus={isOpen === 2}
              />
            </Col>
          </Row>
          {(qualifications.length && (
            <Card>
              <CardBody className='bg-muted'>
                <Row className='row-eq-height'>
                  {this.qualification(
                    qualifications[0],
                    0,
                    'Current (or most recent) Program of Study:'
                  )}
                  {qualifications.map(
                    (qualif, index) =>
                      index !== 0 &&
                      this.qualification(
                        qualif,
                        index,
                        'Previous Study Program:'
                      )
                  )}
                </Row>
                <Button
                  color='secondary'
                  onClick={() => this.addQualification()}
                >
                  Add Another Education or Training Program
                </Button>
              </CardBody>
            </Card>
          )) ||
            ''}
          <Row className='mt-2'>
            <Col className={married === 'true' ? 'text-right' : ''}>
              <Button
                color='danger'
                onClick={() => this.validateStep(3)}
                className='px-5'
                size='lg'
              >
                {married === 'true' ? 'Next Step' : 'SUBMIT'}
              </Button>
            </Col>
          </Row>
        </Collapse>
      </div>
    )
  }

  section4 = (isOpen: number) => {
    const {
      userData: {
        spouse: { qualifications, dob, country_of_birth },
      },
    } = this.state

    return (
      <div className='section mb-2 p-3'>
        <Link
          className={`${(isOpen === 4 && 'active') || ''} collapse-btn`}
          onClick={() => this.toggleStep(4)}
          to='#'
        >
          <h2>Spouse</h2>
        </Link>
        <Collapse isOpen={isOpen === 4}>
          <Row className='row-eq-height'>
            <Col sm={6} className='py-1'>
              <SelectGroup
                invalid={this.hasErrors('country_of_birth')}
                id='country_of_birth'
                name='country_of_birth'
                value={country_of_birth}
                options={this.props.countries}
                placeholder='SELECT A COUNTRY'
                onSelect={(e) => this.onChange(e, 's')}
                required
                label='Country of Birth'
              />
            </Col>
            <Col sm={6} className='py-1'>
              <DateInputGroup
                invalid={this.hasErrors('sdob')}
                label='Date of Birth'
                onFocus={this.disableKeyboard}
                onBlur={this.enableKeyboard}
                autoComplete='off'
                name='dob'
                value={dob}
                id='sdob'
                onChange={(e) =>
                  this.onChange(
                    {
                      ...e,
                      target: { ...e.target, name: 'dob' },
                    },
                    's'
                  )
                }
                required
              />
            </Col>
            <Col sm={12} className='py-1'>
              <RadioInput
                invalid={this.hasErrors('seducated')}
                name='spouseEducated'
                id='spouseEducated'
                title='Have your spouse received any post-secondary education or training?'
                inline
                required
                options={spouseEducatedOptions}
                onSelect={(e: any) => this.onChangeEducated(e, 's')}
              />
            </Col>
          </Row>
          {(qualifications.length && (
            <Card>
              <CardBody className='bg-muted'>
                <Row className='row-eq-height'>
                  {this.qualification(
                    qualifications[0],
                    0,
                    'Spouse Current (or most recent) Program of Study:',
                    's'
                  )}
                  {qualifications.map(
                    (qualif, index) =>
                      index !== 0 &&
                      this.qualification(
                        qualif,
                        index,
                        'Previous Study Program:',
                        's'
                      )
                  )}
                </Row>
                <Button
                  color='secondary'
                  onClick={() => this.addQualification('s')}
                >
                  Add Another Education or Training Program
                </Button>
              </CardBody>
            </Card>
          )) ||
            ''}

          <Row className='mt-2'>
            <Col>
              <Button
                color='danger'
                onClick={() => this.validateStep(4)}
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
    const {
      isOpen,
      loading,
      userData: { married },
    } = this.state

    return (
      <MainLayout title='Business' showMenu>
        <>
          <Loading show={loading} />
          <div>
            {this.section1(isOpen)}
            {this.section2(isOpen)}
            {this.section3(isOpen)}
            {married === 'true' && this.section4(isOpen)}
          </div>
        </>
      </MainLayout>
    )
  }
}

export default Business2

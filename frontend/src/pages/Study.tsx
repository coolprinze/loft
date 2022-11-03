import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { toast } from 'react-toastify'
import { Button, Col, Collapse, Row } from 'reactstrap'
import validator from 'validator'
import { addStudent } from '../actions/General'
import {
  CheckBoxes,
  RadioInput,
  SelectGroup,
  TextInputGroup,
} from '../components/Form'
import Loading from '../components/Loading'
import MainLayout from '../layouts/MainLayout'
import Countries from '../static/countries'
import { errorKey } from '../types'
import { Languages } from './General'

const proficiencies = [
  { name: 'High', value: 'High' },
  { name: 'Moderate', value: 'Moderate' },
  { name: 'Basic', value: 'Basic' },
]

const educationOptions = [
  {
    value: 'NO SECONDARY EDUCATION',
    name: 'NO SECONDARY EDUCATION',
  },
  {
    value: 'HIGN SCHOOL/SECONDARY DIPLOMA',
    name: 'HIGN SCHOOL/SECONDARY DIPLOMA',
  },
  {
    value: 'SOME COLLEGE OR UNIVERSITY',
    name: 'SOME COLLEGE OR UNIVERSITY',
  },
  {
    value: "BACHELOR'S DEGREE",
    name: "BACHELOR'S DEGREE",
  },
  {
    value: "MASTER'S DEGREE",
    name: "MASTER'S DEGREE",
  },
  {
    value: 'PHD',
    name: 'PHD',
  },
  {
    value: 'APPRENTICESHIP',
    name: 'APPRENTICESHIP',
  },
  {
    value: 'NON-UNIVERSITY DIPLOMA 1 YEAR',
    name: 'NON-UNIVERSITY DIPLOMA 1 YEAR',
  },
  {
    value: 'NON-UNIVERSITY DIPLOMA 2 YEAR',
    name: 'NON-UNIVERSITY DIPLOMA 2 YEAR',
  },
  {
    value: 'NON-UNIVERSITY DIPLOMA 3 YEAR',
    name: 'NON-UNIVERSITY DIPLOMA 3 YEAR',
  },
]

const statementOption = [
  {
    label: 'Yes',
    id: 'statement',
    value: 'true',
  },
  {
    label: 'No',
    id: 'notstatement',
    value: 'false',
  },
]

const admissionOption = [
  {
    label: 'Yes',
    id: 'admission',
    value: 'Yes',
  },
  {
    label: 'No',
    id: 'notadmission',
    value: 'No',
  },
  {
    label: 'None',
    id: 'none',
    value: 'None',
  },
]

const refreeOptions = [
  {
    value: 'internet',
    name: 'INTERNET SEACH',
  },
  {
    value: 'social',
    name: 'SOCIAL MEDIA',
  },
  {
    value: 'friend',
    name: 'A FRIEND',
  },
]

const studyOption = [
  {
    label: 'Healthcare Assistance',
    id: 'hc',
    value: 'Healthcare Assistance',
  },
  {
    label: 'Business Administration/Secretarial',
    id: 'bac',
    value: 'Business Administration/Secretarial',
  },
  {
    label: 'Accounting/Finance',
    id: 'ac',
    value: 'Accounting/Finance',
  },
  {
    label: 'Information Technology/Computer Support',
    id: 'ict',
    value: 'Information Technology/Computer Support',
  },
  {
    label: 'Industrial/Architectural Design',
    id: 'iad',
    value: 'Industrial/Architectural Design',
  },
  {
    label: 'Culinary Arts',
    id: 'ca',
    value: 'Culinary Arts',
  },
  {
    label: 'Natural Sciences',
    id: 'ns',
    value: 'Natural Sciences',
  },
  {
    label: 'Social Sciences',
    id: 'ss',
    value: 'Social Sciences',
  },
  {
    label: 'Engineering',
    id: 'egr',
    value: 'Engineering',
  },
  {
    label: 'Web Development/Graphic Design',
    id: 'wdg',
    value: 'Web Development/Graphic Design',
  },
  {
    label: 'Electrical Technician',
    id: 'et',
    value: 'Electrical Technician',
  },
  {
    label: 'Early Childhood Education',
    id: 'ece',
    value: 'Early Childhood Education',
  },
  {
    label: 'Marketing',
    id: 'mkt',
    value: 'Marketing',
  },
  {
    label: 'Cosmetology/Esthetics',
    id: 'cet',
    value: 'Cosmetology/Esthetics',
  },
  {
    label: 'English/French Language Training',
    id: 'efl',
    value: 'English/French Language Training',
  },
  {
    label: 'Other',
    id: 'Other',
    value: 'Other',
  },
]

const initialState = {
  isOpen: 1,
  userData: {
    fname: '',
    lname: '',
    email: '',
    phone: '',
    age: '',
    bank_statement: '',
    education_level: '',
    admission: '',
    residence: '',
    language1: '',
    proficiency1: '',
    language2: '',
    proficiency2: '',
    study_choice: [],
    referee: '',
    message: '',
  },
  countries: Countries,
  languages: Languages,
  loading: false,
  // eslint-disable-next-line @typescript-eslint/no-array-constructor
  errors: new Array(),
}

class Study extends Component {
  state = initialState

  hasErrors = (key: errorKey, errors = this.state.errors) =>
    errors.includes(key)

  toggleStep = (val: number) => this.validateStep(val - 1)

  onChange = (e?: any) => {
    const { userData } = this.state
    if (e.target.type === 'checkbox') {
      const val = e.target.value
      if (e.target.checked) {
        this.setState((prevState) => ({
          ...prevState,
          userData: {
            ...userData,
            study_choice: [...userData.study_choice, val],
          },
        }))
      } else {
        this.setState((prevState) => ({
          ...prevState,
          userData: {
            ...userData,
            study_choice: userData.study_choice.filter(
              (choice) => choice !== val
            ),
          },
        }))
      }
    } else {
      this.setState({
        userData: {
          ...userData,
          [e.target.name]:
            e.target.name === 'age' ? parseInt(e.target.value) : e.target.value,
        },
      })
    }
  }

  validateStep = (val: number) => {
    const {
      userData: {
        fname,
        lname,
        email,
        phone: phn,
        age,
        bank_statement,
        education_level,
        admission,
        residence,
        language1,
        proficiency1,
        language2,
        proficiency2,
        study_choice,
        referee,
      },
    } = this.state
    const errors: any = []
    if (val === 1) {
      const phone = phn.replace(/\D/g, '').slice(-10)

      !fname && errors.push('fname')
      !lname && errors.push('lname')
      !age && errors.push('age')
      !residence && errors.push('residence')
      !education_level && errors.push('education_level')
      !bank_statement && errors.push('bank_statement')
      !admission && errors.push('admission')
      !language1 && errors.push('language1')
      !proficiency1 && errors.push('proficiency1')
      if (language2 && language2 !== 'None') {
        !language2 && errors.push('language2')
        !proficiency2 && errors.push('proficiency2')
      }
      !validator.isEmail(email) && errors.push('email')
      !validator.isNumeric(`${age}`) && errors.push('age')
      !validator.isMobilePhone(phone) && errors.push('phone')

      !errors.length && this.setState({ isOpen: 2 })
    } else if (val === 2) {
      !study_choice.length && errors.push('study_choice')

      !errors.length && this.setState({ isOpen: 3 })
    } else if (val === 3) {
      !referee && errors.push('referee')

      !errors.length && this.setState({ loading: true }, this.onSubmit)
    } else {
      this.setState({ isOpen: 1 })
    }
    this.setState({ errors })
  }

  onSubmit = () => {
    const data = this.state.userData
    //@ts-ignore
    data.study_choice = data.study_choice.toString()
    addStudent(data)
      .then((res) => {
        this.setState(initialState, () => {
          toast('Your request have been logged')
          window.location.href = '/thank-you-study'
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

  section1 = (isOpen: number) => {
    const {
      countries,
      languages,
      userData: {
        fname,
        lname,
        email,
        residence,
        age,
        phone,
        education_level,
        language1,
        language2,
        proficiency1,
        proficiency2,
      },
    } = this.state

    return (
      <div className='section mb-2 p-3'>
        <Link
          className={`${(isOpen === 1 && 'active') || ''} collapse-btn`}
          onClick={() => this.toggleStep(1)}
          to='#'
        >
          <h2>Your Personal Information</h2>
        </Link>
        <Collapse isOpen={isOpen === 1}>
          <Row>
            <Col sm={6} className='py-2'>
              <TextInputGroup
                invalid={this.hasErrors('fname')}
                label='First Name'
                name='fname'
                value={fname}
                required
                autoFocus={true}
                onChange={this.onChange}
              />
            </Col>
            <Col sm={6} className='py-2'>
              <TextInputGroup
                invalid={this.hasErrors('lname')}
                label='Last Name'
                name='lname'
                value={lname}
                required
                onChange={this.onChange}
              />
            </Col>
            <Col sm={6} className='py-2'>
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
            <Col sm={6} className='py-2'>
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
            <Col sm={6} className='py-2'>
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
            <Col sm={6} className='py-2'>
              <SelectGroup
                invalid={this.hasErrors('education_level')}
                id='education_level'
                name='education_level'
                value={`${education_level}`}
                options={educationOptions}
                placeholder='SELECT'
                onSelect={this.onChange}
                required
                label='What is Your Highest Level of Education'
              />
            </Col>
            <Col sm={12} className='py-2'>
              <SelectGroup
                invalid={this.hasErrors('residence')}
                id='residence'
                name='residence'
                value={`${residence}`}
                options={countries}
                placeholder='SELECT A COUNTRY'
                onSelect={this.onChange}
                required
                label='Country of Residence'
              />
            </Col>
            <Col sm={12} className='py-2'>
              <RadioInput
                invalid={this.hasErrors('bank_statement')}
                name='bank_statement'
                id='bank_statement'
                title='Are you, or a family member, able to provide bank statements equivalent of $25,000 USD or more to cover your living expenses while you study in Canada?'
                required
                options={statementOption}
                onSelect={this.onChange}
              />
            </Col>
            <Col sm={12} className='py-2'>
              <RadioInput
                invalid={this.hasErrors('admission')}
                name='admission'
                id='admission'
                title='Do you already have a letter of admission/acceptance to a Canadian educational institution?'
                required
                options={admissionOption}
                onSelect={this.onChange}
              />
            </Col>
            <Col sm={6} lg={3} className='py-2'>
              <SelectGroup
                invalid={this.hasErrors('language1')}
                id='language1'
                name='language1'
                value={language1}
                options={languages}
                placeholder='PLEASE SELECT'
                onSelect={this.onChange}
                required
                label='First official language'
              />
            </Col>
            <Col sm={6} lg={3} className='py-2'>
              <SelectGroup
                invalid={this.hasErrors('proficiency1')}
                id='proficiency1'
                name='proficiency1'
                value={proficiency1}
                options={proficiencies}
                placeholder='PLEASE SELECT'
                onSelect={this.onChange}
                required
                label='Proficiency'
              />
            </Col>
            <Col sm={6} lg={3} className='py-2'>
              <SelectGroup
                invalid={this.hasErrors('language2')}
                id='language2'
                name='language2'
                value={language2}
                options={[{ name: 'None', value: 'None' }, ...languages]}
                placeholder='PLEASE SELECT'
                onSelect={this.onChange}
                required
                label='Second official language'
              />
            </Col>
            {(language2 && language2 !== 'None' && (
              <Col sm={6} lg={3} className='py-2'>
                <SelectGroup
                  invalid={this.hasErrors('proficiency2')}
                  id='proficiency2'
                  name='proficiency2'
                  value={proficiency2}
                  options={proficiencies}
                  placeholder='PLEASE SELECT'
                  onSelect={this.onChange}
                  required
                  label='Proficiency'
                />
              </Col>
            )) ||
              null}
            <Col sm={12} className='text-right'>
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
    return (
      <div className='section mb-2 p-3'>
        <Link
          className={`${(isOpen === 2 && 'active') || ''} collapse-btn`}
          onClick={() => this.toggleStep(2)}
          to='#'
        >
          <h2>Educational Programs Available</h2>
        </Link>
        <Collapse isOpen={isOpen === 2}>
          <Row>
            <Col sm={12} className='py-2'>
              <CheckBoxes
                invalid={this.hasErrors('study_choice')}
                type='checkbox'
                id='study_choice'
                title='Please select your top 3 choices for programs to study in Canada'
                required
                options={studyOption}
                onSelect={this.onChange}
              />
            </Col>

            <Col sm={12} className='text-right'>
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
      userData: { referee, message },
    } = this.state

    return (
      <div className='section mb-2 p-3'>
        <Link
          className={`${(isOpen === 3 && 'active') || ''} collapse-btn`}
          onClick={() => this.toggleStep(3)}
          to='#'
        >
          <h2>Questions and comments</h2>
        </Link>
        <Collapse isOpen={isOpen === 3}>
          <Row>
            <Col sm={12} className='py-2'>
              <SelectGroup
                invalid={this.hasErrors('referee')}
                id='referee'
                name='referee'
                value={referee}
                options={refreeOptions}
                placeholder='PLS SELECT'
                onSelect={this.onChange}
                required
                label='How did you hear about us?'
              />
            </Col>
            <Col sm={12} className='py-2'>
              <TextInputGroup
                invalid={this.hasErrors('message')}
                label='Message'
                name='message'
                value={message}
                type='textarea'
                isEmail
                onChange={this.onChange}
                rows={5}
              />
            </Col>
          </Row>

          <Row className='mt-2'>
            <Col className='text-right'>
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
      <MainLayout title='Student' showMenu>
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

export default Study

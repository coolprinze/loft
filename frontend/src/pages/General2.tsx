import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { toast } from 'react-toastify'
import { Button, Card, CardBody, Col, Collapse, Row } from 'reactstrap'
import validator from 'validator'
import { addGeneralImmigrant } from '../actions/General'
import {
  DateInputGroup,
  RadioInput,
  SelectGroup,
  TextInputGroup,
} from '../components/Form'
import Loading from '../components/Loading'
import MainLayout from '../layouts/MainLayout'
import {
  qualification,
  experience,
  languageProficiency,
} from '../types/business'

export const maritalOptions = [
  {
    label: 'Married / Common-Law Partnership',
    id: 'married',
    value: 'true',
  },
  {
    label: 'Unmarried',
    id: 'single',
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

const spouseExperiencedOptions = [
  {
    label: 'Yes',
    id: 'sexperienced',
    value: 'true',
  },
  {
    label: 'No',
    id: 'snotexperienced',
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

export const experiencedOptions = [
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

export const jobOptions = [
  {
    label: 'Yes',
    id: 'havejob',
    value: 'true',
  },
  {
    label: 'No',
    id: 'notjob',
    value: 'false',
  },
]

const familyOptions = [
  {
    label: 'Yes',
    id: 'family',
    value: 'true',
  },
  {
    label: 'No',
    id: 'notfamily',
    value: 'false',
  },
]

const criminalOptions = [
  {
    label: 'Yes',
    id: 'criminal',
    value: 'true',
  },
  {
    label: 'No',
    id: 'notcriminal',
    value: 'false',
  },
]

const medicalOptions = [
  {
    label: 'Yes',
    id: 'medical',
    value: 'true',
  },
  {
    label: 'No',
    id: 'notmedical',
    value: 'false',
  },
]

const proficiencies = [
  { name: 'High', value: 'High' },
  { name: 'Moderate', value: 'Moderate' },
  { name: 'Basic', value: 'Basic' },
]

const initialState = {
  isOpen: 1,
  userData: {
    first_name: '',
    last_name: '',
    email: '',
    citizenshipId: undefined,
    residenceId: undefined,
    dob: '',
    married: '',
    children: '',
    phone: '',
    qualifications: [],
    work_histories: [],
    job_offer: null,
    family_in_canada: null,
    criminal_record: null,
    medical_condition: null,
    comment: '',
    language_proficiencies: [
      {
        languageId: null,
        level: '',
      },
    ],
    spouse: {
      dob: undefined,
      work_histories: [],
      qualifications: [],
      language_proficiencies: [
        {
          languageId: null,
          level: '',
        },
      ],
    },
  },
  experienced: null,
  educated: null,
  spouseExperienced: null,
  spouseEducated: null,
  jobs: [],
  loading: false,
  // eslint-disable-next-line @typescript-eslint/no-array-constructor
  errors: new Array(),
}

class General extends Component<{
  countries: { name: string; value: number }[]
  languages: { name: string; value: number }[]
  degrees: { name: string; value: number }[]
  occupations: { name: string; value: number }[]
}> {
  enableKeyboard = () => (document.onkeypress = () => true)
  disableKeyboard = () => (document.onkeypress = () => false)
  state = initialState

  componentDidMount() {}

  hasErrors = (key: string, errors = this.state.errors) => errors.includes(key)

  toggleStep = (val: number) => this.validateStep(val - 1)

  validateStep = (val: number) => {
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

    const validateExperience = (
      work_histories: experience[],
      type: string = ''
    ) => {
      if (type === 's' ? spouseExperienced : experienced)
        work_histories.map((experience, index) => {
          let { from, to, employer, city, occupationId, countryId } = experience
          errors.push([])

          !from && errors[index].push(`${type}from`)
          !to && errors[index].push(`${type}to`)
          !employer && errors[index].push(`${type}employer`)
          !city && errors[index].push(`${type}city`)
          !validator.isNumeric(`${occupationId}`) &&
            errors[index].push(`${type}occupationId`)
          !validator.isNumeric(`${countryId}`) &&
            errors[index].push(`${type}countryId`)
          return null
        })
      else errors.push(`${type}experienced`)

      return !errors.find((error: any) => error.length) || false
    }

    const validateLanguage = (
      languages: languageProficiency[],
      type: string = ''
    ) => {
      languages.map((language, index) => {
        let { languageId, level } = language

        errors.push([])

        !level && errors[index].push(`${type}level`)
        !validator.isNumeric(`${languageId}`) &&
          errors[index].push(`${type}languageId`)
        return null
      })

      return !errors.find((error: any) => error.length) || false
    }
    let {
      userData: {
        first_name,
        last_name,
        email,
        citizenshipId,
        residenceId,
        dob,
        married,
        children,
        phone: phn,
        qualifications,
        work_histories,
        job_offer,
        family_in_canada,
        criminal_record,
        medical_condition,
        language_proficiencies,
        spouse,
      },
      educated,
      experienced,
      spouseEducated,
      spouseExperienced,
    } = this.state
    const errors: any = []
    if (val === 1) {
      const phone = phn.replace(/\D/g, '').slice(-10)

      !first_name && errors.push('first_name')
      !last_name && errors.push('last_name')
      !citizenshipId && errors.push('citizenshipId')
      !residenceId && errors.push('residenceId')
      !dob && errors.push('dob')
      !married && errors.push('married')
      !validator.isEmail(email) && errors.push('email')
      !validator.isNumeric(`${children}`) && errors.push('children')
      !validator.isMobilePhone(phone) && errors.push('phone')

      if (!errors.length) {
        this.setState({ isOpen: 2 })
      }
    } else if (val === 2) {
      if (validateQualification(qualifications)) {
        this.setState({ isOpen: 3, errors: [] })
      }
    } else if (val === 3) {
      if (validateExperience(work_histories)) {
        this.setState({ isOpen: 4, errors: [] })
      }
    } else if (val === 4) {
      if (validateLanguage(language_proficiencies)) {
        this.setState({ isOpen: married === 'true' ? 5 : 6 })
      }
    } else if (val === 5) {
      if (married === 'true') {
        let {
          dob,

          qualifications,
          work_histories,
          language_proficiencies,
        } = spouse

        validateExperience(work_histories, 's')

        validateQualification(qualifications, 's')

        validateLanguage(language_proficiencies, 's')
        !dob && errors.push('sdob')
      } else {
        this.validateStep(4)
        return
      }

      if (!errors.find((error: any) => error.length)) {
        this.setState({ isOpen: 6, errors: [] })
      }
    } else if (val === 6) {
      !job_offer && errors.push('job_offer')
      !family_in_canada && errors.push('family_in_canada')
      !criminal_record && errors.push('criminal_record')
      !medical_condition && errors.push('medical_condition')

      if (!errors.length) {
        this.setState({ loading: true }, this.onSubmit)
      }
    } else {
      this.setState({ isOpen: 1 })
    }
    this.setState({ errors })
  }

  onSubmit = () => {
    let {
      userData,
      userData: { married, spouse },
    } = this.state

    let data = { ...userData, spouse: married === 'true' ? spouse : null }

    addGeneralImmigrant(data)
      .then((res) => {
        this.setState(initialState, () => {
          toast('Your request have been logged')
          window.location.href = '/thank-you-gen'
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
    else if (e.target.name === 'married')
      this.setState({
        userData: {
          ...userData,
          [e.target.name]: ['age', 'children'].includes(e.target.name)
            ? parseInt(e.target.value)
            : e.target.value,
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
    const userData = this.state.userData,
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
        educated: type === '' ? 'true' : this.state.educated,
        spouseEducated: type === 's' ? 'true' : this.state.spouseEducated,
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

  onChangeEducated = (e?: any, type: string = '') => {
    if (e.target.value === 'true') {
      type === 's' ? this.addQualification('s') : this.addQualification()
    } else {
      const { userData } = this.state
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
        educated: type === '' ? 'false' : this.state.educated,
        spouseEducated: type === 's' ? 'false' : this.state.spouseEducated,
      })
    }
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
            value={`${q.countryId}`}
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

  /*------------------------------------*/
  /*------- Experience Functions -------*/
  /*------------------------------------*/
  addExperience = (type: string = '') => {
    let work_histories =
      type === 's'
        ? this.state.userData.spouse.work_histories
        : this.state.userData.work_histories

    const errors: any = []

    work_histories.map((experience, index) => {
      let { from, to, employer, city, occupationId, countryId } = experience
      errors.push([])

      !from && errors[index].push(`${type}from`)
      !to && errors[index].push(`${type}to`)
      !employer && errors[index].push(`${type}employer`)
      !city && errors[index].push(`${type}city`)
      !validator.isNumeric(`${occupationId}`) &&
        errors[index].push(`${type}occupationId`)
      !validator.isNumeric(`${countryId}`) &&
        errors[index].push(`${type}countryId`)
      return null
    })

    const userData = this.state.userData
    if (!errors.find((error: any) => error.length)) {
      this.setState({
        userData:
          type === 's'
            ? {
                ...userData,
                spouse: {
                  ...userData.spouse,
                  work_histories: [
                    ...userData.spouse.work_histories,
                    {
                      duration: null,
                      job: '',
                      type: '',
                      location: '',
                    },
                  ],
                },
              }
            : {
                ...this.state.userData,
                work_histories: [
                  ...this.state.userData.work_histories,
                  {
                    duration: null,
                    job: '',
                    type: '',
                    location: '',
                  },
                ],
              },
        errors: [],
        experienced: type === '',
        spouseExperienced: type === 's',
      })
    } else {
      this.setState({ loading: false, errors })
    }
  }

  removeExperience = (index: number, type: string = '') => {
    let work_histories =
      type === 's'
        ? this.state.userData.spouse.work_histories
        : this.state.userData.work_histories

    work_histories.splice(index, 1)

    const userData = this.state.userData

    this.setState({
      userData:
        type === 's'
          ? { ...userData, spouse: { ...userData.spouse, work_histories } }
          : { ...userData, work_histories },
    })
  }

  onChangeExperience = (index: number, e?: any, type: string = '') => {
    let work_histories: {}[] =
      type === 's'
        ? this.state.userData.spouse.work_histories
        : this.state.userData.work_histories

    work_histories[index] = {
      ...work_histories[index],
      [e.target.name]: e.target.value,
    }

    const userData = this.state.userData

    this.setState({
      userData:
        type === 's'
          ? { ...userData, spouse: { ...userData.spouse, work_histories } }
          : { ...userData, work_histories },
    })
  }

  onChangeExperienced = (e?: any, type: string = '') => {
    this.onChange(e, type)
    if (e.target.value === 'true') this.addExperience(type)
    else {
      this.setState({
        userData:
          type === 's'
            ? {
                ...this.state.userData,
                spouse: {
                  ...this.state.userData.spouse,
                  work_histories: [],
                },
              }
            : {
                ...this.state.userData,
                work_histories: [],
              },
        experienced: type === '' ? 'false' : this.state.experienced,
        spouseExperienced:
          type === 's' ? 'false' : this.state.spouseExperienced,
      })
    }
  }

  experience = (data: experience, index: number, title: string, type = '') => {
    const { countries, occupations: jobs } = this.props
    const { errors } = this.state

    return (
      <Col sm={6} className='py-3'>
        <div className='p-4 bg-light'>
          <h5>
            <strong>{title}</strong>
            <Button
              size='sm'
              outline
              className='btn float-right btn-outline-secondary'
              onClick={() => index && this.removeExperience(index, type)}
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
                value={data.from}
                autoComplete='off'
                id={`${type}from`}
                onChange={(e) =>
                  this.onChangeExperience(
                    index,
                    {
                      ...e,
                      target: { ...e.target, name: `from` },
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
                value={data.to}
                autoComplete='off'
                name={`to`}
                id={`${type}to`}
                onChange={(e) =>
                  this.onChangeExperience(
                    index,
                    {
                      ...e,
                      target: { ...e.target, name: `to` },
                    },
                    type
                  )
                }
                required
              />
            </Col>
          </Row>

          <TextInputGroup
            invalid={this.hasErrors(`${type}employer`, errors[index])}
            label='Employer'
            name={`employer`}
            id={`${type}employer`}
            value={data.employer}
            required
            type='text'
            onChange={(e: any) => this.onChangeExperience(index, e, type)}
          />

          <TextInputGroup
            invalid={this.hasErrors(`${type}city`, errors[index])}
            label='Employer City'
            name={`city`}
            id={`${type}city`}
            value={data.city}
            required
            type='text'
            onChange={(e: any) => this.onChangeExperience(index, e, type)}
          />
          <SelectGroup
            invalid={this.hasErrors(`${type}occupationId`, errors[index])}
            id={`${type}occupationId`}
            name={`occupationId`}
            value={`${data.occupationId}`}
            options={jobs}
            placeholder='Select Occupation'
            onSelect={(e: any) => this.onChangeExperience(index, e, type)}
            required
            label='Job Role'
          />
          <SelectGroup
            invalid={this.hasErrors(`${type}countryId`, errors[index])}
            id={`${type}countryId`}
            name={`countryId`}
            value={`${data.countryId}`}
            options={countries}
            placeholder='Select Employer Country'
            onSelect={(e: any) => this.onChangeExperience(index, e, type)}
            required
            label='Employer Country'
          />
        </div>
      </Col>
    )
  }

  /*------------------------------------*/
  /*-------- Language Functions --------*/
  /*------------------------------------*/
  addLanguage = (type: string = '') => {
    const { userData } = this.state,
      { language_proficiencies } = type === 's' ? userData.spouse : userData,
      newLanguage = { languageId: null, level: '' }

    const errors: any = []

    language_proficiencies.map((language, index) => {
      let { languageId, level } = language

      errors.push([])

      !level && errors[index].push(`${type}level`)
      !validator.isNumeric(`${languageId}`) &&
        errors[index].push(`${type}languageId`)
      return null
    })

    if (!errors.find((error: any) => error.length)) {
      this.setState({
        userData:
          type === 's'
            ? {
                ...userData,
                spouse: {
                  ...userData.spouse,
                  language_proficiencies: [
                    ...userData.spouse.language_proficiencies,
                    newLanguage,
                  ],
                },
              }
            : {
                ...userData,
                language_proficiencies: [
                  ...userData.language_proficiencies,
                  newLanguage,
                ],
              },
        errors: [],
      })
    } else {
      this.setState({ loading: false, errors })
    }
  }

  removeLanguage = (index: number, type: string = '') => {
    const { userData } = this.state,
      { language_proficiencies } = type === 's' ? userData.spouse : userData
    language_proficiencies.splice(index, 1)

    this.setState({
      userData:
        type === 's'
          ? {
              ...userData,
              spouse: { ...userData.spouse, language_proficiencies },
            }
          : { ...userData, language_proficiencies },
    })
  }

  onChangeLanguage = (index: number, e?: any, type: string = '') => {
    const { userData } = this.state,
      { language_proficiencies } = type === 's' ? userData.spouse : userData

    language_proficiencies[index] = {
      ...language_proficiencies[index],
      [e.target.name]: e.target.value,
    }

    this.setState({
      userData:
        type === 's'
          ? {
              ...userData,
              spouse: { ...userData.spouse, language_proficiencies },
            }
          : { ...userData, language_proficiencies },
    })
  }

  language = (
    { level, languageId }: languageProficiency,
    index: number,
    type = ''
  ) => {
    const { languages } = this.props
    const { errors, userData } = this.state

    const selectedProf =
        type === 's'
          ? userData.spouse.language_proficiencies
          : userData.language_proficiencies,
      availableOption = languages.map((lang) =>
        selectedProf.some((_lang) => _lang.languageId == lang.value)
          ? { ...lang, disabled: true }
          : lang
      )

    return (
      <Col sm={6} className='py-3'>
        <div className='p-2 bg-light'>
          <h5>
            <strong>Language {index + 1}</strong>
            <Button
              size='sm'
              outline
              className='btn float-right btn-outline-secondary'
              onClick={() => index && this.removeLanguage(index, type)}
            >
              x
            </Button>
          </h5>

          <Row className='mx-0'>
            <Col sm={6} className='px-1'>
              <SelectGroup
                invalid={this.hasErrors(`${type}languageId`, errors[index])}
                id={`${type}languageId`}
                name='languageId'
                value={languageId}
                options={availableOption}
                placeholder='PLEASE SELECT'
                onSelect={(e) => this.onChangeLanguage(index, e, type)}
                required
                label={index ? 'Known language' : 'First official language'}
              />
            </Col>
            <Col sm={6} className='px-1'>
              <SelectGroup
                invalid={this.hasErrors(`${type}level`, errors[index])}
                id={`${type}level`}
                name='level'
                value={level}
                options={proficiencies}
                placeholder='PLEASE SELECT'
                onSelect={(e) => this.onChangeLanguage(index, e, type)}
                required
                label='Proficiency'
              />
            </Col>
          </Row>
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
          dob,
          children,
          phone,
        },
      } = this.state,
      { countries } = this.props

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
                value={residenceId}
                options={countries}
                placeholder='SELECT A COUNTRY'
                onSelect={this.onChange}
                required
                label='Country of Residence'
              />
            </Col>
            <Col md={4} sm={6} className='py-1'>
              <DateInputGroup
                invalid={this.hasErrors('dob')}
                label='Date of Birth'
                onFocus={this.disableKeyboard}
                onBlur={this.enableKeyboard}
                autoComplete='off'
                name='dob'
                value={dob}
                id='dob'
                onChange={(e) =>
                  this.onChange({
                    ...e,
                    target: { ...e.target, name: 'dob' },
                  })
                }
                required
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
            <Col md={4} sm={6} className='py-1'>
              <TextInputGroup
                invalid={this.hasErrors('children')}
                label='Number of Children'
                name='children'
                value={children}
                required
                type='number'
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
      userData: { qualifications = [] },
    } = this.state

    return (
      <div className='section mb-2 p-3'>
        <Link
          className={`${(isOpen === 2 && 'active') || ''} collapse-btn`}
          onClick={() => this.toggleStep(2)}
          to='#'
        >
          <h2>Your education and training </h2>
        </Link>
        <Collapse isOpen={isOpen === 2}>
          <Row className='row-eq-height'>
            <Col sm={12} className='py-1'>
              <RadioInput
                invalid={this.hasErrors('educated')}
                type='radio'
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
      userData: { work_histories = [] },
    } = this.state

    return (
      <div className='section mb-2 p-3'>
        <Link
          className={`${(isOpen === 3 && 'active') || ''} collapse-btn`}
          onClick={() => this.toggleStep(3)}
          to='#'
        >
          <h2>Work Experience </h2>
        </Link>
        <Collapse isOpen={isOpen === 3}>
          <Row className='row-eq-height'>
            <Col sm={12} className='py-1'>
              <RadioInput
                invalid={this.hasErrors('experienced')}
                type='radio'
                name='experienced'
                id='experienced'
                title='Have you had paid work experience in the last 10 years?'
                inline
                required
                options={experiencedOptions}
                onSelect={this.onChangeExperienced}
              />
            </Col>
          </Row>
          {(work_histories.length && (
            <Card>
              <CardBody className='bg-muted'>
                <Row className='row-eq-height'>
                  {this.experience(
                    work_histories[0],
                    0,
                    'Current (or most recent) Job:'
                  )}
                  {work_histories.map(
                    (experience, index) =>
                      index !== 0 &&
                      this.experience(
                        experience,
                        index,
                        'Current (or most recent) Job:'
                      )
                  )}
                </Row>
                <Button color='secondary' onClick={() => this.addExperience()}>
                  Add More Work Experience
                </Button>
              </CardBody>
            </Card>
          )) ||
            ''}
          <Row className='mt-2'>
            <Col className='text-right'>
              <Button
                color='danger'
                onClick={() => this.validateStep(3)}
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

  section4 = (isOpen: number) => {
    const {
      userData: { language_proficiencies },
    } = this.state

    return (
      <div className='section mb-2 p-3'>
        <Link
          className={`${(isOpen === 4 && 'active') || ''} collapse-btn`}
          onClick={() => this.toggleStep(4)}
          to='#'
        >
          <h2>Canadian Language Proficiency</h2>
        </Link>
        <Collapse isOpen={isOpen === 4}>
          <Row>
            {language_proficiencies.map((language, index) =>
              this.language(language, index)
            )}
          </Row>
          <Button color='secondary' onClick={() => this.addLanguage()}>
            Add Language
          </Button>

          <Row className='mt-2'>
            <Col className='text-right'>
              <Button
                color='danger'
                onClick={() => this.validateStep(4)}
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

  section5 = (isOpen: number) => {
    const {
      userData: {
        spouse: { language_proficiencies, qualifications, work_histories, dob },
      },
    } = this.state

    return (
      <div className='section mb-2 p-3'>
        <Link
          className={`${(isOpen === 5 && 'active') || ''} collapse-btn`}
          onClick={() => this.toggleStep(5)}
          to='#'
        >
          <h2>Spouse</h2>
        </Link>
        <Collapse isOpen={isOpen === 5}>
          <Row className='row-eq-height'>
            <Col md={4} sm={6} className='py-1'>
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
                type='radio'
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

          <Row className='row-eq-height'>
            <Col sm={12} className='py-1'>
              <RadioInput
                invalid={this.hasErrors('sexperienced')}
                type='radio'
                name='experienced'
                id='sexperienced'
                title='Have your spouse had paid work experience in the last 10 years?'
                inline
                required
                options={spouseExperiencedOptions}
                onSelect={(e: any) => this.onChangeExperienced(e, 's')}
              />
            </Col>
          </Row>
          {(work_histories.length && (
            <Card>
              <CardBody className='bg-muted'>
                <Row className='row-eq-height'>
                  {this.experience(
                    work_histories[0],
                    0,
                    'Current (or most recent) Job:',
                    's'
                  )}
                  {work_histories.map(
                    (experience, index) =>
                      index !== 0 &&
                      this.experience(
                        experience,
                        index,
                        'Current (or most recent) Job:',
                        's'
                      )
                  )}
                </Row>
                <Button
                  color='secondary'
                  onClick={() => this.addExperience('s')}
                >
                  Add More Work Experience
                </Button>
              </CardBody>
            </Card>
          )) ||
            ''}
          <Row>
            {language_proficiencies.map((language, index) =>
              this.language(language, index, 's')
            )}
          </Row>
          <Button color='secondary' onClick={() => this.addLanguage('s')}>
            Add Language
          </Button>

          <Row className='mt-2'>
            <Col className='text-right'>
              <Button
                color='danger'
                onClick={() => this.validateStep(5)}
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

  section6 = (isOpen: number) => {
    const {
      userData: { comment },
    } = this.state
    return (
      <div className='section mb-2 p-3'>
        <Link
          className={`${(isOpen === 6 && 'active') || ''} collapse-btn`}
          onClick={() => this.toggleStep(6)}
          to='#'
        >
          <h2>Other</h2>
        </Link>
        <Collapse isOpen={isOpen === 6}>
          <strong>
            Please select all statements that apply to you or any of your
            accompanying family members:
          </strong>
          <Row>
            <Col sm={12} className='py-3'>
              <RadioInput
                invalid={this.hasErrors('job_offer')}
                type='radio'
                name='job_offer'
                id='job_offer'
                title='Do you have a written job offer from a Canadian employer?'
                inline
                required
                options={jobOptions}
                onSelect={this.onChange}
              />
            </Col>
            <Col sm={12} className='py-3'>
              <RadioInput
                invalid={this.hasErrors('family_in_canada')}
                type='radio'
                name='family_in_canada'
                id='family_in_canada'
                title='Do you, or your Spouse/Common-Law Partner, have any family members and or extended relatives living in Canada?'
                inline
                required
                options={familyOptions}
                onSelect={this.onChange}
              />
            </Col>
            <Col sm={12} className='py-3'>
              <RadioInput
                invalid={this.hasErrors('criminal_record')}
                type='radio'
                name='criminal_record'
                id='criminal_record'
                title='I have a criminal record'
                inline
                required
                options={criminalOptions}
                onSelect={this.onChange}
              />
            </Col>
            <Col sm={12} className='py-3'>
              <RadioInput
                invalid={this.hasErrors('medical_condition')}
                type='radio'
                name='medical_condition'
                id='medical_condition'
                title='I have a serious medical condition'
                inline
                required
                options={medicalOptions}
                onSelect={this.onChange}
              />
            </Col>
            <Col sm={12} className='py-2'>
              <TextInputGroup
                invalid={this.hasErrors('message')}
                label='Questions and comments'
                name='comment'
                id='comment'
                value={comment}
                type='textarea'
                isEmail
                onChange={this.onChange}
                rows={5}
              />
            </Col>
          </Row>

          <Row className='mt-2'>
            <Col>
              <Button
                color='danger'
                onClick={() => this.validateStep(6)}
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
      <MainLayout showMenu>
        <>
          <Loading show={loading} />
          <div>
            {this.section1(isOpen)}
            {this.section2(isOpen)}
            {this.section3(isOpen)}
            {this.section4(isOpen)}
            {married === 'true' && this.section5(isOpen)}
            {this.section6(isOpen)}
          </div>
        </>
      </MainLayout>
    )
  }
}

export default General

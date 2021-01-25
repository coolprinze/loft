import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import { toast } from 'react-toastify'
import { Button, Card, CardBody, Col, Collapse, Row } from 'reactstrap'
import validator from 'validator'
import { addApplicant } from '../actions/General'
import { RadioInput, SelectGroup, TextInputGroup } from '../components/Form'
import Loading from '../components/Loading'
import MainLayout from '../layouts/MainLayout'
import Countries from '../static/countries'
import Occupations from '../static/occupations'
import { errorKey } from '../types'

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

const educationProgram = [
  { name: 'Ph.D', value: 'Ph.D' },
  { name: "Master's", value: "Master's" },
  { name: 'HND', value: 'HND' },
  { name: "Bachelor's - 4 years", value: "Bachelor's - 4 years" },
  { name: "Bachelor's - 3 years", value: "Bachelor's - 3 years" },
  { name: '3 year degree', value: '3 year degree' },
  { name: '2 year degree', value: '2 year degree' },
  { name: '1 year degre', value: '1 year degre' },
  { name: 'Other', value: 'Other' },
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

export const Languages = [
  { name: 'English', value: 'English' },
  { name: 'French', value: 'French' },
  { name: 'Spanish', value: 'Spanish' },
]

const initialState = {
  isOpen: 1,
  userData: {
    fname: '',
    lname: '',
    email: '',
    citizenship: '',
    residence: '',
    age: '',
    married: '',
    children: '',
    phone: '',
    qualifications: [],
    experiences: [],
    job_offer: null,
    family_in_canada: null,
    criminal_record: null,
    medical_condition: null,
    comment: '',
    language1: '',
    proficiency1: '',
    language2: '',
    proficiency2: '',
    spouse: {
      age: '',
      experiences: [],
      qualifications: [],
      language1: '',
      proficiency1: '',
      language2: '',
      proficiency2: '',
    },
  },
  experienced: null,
  educated: null,
  spouseExperienced: null,
  spouseEducated: null,
  countries: Countries,
  jobs: Occupations.map((occup) => ({ value: occup, name: occup })),
  languages: Languages,
  loading: false,
  // eslint-disable-next-line @typescript-eslint/no-array-constructor
  errors: new Array(),
}

class General extends Component {
  state = initialState

  hasErrors = (key: errorKey, errors = this.state.errors) =>
    errors.includes(key)

  toggleStep = (val: number) => this.validateStep(val - 1)

  validateStep = (val: number) => {
    let {
      userData: {
        fname,
        lname,
        email,
        citizenship,
        residence,
        age,
        married,
        children,
        phone: phn,
        qualifications,
        experiences,
        job_offer,
        family_in_canada,
        criminal_record,
        medical_condition,
        language1,
        proficiency1,
        language2,
        proficiency2,
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

      !fname && errors.push('fname')
      !lname && errors.push('lname')
      !citizenship && errors.push('citizenship')
      !residence && errors.push('residence')
      !age && errors.push('age')
      !married && errors.push('married')
      !validator.isEmail(email) && errors.push('email')
      !validator.isNumeric(`${age}`) && errors.push('age')
      !validator.isNumeric(`${children}`) && errors.push('children')
      !validator.isMobilePhone(phone) && errors.push('phone')

      this.setState({
        userData: {
          ...this.state.userData,
          spouse: married === 'true' ? initialState.userData.spouse : null,
        },
      })

      if (!errors.length) {
        this.setState({ isOpen: 2 })
      }
    } else if (val === 2) {
      educated
        ? qualifications.map((qualification, index) => {
            let { program, course, country } = qualification
            errors.push([])

            !program && errors[index].push('program')
            !course && errors[index].push('course')
            !country && errors[index].push('country')
            return null
          })
        : errors.push('educated')

      if (!errors.find((error: any) => error.length)) {
        this.setState({ isOpen: 3, errors: [] })
      }
    } else if (val === 3) {
      experienced
        ? experiences.map((experience, index) => {
            let { duration, job, type } = experience
            errors.push([])

            !duration && errors[index].push('duration')
            !job && errors[index].push('job')
            !type && errors[index].push('type')
            return null
          })
        : errors.push('experienced')

      if (!errors.find((error: any) => error.length)) {
        this.setState({ isOpen: 4, errors: [] })
      }
    } else if (val === 4) {
      !language1 && errors.push('language1')
      !proficiency1 && errors.push('proficiency1')
      if (language2 && language2 !== 'None') {
        !language2 && errors.push('language2')
        !proficiency2 && errors.push('proficiency2')
      }

      if (!errors.length || married === 'false') {
        this.setState({ isOpen: married === 'true' ? 5 : 6 })
      }
    } else if (val === 5) {
      if (married === 'true') {
        let {
          age,

          qualifications,
          experiences,

          language1,
          proficiency1,
          language2,
          proficiency2,
        } = spouse

        spouseExperienced
          ? experiences.map((experience, index) => {
              let { duration, job, type, location } = experience

              !duration && errors.push('sexperienced')
              !job && errors.push('sexperienced')
              !type && errors.push('sexperienced')
              !location && errors.push('sexperienced')
              return null
            })
          : errors.push('sexperienced')

        spouseEducated
          ? qualifications.map((qualification, index) => {
              let { program, course, country } = qualification

              !program && errors.push('seducated')
              !course && errors.push('seducated')
              !country && errors.push('seducated')
              return null
            })
          : errors.push('seducated')

        !language1 && errors.push('slanguage1')
        !proficiency1 && errors.push('sproficiency1')
        !age && errors.push('sage')
        !validator.isNumeric(`${age}`) && errors.push('sage')
        if (language2 && language2 !== 'None') {
          !language2 && errors.push('slanguage2')
          !proficiency2 && errors.push('sproficiency2')
        }
      } else {
        this.validateStep(4)
        return
      }

      if (!errors.length) {
        this.setState({ isOpen: 6 })
      }

      console.log('Hey', this.state)
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

  onSubmit = () =>
    addApplicant(this.state.userData)
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

  addQualification = () => {
    const {
      userData: { qualifications },
    } = this.state
    const errors: any = []

    qualifications.map((qualification, index) => {
      let { program, course, country } = qualification
      errors.push([])

      !program && errors[index].push('program')
      !course && errors[index].push('course')
      !country && errors[index].push('country')
      return null
    })

    if (!errors.find((error: any) => error.length)) {
      console.log('add')

      this.setState({
        userData: {
          ...this.state.userData,
          qualifications: [
            ...this.state.userData.qualifications,
            {
              program: '',
              course: '',
              country: '',
            },
          ],
        },
        errors: [],
        educated: 'true',
      })
    } else {
      this.setState({ loading: false, errors })
    }
  }

  addSpouseQualification = () => {
    const {
      userData: {
        spouse: { qualifications },
      },
    } = this.state
    const errors: any = []

    qualifications.map((qualification, index) => {
      let { program, course, country } = qualification
      errors.push([])

      !program && errors[index].push('sprogram')
      !course && errors[index].push('scourse')
      !country && errors[index].push('scountry')
      return null
    })

    if (!errors.find((error: any) => error.length)) {
      console.log('add')

      const userData = this.state.userData

      this.setState({
        userData: {
          ...userData,
          spouse: {
            ...userData.spouse,
            qualifications: [
              ...userData.spouse.qualifications,
              {
                program: '',
                course: '',
                country: '',
              },
            ],
          },
        },
        errors: [],
        spouseEducated: 'true',
      })
    } else {
      this.setState({ loading: false, errors })
    }
  }

  removeQualification = (index: number) => {
    let quals = this.state.userData.qualifications

    quals.splice(index, 1)

    this.setState({
      userData: {
        ...this.state.userData,
        qualifications: quals,
      },
    })
  }

  removeSpouseQualification = (index: number) => {
    let quals = this.state.userData.spouse.qualifications

    quals.splice(index, 1)

    this.setState({
      userData: {
        ...this.state.userData,
        spouse: { ...this.state.userData.spouse, qualifications: quals },
      },
    })
  }

  addExperience = () => {
    const {
      userData: { experiences },
    } = this.state
    const errors: any = []

    experiences.map((experience, index) => {
      let { duration, job, type, location } = experience
      errors.push([])

      !duration && errors[index].push('duration')
      !job && errors[index].push('job')
      !type && errors[index].push('type')
      !location && errors[index].push('location')
      !validator.isNumeric(`${duration}`) && errors[index].push('duration')
      return null
    })

    if (!errors.find((error: any) => error.length)) {
      this.setState({
        userData: {
          ...this.state.userData,
          experiences: [
            ...this.state.userData.experiences,
            {
              duration: null,
              job: '',
              type: '',
              location: '',
            },
          ],
        },
        errors: [],
        experienced: 'true',
      })
    } else {
      this.setState({ loading: false, errors })
    }
  }

  addSpouseExperience = () => {
    const {
      userData: {
        spouse: { experiences },
      },
    } = this.state
    const errors: any = []

    experiences.map((experience, index) => {
      let { duration, job, type, location } = experience
      errors.push([])

      !duration && errors[index].push('sduration')
      !job && errors[index].push('sjob')
      !type && errors[index].push('stype')
      !location && errors[index].push('slocation')
      !validator.isNumeric(`${duration}`) && errors[index].push('sduration')
      return null
    })

    if (!errors.find((error: any) => error.length)) {
      const userData = this.state.userData
      this.setState({
        userData: {
          ...userData,
          spouse: {
            ...userData.spouse,
            experiences: [
              ...userData.spouse.experiences,
              {
                duration: null,
                job: '',
                type: '',
                location: '',
              },
            ],
          },
        },
        errors: [],
        spouseExperienced: 'true',
      })
    } else {
      this.setState({ loading: false, errors })
    }
  }

  removeExperience = (index: number) => {
    let experiences = this.state.userData.experiences

    experiences.splice(index, 1)

    this.setState({
      userData: {
        ...this.state.userData,
        experiences,
      },
    })
  }

  removeSpouseExperience = (index: number) => {
    let experiences = this.state.userData.spouse.experiences

    experiences.splice(index, 1)

    const userData = this.state.userData

    this.setState({
      userData: {
        ...userData,
        spouse: { ...userData.spouse, experiences },
      },
    })
  }

  onChange = (e?: any) => {
    if (e.target.name === 'married')
      this.setState({
        userData: {
          ...this.state.userData,
          [e.target.name]: ['age', 'children'].includes(e.target.name)
            ? parseInt(e.target.value)
            : e.target.value,
          spouse: {
            age: null,
            experiences: [],
            qualifications: [],
            language1: '',
            proficiency1: '',
            language2: '',
            proficiency2: '',
          },
        },
      })
    else
      this.setState({
        userData: {
          ...this.state.userData,
          [e.target.name]: ['age', 'children'].includes(e.target.name)
            ? parseInt(e.target.value)
            : e.target.value,
        },
      })
  }

  onSpouseChange = (e?: any) => {
    const userData = this.state.userData
    this.setState({
      userData: {
        ...userData,
        spouse: {
          ...userData.spouse,
          [e.target.name]: ['age'].includes(e.target.name)
            ? parseInt(e.target.value)
            : e.target.value,
        },
      },
    })
  }

  onChangeQualification = (index: number, e?: any) => {
    let quals: { program: string; course: string; country: string }[] = this
      .state.userData.qualifications
    quals[index] = {
      ...quals[index],
      [e.target.name]: e.target.value,
    }

    this.setState({
      userData: { ...this.state.userData, qualifications: quals },
    })
  }

  onChangeSpouseQualification = (index: number, e?: any) => {
    let quals: { program: string; course: string; country: string }[] = this
      .state.userData.spouse.qualifications
    quals[index] = {
      ...quals[index],
      [e.target.name]: e.target.value,
    }
    const userData = this.state.userData

    this.setState({
      userData: {
        ...userData,
        spouse: { ...userData.spouse, qualifications: quals },
      },
    })
  }

  onChangeExperience = (index: number, e?: any) => {
    let experiences: {
      program: string
      course: string
      country: string
    }[] = this.state.userData.experiences
    experiences[index] = {
      ...experiences[index],
      [e.target.name]:
        e.target.name === 'duration'
          ? parseInt(e.target.value)
          : e.target.value,
    }

    this.setState({
      userData: { ...this.state.userData, experiences },
    })
  }

  onChangeSpouseExperience = (index: number, e?: any) => {
    let experiences: {}[] = this.state.userData.spouse.experiences
    experiences[index] = {
      ...experiences[index],
      [e.target.name]:
        e.target.name === 'duration'
          ? parseInt(e.target.value)
          : e.target.value,
    }

    const userData = this.state.userData

    this.setState({
      userData: { ...userData, spouse: { ...userData.spouse, experiences } },
    })
  }

  onChangeEducated = (e?: any) => {
    if (e.target.value === 'true') {
      this.addQualification()
    } else {
      this.setState({
        userData: {
          ...this.state.userData,
          qualifications: [],
        },
        educated: 'false',
      })
    }
  }

  onChangeSpouseEducated = (e?: any) => {
    if (e.target.value === 'true') {
      this.addSpouseQualification()
    } else {
      this.setState({
        userData: {
          ...this.state.userData,
          spouse: { ...this.state.userData.spouse, qualifications: [] },
        },
        spouseEducated: 'false',
      })
    }
  }
  onChangeExperienced = (e?: any) => {
    this.onChange(e)
    if (e.target.value === 'true') {
      this.addExperience()
    } else {
      this.setState({
        userData: {
          ...this.state.userData,
          experiences: [],
        },
        experienced: 'false',
      })
    }
  }
  onChangeSpouseExperienced = (e?: any) => {
    this.onChange(e)
    if (e.target.value === 'true') {
      this.addSpouseExperience()
    } else {
      this.setState({
        userData: {
          ...this.state.userData,
          spouse: {
            ...this.state.userData.spouse,
            experiences: [],
          },
        },
        experienced: 'false',
      })
    }
  }

  qualification = (
    data: { program: string; course: string; country: string },
    index: number,
    title: string
  ) => {
    const { countries } = this.state

    return (
      <Col sm={6} className='py-3'>
        <div className='p-4 bg-light'>
          <h5>
            <strong>{title}</strong>
            <Button
              size='sm'
              outline
              className='btn float-right btn-outline-secondary'
              onClick={() => index && this.removeQualification(index)}
            >
              x
            </Button>
          </h5>
          <SelectGroup
            invalid={this.hasErrors('program', this.state.errors[index])}
            id='program'
            name='program'
            value={data.program}
            options={educationProgram}
            placeholder='PLEASE SELECT'
            onSelect={(e: any) => this.onChangeQualification(index, e)}
            required
            label='Type of Program'
          />
          <TextInputGroup
            invalid={this.hasErrors('course', this.state.errors[index])}
            label='Course of Study'
            name='course'
            value={data.course}
            required
            onChange={(e: any) => this.onChangeQualification(index, e)}
          />
          <SelectGroup
            invalid={this.hasErrors('country', this.state.errors[index])}
            id='country'
            name='country'
            value={`${data.country}`}
            options={countries}
            placeholder='SELECT A COUNTRY'
            onSelect={(e: any) => this.onChangeQualification(index, e)}
            required
            label='Location'
          />
        </div>
      </Col>
    )
  }

  spouseQualification = (
    data: { program: string; course: string; country: string },
    index: number,
    title: string
  ) => {
    const { countries } = this.state

    return (
      <Col sm={6} className='py-3'>
        <div className='p-4 bg-light'>
          <h5>
            <strong>{title}</strong>
            <Button
              size='sm'
              outline
              className='btn float-right btn-outline-secondary'
              onClick={() => index && this.removeSpouseQualification(index)}
            >
              x
            </Button>
          </h5>
          <SelectGroup
            invalid={this.hasErrors('sprogram', this.state.errors[index])}
            id='sprogram'
            name='program'
            value={data.program}
            options={educationProgram}
            placeholder='PLEASE SELECT'
            onSelect={(e: any) => this.onChangeSpouseQualification(index, e)}
            required
            label='Type of Program'
          />
          <TextInputGroup
            invalid={this.hasErrors('scourse', this.state.errors[index])}
            label='Course of Study'
            name='course'
            value={data.course}
            required
            onChange={(e: any) => this.onChangeSpouseQualification(index, e)}
          />
          <SelectGroup
            invalid={this.hasErrors('scountry', this.state.errors[index])}
            id='scountry'
            name='country'
            value={`${data.country}`}
            options={countries}
            placeholder='SELECT A COUNTRY'
            onSelect={(e: any) => this.onChangeSpouseQualification(index, e)}
            required
            label='Location'
          />
        </div>
      </Col>
    )
  }

  experience = (
    data: {
      duration: number
      job: string
      type: string
      location: string
    },
    index: number,
    title: string
  ) => {
    const { countries, jobs } = this.state

    return (
      <Col sm={6} className='py-3'>
        <div className='p-4 bg-light'>
          <h5>
            <strong>{title}</strong>
            <Button
              size='sm'
              outline
              className='btn float-right btn-outline-secondary'
              onClick={() => index && this.removeExperience(index)}
            >
              x
            </Button>
          </h5>
          <SelectGroup
            invalid={this.hasErrors('job', this.state.errors[index])}
            id='job'
            name='job'
            value={data.job}
            options={jobs}
            placeholder='PLEASE SELECT'
            onSelect={(e: any) => this.onChangeExperience(index, e)}
            required
            label='Occupation'
          />

          <SelectGroup
            invalid={this.hasErrors('type', this.state.errors[index])}
            id='type'
            name='type'
            value={data.type}
            options={[
              { name: 'Full-time', value: 'Full-time' },
              { name: 'Part-time', value: 'Part-time' },
            ]}
            placeholder='PLEASE SELECT'
            onSelect={(e: any) => this.onChangeExperience(index, e)}
            required
            label='Employment Type'
          />
          <TextInputGroup
            invalid={this.hasErrors('duration', this.state.errors[index])}
            label='Work Duration(in years)'
            name='duration'
            value={data.duration}
            required
            type='number'
            onChange={(e: any) => this.onChangeExperience(index, e)}
          />
          <SelectGroup
            invalid={this.hasErrors('location', this.state.errors[index])}
            id='location'
            name='location'
            value={`${data.location}`}
            options={countries}
            placeholder='SELECT A COUNTRY'
            onSelect={(e: any) => this.onChangeExperience(index, e)}
            required
            label='Location'
          />
        </div>
      </Col>
    )
  }

  spouseExperience = (
    data: {
      duration: number
      job: string
      type: string
      location: string
    },
    index: number,
    title: string
  ) => {
    const { countries, jobs } = this.state

    return (
      <Col sm={6} className='py-3'>
        <div className='p-4 bg-light'>
          <h5>
            <strong>{title}</strong>
            <Button
              size='sm'
              outline
              className='btn float-right btn-outline-secondary'
              onClick={() => index && this.removeSpouseExperience(index)}
            >
              x
            </Button>
          </h5>
          <SelectGroup
            invalid={this.hasErrors('sjob', this.state.errors[index])}
            id='sjob'
            name='job'
            value={data.job}
            options={jobs}
            placeholder='PLEASE SELECT'
            onSelect={(e: any) => this.onChangeSpouseExperience(index, e)}
            required
            label='Spouse Occupation'
          />

          <SelectGroup
            invalid={this.hasErrors('stype', this.state.errors[index])}
            id='stype'
            name='type'
            value={data.type}
            options={[
              { name: 'Full-time', value: 'Full-time' },
              { name: 'Part-time', value: 'Part-time' },
            ]}
            placeholder='PLEASE SELECT'
            onSelect={(e: any) => this.onChangeSpouseExperience(index, e)}
            required
            label='Employment Type'
          />
          <TextInputGroup
            invalid={this.hasErrors('sduration', this.state.errors[index])}
            label='Work Duration(in years)'
            name='duration'
            value={data.duration}
            required
            type='number'
            onChange={(e: any) => this.onChangeSpouseExperience(index, e)}
          />
          <SelectGroup
            invalid={this.hasErrors('slocation', this.state.errors[index])}
            id='location'
            name='location'
            value={`${data.location}`}
            options={countries}
            placeholder='SELECT A COUNTRY'
            onSelect={(e: any) => this.onChangeSpouseExperience(index, e)}
            required
            label='Location'
          />
        </div>
      </Col>
    )
  }

  section1 = (isOpen: number) => {
    const {
      countries,
      userData: {
        fname,
        lname,
        email,
        citizenship,
        residence,
        age,
        children,
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
              <SelectGroup
                invalid={this.hasErrors('citizenship')}
                id='citizenship'
                name='citizenship'
                value={citizenship}
                options={countries}
                placeholder='SELECT A COUNTRY'
                onSelect={this.onChange}
                required
                label='Country of Citizenship'
              />
            </Col>
            <Col md={4} sm={6} className='py-1'>
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
                <Button color='secondary' onClick={this.addQualification}>
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
      userData: { experiences = [] },
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
          {(experiences.length && (
            <Card>
              <CardBody className='bg-muted'>
                <Row className='row-eq-height'>
                  {this.experience(
                    experiences[0],
                    0,
                    'Current (or most recent) Job:'
                  )}
                  {experiences.map(
                    (qualif, index) =>
                      index !== 0 &&
                      this.experience(qualif, index, 'Previous Study Program:')
                  )}
                </Row>
                <Button color='secondary' onClick={this.addExperience}>
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
      languages,
      userData: { language1, proficiency1, language2, proficiency2 },
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
            <Col sm={6} lg={3}>
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
            <Col sm={6} lg={3}>
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
            <Col sm={6} lg={3}>
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
              <Col sm={6} lg={3}>
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
          </Row>

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
    console.log(this.state)

    const {
      languages,
      userData: {
        spouse: {
          language1,
          proficiency1,
          language2,
          proficiency2,
          qualifications,
          experiences,
          age,
        },
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
              <TextInputGroup
                invalid={this.hasErrors('sage')}
                label='Age'
                name='age'
                value={age}
                required
                type='number'
                onChange={this.onSpouseChange}
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
                onSelect={this.onChangeSpouseEducated}
              />
            </Col>
          </Row>
          {(qualifications.length && (
            <Card>
              <CardBody className='bg-muted'>
                <Row className='row-eq-height'>
                  {this.spouseQualification(
                    qualifications[0],
                    0,
                    'Spouse Current (or most recent) Program of Study:'
                  )}
                  {qualifications.map(
                    (qualif, index) =>
                      index !== 0 &&
                      this.spouseQualification(
                        qualif,
                        index,
                        'Previous Study Program:'
                      )
                  )}
                </Row>
                <Button color='secondary' onClick={this.addSpouseQualification}>
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
                id='experienced'
                title='Have your spouse had paid work experience in the last 10 years?'
                inline
                required
                options={spouseExperiencedOptions}
                onSelect={this.onChangeSpouseExperienced}
              />
            </Col>
          </Row>
          {(experiences.length && (
            <Card>
              <CardBody className='bg-muted'>
                <Row className='row-eq-height'>
                  {this.spouseExperience(
                    experiences[0],
                    0,
                    'Current (or most recent) Job:'
                  )}
                  {experiences.map(
                    (qualif, index) =>
                      index !== 0 &&
                      this.spouseExperience(
                        qualif,
                        index,
                        'Previous Study Program:'
                      )
                  )}
                </Row>
                <Button color='secondary' onClick={this.addSpouseExperience}>
                  Add More Work Experience
                </Button>
              </CardBody>
            </Card>
          )) ||
            ''}
          <Row>
            <Col sm={6} lg={3}>
              <SelectGroup
                invalid={this.hasErrors('slanguage1')}
                id='slanguage1'
                name='language1'
                value={language1}
                options={languages}
                placeholder='PLEASE SELECT'
                onSelect={this.onSpouseChange}
                required
                label='First official language'
              />
            </Col>
            <Col sm={6} lg={3}>
              <SelectGroup
                invalid={this.hasErrors('sproficiency1')}
                id='sproficiency1'
                name='proficiency1'
                value={proficiency1}
                options={proficiencies}
                placeholder='PLEASE SELECT'
                onSelect={this.onSpouseChange}
                required
                label='Proficiency'
              />
            </Col>
            <Col sm={6} lg={3}>
              <SelectGroup
                invalid={this.hasErrors('slanguage2')}
                id='slanguage2'
                name='language2'
                value={language2}
                options={[{ name: 'None', value: 'None' }, ...languages]}
                placeholder='PLEASE SELECT'
                onSelect={this.onSpouseChange}
                required
                label='Second official language'
              />
            </Col>
            {(language2 && language2 !== 'None' && (
              <Col sm={6} lg={3}>
                <SelectGroup
                  invalid={this.hasErrors('sproficiency2')}
                  id='sproficiency2'
                  name='proficiency2'
                  value={proficiency2}
                  options={proficiencies}
                  placeholder='PLEASE SELECT'
                  onSelect={this.onSpouseChange}
                  required
                  label='Proficiency'
                />
              </Col>
            )) ||
              null}
          </Row>

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
                name='message'
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

import axios from 'axios'
import { useState } from 'react'
import { animateScroll as scroll } from 'react-scroll'
import { toast } from 'react-toastify'
import { Alert, Button, Col, Row } from 'reactstrap'
import validator from 'validator'

import CompanyInfo, { companyInitialState } from '../components/CompanyInfo'
import {
  CustomSelectGroup,
  SelectGroup,
  TextInputGroup,
} from '../components/Form'
import Loading from '../components/Loading'
import { apiURL } from '../config'
import { errHandler, handleErr } from '../helper/errorHandler'
import MainLayout from '../layouts/MainLayout'
import { errorKey } from '../types'

const initialState = {
  ...companyInitialState,
  employees_needed: '',
  positions: [],
  situation: '',
  employees_total: '',
  employees_fulltime: '',
  employees_parttime: '',
}

function CanadianEmployer() {
  const [userData, setUserData] = useState(initialState),
    [errors, setErrors] = useState([]),
    [loading, setLoading] = useState(false),
    [alert, setAlert] = useState(false)

  // @ts-ignore
  const hasErrors = (key: errorKey) => errors.includes(key),
    onChange = (e?: any, type?: 'positions') => {
      setUserData({
        ...userData,
        [type || e.target.name]: !type
          ? e.target.value
          : e.map((_: any) => _.value).join(', '),
      })
    },
    validateStep = () => {
      let {
        company_name,
        contact_person,
        contact_position,
        phone: phn,
        email,
        business_activity,
        location,
        website,
        employees_needed,
        positions,
        situation,
        employees_total,
        employees_fulltime,
        employees_parttime,
      } = userData

      const errors: any = []

      const phone = phn.replace(/\D/g, '').slice(-10)

      !company_name && errors.push('company_name')
      !contact_person && errors.push('contact_person')
      !contact_position && errors.push('contact_position')
      !employees_total && errors.push('employees_total')
      !employees_fulltime && errors.push('employees_fulltime')
      !employees_parttime && errors.push('employees_parttime')
      !employees_needed && errors.push('employees_needed')
      !positions.length && errors.push('positions')
      !situation && errors.push('situation')
      !business_activity && errors.push('business_activity')
      !location && errors.push('location')

      !validator.isURL(website) && errors.push('website')
      !validator.isEmail(email) && errors.push('email')
      !validator.isMobilePhone(phone) && errors.push('phone')

      if (!errors.length)
        // console.log(userData)
        submitHandler()
      else setErrors(errors)
    },
    submitHandler = async () => {
      setLoading(true)

      const data = userData
      // for (const [key, value] of Object.entries(data)) {
      //   if (typeof value === 'string')
      //     if (value.trim().length === 0) {
      //       delete data[key]
      //     }
      // }

      try {
        const config = {
          headers: {
            'Content-Type': 'application/json',
            Accept: 'application/json',
          },
        }
        await axios.post(`${apiURL}/employers/canadian-employers`, data, config)
        toast.success('Submission successful')
        window.location.href = '/thank-you-fw/'
        setUserData(initialState)
        setLoading(false)
      } catch (err) {
        setLoading(false)
        setAlert(handleErr(err))
        errHandler(err, toast.error)
        scroll.scrollTo(100)
      }
    }
  return (
    <MainLayout title='Canadian Employers'>
      <>
        <Loading show={loading} />
        {alert && <Alert alert={alert} toggle={() => setAlert(false)} />}

        <div className='p-3 mb-2 section'>
          <h2>Employment Details</h2>

          <Row>
            <CompanyInfo
              onChange={onChange}
              userData={userData}
              hasErrors={hasErrors}
            />

            <Col sm={6} className='py-1'>
              <TextInputGroup
                required
                invalid={hasErrors('employees_needed')}
                label='How many workers are you looking to hire'
                name='employees_needed'
                value={userData.employees_needed}
                type='number'
                onChange={onChange}
              />
            </Col>
            <Col sm={6} className='py-1'>
              <CustomSelectGroup
                label='What positions are you looking to fill'
                placeholder={'Start typing...'}
                options={[]}
                isMulti
                isClearable
                required
                onSelect={(e) => onChange(e, 'positions')}
                invalid={hasErrors('positions')}
              />
            </Col>

            <Col sm={6} className='py-1'>
              <SelectGroup
                invalid={hasErrors('situation')}
                id='situation'
                name='situation'
                value={userData.situation}
                options={[
                  'I have identified the workers I want to recruit',
                  'I need help identifying candidates for recruitment.',
                ].map((_) => ({ value: _, name: _ }))}
                placeholder='Select...'
                onSelect={onChange}
                required
                label='Recruitment needs'
              />
            </Col>

            <Col sm={6} className='py-1'>
              <TextInputGroup
                required
                invalid={hasErrors('employees_total')}
                label='How many employees do you currently have on your payroll'
                name='employees_total'
                value={userData.employees_total}
                type='number'
                onChange={onChange}
              />
            </Col>

            <Col sm={6} className='py-1'>
              <TextInputGroup
                required
                invalid={hasErrors('employees_fulltime')}
                label='How many are full-time (work 30+ hours per week)'
                name='employees_fulltime'
                value={userData.employees_fulltime}
                type='number'
                onChange={onChange}
              />
            </Col>

            <Col sm={6} className='py-1'>
              <TextInputGroup
                required
                invalid={hasErrors('employees_parttime')}
                label='How many are part-time (work less than 30 hours per week)'
                name='employees_parttime'
                value={userData.employees_parttime}
                type='number'
                onChange={onChange}
              />
            </Col>

            <Col className='mt-3 text-center' sm='12'>
              <Button
                color='danger'
                onClick={() => validateStep()}
                className='px-5'
                size='lg'
              >
                Submit
              </Button>
            </Col>
          </Row>
        </div>
      </>
    </MainLayout>
  )
}

export default CanadianEmployer

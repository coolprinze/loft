import axios from 'axios'
import { useState } from 'react'
import { animateScroll as scroll } from 'react-scroll'
import { toast } from 'react-toastify'
import { Alert, Button, Col, Row } from 'reactstrap'
import validator from 'validator'

import CompanyInfo, { companyInitialState } from '../components/CompanyInfo'
import { TextInputGroup } from '../components/Form'
import Loading from '../components/Loading'
import { apiURL } from '../config'
import { errHandler, handleErr } from '../helper/errorHandler'
import MainLayout from '../layouts/MainLayout'
import { errorKey } from '../types'

const initialState = {
  ...companyInitialState,
  hq_location: '',
  revenue: '',
  employees_total: '',
  managers_to_transfer: '',
  employees_to_transfer: '',
}

function IntlEmployer() {
  const [userData, setUserData] = useState(initialState),
    [errors, setErrors] = useState([]),
    [loading, setLoading] = useState(false),
    [alert, setAlert] = useState(false)

  // @ts-ignore
  const hasErrors = (key: errorKey) => errors.includes(key),
    onChange = (e: any) => {
      setUserData({
        ...userData,
        [e.target.name]: e.target.value,
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
        hq_location,
        revenue,
        employees_total,
        managers_to_transfer,
        employees_to_transfer,
      } = userData

      const errors: any = []

      const phone = phn.replace(/\D/g, '').slice(-10)

      !contact_person && errors.push('contact_person')
      !contact_position && errors.push('contact_position')
      !location && errors.push('location')
      !employees_total && errors.push('employees_total')
      !company_name && errors.push('company_name')
      !managers_to_transfer && errors.push('managers_to_transfer')
      !employees_to_transfer && errors.push('employees_to_transfer')
      !revenue.length && errors.push('revenue')
      !hq_location && errors.push('hq_location')
      !business_activity && errors.push('business_activity')

      !validator.isURL(website) && errors.push('website')
      !validator.isEmail(email) && errors.push('email')
      !validator.isMobilePhone(phone) && errors.push('phone')

      if (!errors.length) submitHandler()
      else {
        console.log(errors)

        setErrors(errors)
      }
    },
    submitHandler = async () => {
      setLoading(true)

      const data = userData

      try {
        const config = {
          headers: {
            'Content-Type': 'application/json',
            Accept: 'application/json',
          },
        }
        await axios.post(`${apiURL}/employers/intl-transfer`, data, config)
        toast.success('Submission successful')
        window.location.href = '/thank-you-ict/'
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
    <MainLayout title='Intra-Company Transfer '>
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
                invalid={hasErrors('hq_location')}
                label='Where is the Headquarters of the company located'
                name='hq_location'
                value={userData.hq_location}
                onChange={onChange}
              />
            </Col>

            <Col sm={6} className='py-1'>
              <TextInputGroup
                required
                invalid={hasErrors('revenue')}
                label='What are your companies annual revenue/turnover'
                name='revenue'
                placeholder='Eg: CA$200,000'
                value={userData.revenue}
                onChange={onChange}
              />
            </Col>

            <Col sm={6} className='py-1'>
              <TextInputGroup
                required
                invalid={hasErrors('employees_total')}
                label='How many employees does the company have on its payroll'
                name='employees_total'
                value={userData.employees_total}
                type='number'
                onChange={onChange}
              />
            </Col>

            <Col sm={6} className='py-1'>
              <TextInputGroup
                required
                invalid={hasErrors('managers_to_transfer')}
                label='Number of senior managers you are looking to transfer to canada to set-up'
                name='managers_to_transfer'
                type='number'
                value={userData.managers_to_transfer}
                onChange={onChange}
              />
            </Col>

            <Col sm={6} className='py-1'>
              <TextInputGroup
                required
                invalid={hasErrors('employees_to_transfer')}
                label='Number of key employees you are looking to transfer to Canada'
                name='employees_to_transfer'
                type='number'
                value={userData.employees_to_transfer}
                onChange={onChange}
              />
            </Col>

            <Col className='mt-3 text-center' sm='12'>
              <Button
                color='danger'
                onClick={validateStep}
                className='px-5'
                size='lg'
              >
                SUBMIT
              </Button>
            </Col>
          </Row>
        </div>
      </>
    </MainLayout>
  )
}

export default IntlEmployer

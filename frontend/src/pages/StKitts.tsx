import axios from 'axios'
import React, { useState } from 'react'
import { Link } from 'react-router-dom'
import { animateScroll as scroll } from 'react-scroll'
import { toast } from 'react-toastify'
import { Button, Col, Collapse, Row } from 'reactstrap'
import validator from 'validator'
import Alert from '../components/Alert'
import { CheckBoxInput, SelectGroup, TextInputGroup } from '../components/Form'
import Loading from '../components/Loading'
import { apiURL } from '../config'
import { errHandler, handleErr } from '../helper/errorHandler'
import MainLayout from '../layouts/MainLayout'
import { errorKey } from '../types'

const StKitts = ({
  countries,
  worthRanges: netWorthRange,
  investRanges: investmentRange,
}: {
  countries: { name: string; value: number }[]
  worthRanges: { name: string; value: number }[]
  investRanges: { name: string; value: number }[]
}) => {
  const preferredCom = [
      'Phone Call',
      'Email',
      'Video Call',
      'Telegram',
      'WhatsApp',
      'Wechat',
    ],
    initialState = {
      first_name: '',
      last_name: '',
      email: '',
      nationality: '',
      residence: '',
      phone: '',
      networth: '',
      invest_funds: '',
      time_slot: '',
      date: '',
      contact_medium: [],
      referee: '',
    }

  const [userData, setUserData] = useState(initialState),
    [errors, setErrors] = useState([]),
    [isOpen, setIsOpen] = useState(1),
    [loading, setLoading] = useState(false),
    [alert, setAlert] = useState(false)

  const toggleStep = (val: number) => validateStep(val - 1),
    validateStep = (val: number) => {
      let {
        first_name,
        last_name,
        email,
        nationality,
        residence,
        phone: phn,
        invest_funds,
        networth,
      } = userData

      const errors: any = []

      if (val === 1) {
        const phone = phn.replace(/\D/g, '').slice(-10)

        !first_name && errors.push('first_name')
        !last_name && errors.push('last_name')
        !nationality && errors.push('nationality')
        !residence && errors.push('residence')
        !validator.isEmail(email) && errors.push('email')
        !validator.isMobilePhone(phone) && errors.push('phone')

        if (!errors.length) setIsOpen(2)
      } else if (val === 2) {
        !invest_funds && errors.push('invest_funds')
        !networth && errors.push('networth')

        if (!errors.length) setIsOpen(3)
      } else if (val === 3) {
        if (!errors.length) {
          setLoading(true)
          submitHandler()
        }
      } else setIsOpen(1)
      setErrors(errors)
    },
    submitHandler = async () => {
      setLoading(true)

      const data: any = userData
      for (const [key, value] of Object.entries(data)) {
        if (typeof value === 'string')
          if (value.trim().length === 0) {
            delete data[key]
          }
      }

      try {
        const config = {
          headers: {
            'Content-Type': 'application/json',
            Accept: 'application/json',
          },
        }
        await axios.post(`${apiURL}/immigrants/StKitts`, data, config)
        toast.success('')
        window.location.href = '/StKitts-thanks'
        setUserData(initialState)
        setLoading(false)
      } catch (err) {
        setLoading(false)
        setAlert(handleErr(err))
        errHandler(err, toast.error)
        scroll.scrollTo(100)
      }
    },
    // @ts-ignore
    hasErrors = (key: errorKey) => errors.includes(key),
    onChange = (e?: any, arg?: string) => {
      if (arg === 'radioOption') {
        let { contact_medium } = userData
        if (e.target.checked)
          //@ts-ignore
          contact_medium.push(e.target.value)
        else {
          contact_medium = contact_medium.filter(
            (interest) => interest !== e.target.value
          )
        }
        setUserData({
          ...userData,
          contact_medium,
        })
      } else
        setUserData({
          ...userData,
          [e.target.name]: e.target.value,
        })
    },
    section1 = (isOpen: number) => {
      const {
        first_name,
        last_name,
        email,
        nationality,
        residence,
        phone,
      } = userData

      return (
        <div className='section mb-2 p-3'>
          <Link
            className={`${(isOpen === 1 && 'active') || ''} collapse-btn`}
            onClick={() => toggleStep(1)}
            to='#'
          >
            <h2>Your Personal Profile</h2>
          </Link>
          <Collapse isOpen={isOpen === 1}>
            <Row>
              <Col md={4} sm={6} className='py-1'>
                <TextInputGroup
                  invalid={hasErrors('first_name')}
                  label='First Name'
                  name='first_name'
                  value={first_name}
                  required
                  onChange={onChange}
                />
              </Col>
              <Col md={4} sm={6} className='py-1'>
                <TextInputGroup
                  invalid={hasErrors('last_name')}
                  label='Last Name'
                  name='last_name'
                  value={last_name}
                  required
                  onChange={onChange}
                />
              </Col>
              <Col md={4} sm={6} className='py-1'>
                <TextInputGroup
                  label='Email Address'
                  name='email'
                  value={email}
                  required
                  isEmail
                  onChange={onChange}
                />
              </Col>
              <Col md={4} sm={6} className='py-1'>
                <SelectGroup
                  invalid={hasErrors('nationality')}
                  id='nationality'
                  name='nationality'
                  value={nationality}
                  options={countries}
                  placeholder='SELECT A COUNTRY'
                  onSelect={onChange}
                  required
                  label='Country of Citizenship'
                />
              </Col>
              <Col md={4} sm={6} className='py-1'>
                <SelectGroup
                  invalid={hasErrors('residence')}
                  id='residence'
                  name='residence'
                  value={`${residence}`}
                  options={countries}
                  placeholder='SELECT A COUNTRY'
                  onSelect={onChange}
                  required
                  label='Country of Residence'
                />
              </Col>
              <Col md={4} sm={6} className='py-1'>
                <TextInputGroup
                  label='Phone'
                  name='phone'
                  value={phone}
                  required
                  isPhoneNumber
                  onChange={onChange}
                />
              </Col>
              <Col className='text-right'>
                <Button
                  color='danger'
                  onClick={() => validateStep(1)}
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
    },
    section2 = (isOpen: number) => {
      const { networth, invest_funds } = userData

      return (
        <div className='section mb-2 p-3'>
          <Link
            className={`${(isOpen === 2 && 'active') || ''} collapse-btn`}
            onClick={() => toggleStep(2)}
            to='#'
          >
            <h2>Your Financials</h2>
          </Link>
          <Collapse isOpen={isOpen === 2}>
            <Row>
              <Col sm={12} className='py-1'>
                <SelectGroup
                  invalid={hasErrors('networth')}
                  id='networth'
                  name='networth'
                  value={networth}
                  options={netWorthRange}
                  placeholder='PLEASE SELECT'
                  onSelect={onChange}
                  required
                  label='Net Worth (the sum total of all assets such a properties, investment, savings, etc.)'
                />
              </Col>
              <Col sm={12} className='py-1'>
                <SelectGroup
                  invalid={hasErrors('invest_funds')}
                  id='invest_funds'
                  name='invest_funds'
                  value={invest_funds}
                  options={investmentRange}
                  placeholder='PLEASE SELECT'
                  onSelect={onChange}
                  required
                  label='Funds Available to Invest in St Kitts & Nevis - Citizenship by Investment'
                />
              </Col>

              <Col className='text-right'>
                <Button
                  color='danger'
                  onClick={() => validateStep(2)}
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
    },
    section3 = (isOpen: number) => {
      const { referee } = userData

      return (
        <div className='section mb-2 p-3'>
          <Link
            className={`${(isOpen === 3 && 'active') || ''} collapse-btn`}
            onClick={() => toggleStep(3)}
            to='#'
          >
            <h2>Other Details</h2>
          </Link>
          <Collapse isOpen={isOpen === 3}>
            <Row>
              <CheckBoxInput
                colProps={{ xs: 6, sm: 4 }}
                id=''
                invalid={hasErrors('contact_medium')}
                label='How do you wish to be contacted'
                type='switch'
                name='contact_medium'
                inline
                options={preferredCom.map((medium) => ({
                  label: medium,
                  value: medium,
                  id: medium,
                }))}
                onChange={(e: any) => onChange(e, 'radioOption')}
              />

              <Col sm={12} className='py-1'>
                <SelectGroup
                  invalid={hasErrors('referee')}
                  id='referee'
                  name='referee'
                  value={referee}
                  options={[
                    { name: 'Facebook', value: 'Facebook' },
                    { name: 'Instagram', value: 'Instagram' },
                    { name: 'Google', value: 'Google' },
                    { name: 'Seminar', value: 'Seminar' },
                    { name: 'A friend', value: 'A friend' },
                    { name: 'Others', value: 'Others' },
                  ]}
                  placeholder='PLEASE SELECT'
                  onSelect={onChange}
                  label='How did you hear about us?'
                />
              </Col>

              <Col className='text-right'>
                <Button
                  color='danger'
                  onClick={() => validateStep(3)}
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

  return (
    <MainLayout>
      <>
        <Loading show={loading} />
        {alert && <Alert alert={alert} toggle={() => setAlert(false)} />}
        <div>
          {section1(isOpen)}
          {section2(isOpen)}
          {section3(isOpen)}
        </div>
      </>
    </MainLayout>
  )
}

export default StKitts

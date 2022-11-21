import React, { PropsWithChildren } from 'react'
import { Col } from 'reactstrap'
import { errorKey } from '../types'
import { TextInputGroup } from './Form'

export const companyInitialState = {
  company_name: '',
  contact_person: '',
  contact_position: '',
  phone: '',
  email: '',
  business_activity: '',
  location: '',
  website: '',
}

type Props = {
  onChange: (e: any) => void
  userData: {
    company_name: string
    contact_person: string
    contact_position: string
    email: string
    phone: string
    business_activity: string
    location: string
    website: string
  }
  hasErrors: (key: errorKey) => boolean
} & PropsWithChildren

const CompanyInfo = ({ onChange, userData, hasErrors }: Props) => {
  return (
    <>
      <Col sm={6} className='py-1'>
        <TextInputGroup
          required
          invalid={hasErrors('company_name')}
          label='Name of Company'
          name='company_name'
          value={userData.company_name}
          onChange={onChange}
        />
      </Col>

      <Col sm={6} className='py-1'>
        <TextInputGroup
          required
          invalid={hasErrors('contact_person')}
          label='Contact person'
          name='contact_person'
          value={userData.contact_person}
          onChange={onChange}
        />
      </Col>

      <Col sm={6} className='py-1'>
        <TextInputGroup
          required
          invalid={hasErrors('contact_position')}
          label='Position within the company'
          name='contact_position'
          value={userData.contact_position}
          onChange={onChange}
        />
      </Col>

      <Col sm={6} className='py-1'>
        <TextInputGroup
          label='Contact Phone Number'
          name='phone'
          type='tel'
          value={userData.phone}
          required
          isPhoneNumber
          onChange={onChange}
        />
      </Col>

      <Col sm={6} className='py-1'>
        <TextInputGroup
          label='Contact Email'
          name='email'
          value={userData.email}
          required
          isEmail
          onChange={onChange}
        />
      </Col>

      <Col sm={6} className='py-1'>
        <TextInputGroup
          required
          invalid={hasErrors('business_activity')}
          label='Principal business activity'
          name='business_activity'
          value={userData.business_activity}
          onChange={onChange}
        />
      </Col>

      <Col sm={6} className='py-1'>
        <TextInputGroup
          required
          invalid={hasErrors('location')}
          label='Business Location (City, province)'
          name='location'
          value={userData.location}
          onChange={onChange}
        />
      </Col>

      <Col sm={6} className='py-1'>
        <TextInputGroup
          required
          invalid={hasErrors('website')}
          label='Business Website'
          name='website'
          value={userData.website}
          onChange={onChange}
        />
      </Col>
    </>
  )
}

export default CompanyInfo

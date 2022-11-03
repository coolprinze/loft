import axios, { Axios, AxiosPromise } from 'axios'
import moment from 'moment'
import React, { Component, useEffect, useState } from 'react'
import { CSVLink } from 'react-csv'
import { NumericFormat } from 'react-number-format'
import { connect } from 'react-redux'
import { toast } from 'react-toastify'
import { Card, Col, Row, Table } from 'reactstrap'
import { Dispatch } from 'redux'
import {
  collectionType,
  getImmigrants,
  searchDb,
} from '../actions/ImmigrantActions'
import { TextInputGroup } from '../components/Form'
import Loading from '../components/Loading'
import { handleErr } from '../helpers'
import { antiguaType } from '../interface/antiguaType'

const data = {
  titles: [
    'employees_total',
    'employees_fulltime',
    'employees_parttime',
    'employees_needed',
    'positions',
    'situation',
    'business_activity',
    'location',
    'phone',
    'email',
    'website',
  ],
}

const CanadianEmployer = ({ token }: any) => {
  const [search, setSearch] = useState(''),
    [loading, setLoading] = useState(false),
    [employerList, setEmployerList] = useState([]),
    config = {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    }

  const getEmployers = async () => {
    try {
      const res = await axios.get(`${URL}/employers/canadian-employers`, config)

      setEmployerList(res.data)
    } catch (error) {
      toast(handleErr(error))
    }
    setLoading(false)
  }
  useEffect(() => {
    setLoading(true)
    getEmployers()

    return () => {}
  }, [])

  const onChange = (e?: any) => {
    setSearch(e.target.value)
    searchDb({ [e.target.name]: e.target.value })
  }

  const searchDb =
    (query: object) => async (dispatch: Dispatch, getState: any) => {
      try {
        const {
          auth: { token },
        } = getState()

        const config = {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
        let param = '?'

        for (const [key, value] of Object.entries(query)) {
          if (value.toString()) param += `${key}=${value}&`
        }

        const res = await axios.get(
          `${URL}/employers/canadian-employers${param}`,
          config
        )

        setEmployerList(res.data)
      } catch (error) {
        toast(handleErr(error))
      }
      setLoading(false)
    }

  return (
    <div id='requests' className='px-0 mx-auto w-100'>
      <Loading show={loading} />
      <Row>
        <Col>
          <h2>Canadian Employers</h2>
        </Col>
      </Row>
      <Row>
        <Col sm={8}>
          <TextInputGroup
            onChange={onChange}
            name={'search'}
            value={search}
            placeholder='Search...'
          />
        </Col>
        <Col sm={4}>
          <CSVLink
            data={employerList.map(
              ({
                employees_total,
                employees_fulltime,
                employees_parttime,
                employees_needed,
                positions,
                situation,
                business_activity,
                location,
                phone,
                email,
                website,
              }) => ({
                employees_total,
                employees_fulltime,
                employees_parttime,
                employees_needed,
                positions,
                situation,
                business_activity,
                location,
                phone,
                email,
                website,
              })
            )}
            target='_blank'
            className='btn btn-primary btn-block'
            filename='Canadian-Employers'
          >
            Export to CSV
          </CSVLink>
        </Col>
      </Row>
      <Card className='p-0 resp'>
        <Table responsive striped bordered>
          <thead>
            <tr>
              {data.titles.map((title, key) => (
                <th className='text-capitalize' key={key}>
                  {title}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {employerList.map((employer, key: any) => {
              const {
                employees_total,
                employees_fulltime,
                employees_parttime,
                employees_needed,
                positions,
                situation,
                business_activity,
                location,
                phone,
                email,
                website,
                createdAt,
              } = employer
              return (
                <tr key={key}>
                  <th scope='row'>{key + 1}</th>
                  <td>{employees_total}</td>
                  <td>{employees_fulltime}</td>
                  <td>{employees_parttime}</td>
                  <td>{employees_needed}</td>
                  <td>{positions}</td>
                  <td>{situation}</td>
                  <td>{business_activity}</td>
                  <td>{location}</td>
                  <td>{phone}</td>
                  <td>{email}</td>
                  <td>{website}</td>
                  <td>{moment(createdAt).format('L | HH:mm')}</td>
                </tr>
              )
            })}
          </tbody>
        </Table>
        {!employerList.length && (
          <div className='text-center'>
            <strong>No result found</strong>
          </div>
        )}
      </Card>
    </div>
  )
}
const mapStateToProps = ({ auth }: any) => ({
  ...auth,
})

export default connect(mapStateToProps)(CanadianEmployer)

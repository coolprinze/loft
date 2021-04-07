import { AxiosPromise } from 'axios'
import moment from 'moment'
import React, { Component } from 'react'
import { CSVLink } from 'react-csv'
import { connect } from 'react-redux'
import { Card, Col, Row, Table } from 'reactstrap'
import {
  collectionType,
  getGeneralImmigrants,
  searchDb
} from '../actions/ImmigrantActions'
import { DateInputGroup, SelectGroup, TextInputGroup } from '../components/Form'
import Loading from '../components/Loading'
import { _calculateAge } from '../helpers'
import { generalType } from '../interface/generalType'

const data = {
  titles: [
    { title: '', field: 'id' },
    { title: 'Name', field: 'name' },
    { title: 'group', field: 'group' },
    { title: 'Eligible Party', field: 'eligible_party' },
    { title: 'nationality', field: 'citizenshipCountry' },
    { title: 'Residence', field: 'residenceCountry' },
    { title: 'email', field: 'email' },
    { title: 'phone', field: 'phone' },
    { title: 'DOB', field: 'dob' },
    { title: 'Married', field: 'Married' },
    { title: 'Created At', field: 'createdAt' },
  ],
}

class General extends Component<{
  getGeneralImmigrants: () => AxiosPromise
  searchDb: (collection: collectionType, searchParam: object) => AxiosPromise
  generalList: generalType[]
  countries: { name: string; value: number }[]
}> {
  state = {
    _q: '',
    loading: false,
    query: {},
    startDate: '',
    endDate: '',
    sortConfig: { field: null, asc: true },
  }

  async componentDidMount() {
    this.setState({ loading: true })
    await this.props
      .getGeneralImmigrants()
      .then((data) => this.setState({ loading: false, data }))
      .catch((err) => this.setState({ loading: false }))
  }

  enableKeyboard = () => (document.onkeypress = () => true)
  disableKeyboard = () => (document.onkeypress = () => false)

  sortData = (sortField: any) => {
    const {
      sortConfig: { field, asc },
    } = this.state
    const direction = sortField === field ? !asc : asc
    this.props.generalList.sort((a: any, b: any) => {
      let _a = a[sortField],
        _b = b[sortField]

      return typeof _a === 'string'
        ? direction
          ? _a.toLowerCase() < _b.toLowerCase()
            ? -1
            : _a.toLowerCase() > _b.toLowerCase()
            ? 1
            : 0
          : -1
        : direction
        ? _a - _b
        : _b - _a
    })
    this.setState({
      sortConfig: { field: sortField, asc: direction },
    })
  }

  onChange = (e?: any) => {
    this.setState({
      query: { ...this.state.query, [e.target.name]: e.target.value },
      [e.target.name]: e.target.value,
    })
    this.onSearch()
  }

  onSearch = () =>
    this.setState({ loading: true }, () =>
      this.props
        .searchDb('generals', this.state.query)
        .then((res) => this.setState({ loading: false }))
        .catch((err) => this.setState({ loading: false }))
    )

  render() {
    const { generalList } = this.props,
      {
        loading,
        startDate,
        endDate,
        sortConfig: { asc, field: sortField },
      } = this.state
    return (
      <div id='requests' className='px-0 w-100 mx-auto'>
        <Loading show={loading} />
        <Row>
          <Col>
            <h2>General</h2>
          </Col>
        </Row>
        <Row>
          <Col sm={6} className='pb-3'>
            <TextInputGroup
              onChange={(e: any) => this.onChange(e)}
              name='_q'
              value={this.state._q}
              placeholder='Search...'
              subText={
                <i className='text-gray'>
                  searches <span className='text-info'>firstname</span>,{' '}
                  <span className='text-info'>lastname</span>,{' '}
                  <span className='text-info'>email</span>,{' '}
                  <span className='text-info'>phone</span>,{' '}
                  <span className='text-info'>eligible party</span> and{' '}
                  <span className='text-info'>group</span>
                </i>
              }
            />
          </Col>
          <Col sm={3} xs={6} className='pr-1'>
            <CSVLink
              data={generalList.map(
                ({
                  first_name,
                  last_name,
                  email,
                  group,
                  dob,
                  eligible_party,
                  phone,
                  spouse,
                  createdAt,
                  residenceCountry,
                  citizenshipCountry,
                }) => ({
                  first_name,
                  last_name,
                  email,
                  group,
                  dob,
                  eligible_party,
                  phone,
                  married: spouse !== null,
                  residenceCountry: residenceCountry.name,
                  citizenshipCountry: citizenshipCountry.name,
                  createdAt,
                })
              )}
              target='_blank'
              className='btn btn-primary btn-block'
              filename='General-Immigrants'
            >
              Exp All
            </CSVLink>
          </Col>
          <Col sm={3} xs={6} className='pl-1'>
            <CSVLink
              data={generalList.map(
                ({ first_name, last_name, email, phone }) => ({
                  first_name,
                  last_name,
                  email,
                  phone,
                })
              )}
              target='_blank'
              className='btn btn-info btn-block'
              filename='General-Immigrants(filtered)'
            >
              Exp Few
            </CSVLink>
          </Col>
        </Row>

        <Row className='mt-3'>
          <Col sm='12'>
            <h4>Filter By:</h4>
          </Col>
          <Col xs='3' className='pr-1'>
            <DateInputGroup
              inputProps={{
                style: { type: 'date', border: '1px solid #cad1d7' },
                required: true,
                placeholder: 'from',
                class: 'form-control-sm form-control filter-input',
              }}
              label='Created'
              onFocus={this.disableKeyboard}
              onBlur={this.enableKeyboard}
              value={startDate}
              autoComplete='off'
              name='startDate'
              id='startDate'
              onChange={(e) =>
                this.onChange({
                  ...e,
                  target: { ...e.target, name: 'startDate' },
                })
              }
            />
          </Col>
          <Col xs='3' className='pl-1'>
            <DateInputGroup
              inputProps={{
                style: { type: 'date', border: '1px solid #cad1d7' },
                required: true,
                placeholder: 'to',
                class: 'form-control-sm form-control filter-input',
              }}
              label='-'
              onFocus={this.disableKeyboard}
              onBlur={this.enableKeyboard}
              value={endDate}
              autoComplete='off'
              name='endDate'
              id='endDate'
              onChange={(e) =>
                this.onChange({
                  ...e,
                  target: { ...e.target, name: 'endDate' },
                })
              }
            />
          </Col>
        </Row>
        <Card className='p-0 resp mt-3'>
          <Table responsive striped bordered>
            <thead>
              <tr>
                {data.titles.map(({ title, field }, key) => (
                  <th className='text-capitalize' key={key}>
                    {title}{' '}
                    <button
                      className='d-inline btn btn-link px-0'
                      onClick={() => this.sortData(field)}
                    >
                      <i
                        className={`fa fa-angle-down mr-0 ${
                          sortField === field && asc ? 'text-secondary' : ''
                        }`}
                      ></i>
                      <i
                        className={`fa fa-angle-up mr-0 ${
                          sortField === field && !asc ? 'text-secondary' : ''
                        }`}
                      ></i>
                    </button>
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {generalList.map((immigrant, key: any) => {
                const {
                  first_name,
                  last_name,
                  email,
                  group,
                  dob,
                  eligible_party,
                  phone,
                  spouse,
                  createdAt,
                  residenceCountry,
                  citizenshipCountry,
                } = immigrant
                return (
                  <tr key={key}>
                    <th scope='row'>{key + 1}</th>
                    <td>{`${first_name} ${last_name}`}</td>
                    <td>Group {group}</td>
                    <td>{eligible_party}</td>
                    <td>{citizenshipCountry.name}</td>
                    <td>{residenceCountry.name}</td>
                    <td>{email}</td>
                    <td>{phone}</td>
                    <td>{_calculateAge(dob)}</td>
                    <td>{spouse !== null ? 'true' : 'false'}</td>

                    <td>{moment(createdAt).format('L | HH:mm')}</td>
                  </tr>
                )
              })}
            </tbody>
          </Table>
          {!generalList.length && (
            <div className='text-center'>
              <strong>No result found</strong>
            </div>
          )}
        </Card>
      </div>
    )
  }
}

const mapStateToProps = ({ generalList }: { generalList: [] }) => ({
  ...generalList,
})

export default connect(mapStateToProps, { getGeneralImmigrants, searchDb })(
  //@ts-ignore
  General
)

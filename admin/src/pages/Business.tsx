import { AxiosPromise } from 'axios'
import moment from 'moment'
import React, { Component } from 'react'
import { CSVLink } from 'react-csv'
import NumberFormat from 'react-number-format'
import { connect } from 'react-redux'
import { Card, Col, Row, Table } from 'reactstrap'
import {
  collectionType,
  getBusinessImmigrants,
  searchDb,
} from '../actions/ImmigrantActions'
import { DateInputGroup, SelectGroup, TextInputGroup } from '../components/Form'
import Loading from '../components/Loading'
import { _calculateAge } from '../helpers'
import { businessType } from '../interface/businessType'

const data = {
  titles: [
    { title: '', field: 'id' },
    { title: 'Name', field: 'name' },
    { title: 'group', field: 'group' },
    { title: 'Eligible Party', field: 'eligible_party' },
    { title: 'networth', field: 'networthRange' },
    { title: 'invest funds', field: 'investRange' },
    { title: 'nationality', field: 'citizenshipCountry' },
    { title: 'Residence', field: 'residenceCountry' },
    { title: 'email', field: 'email' },
    { title: 'phone', field: 'phone' },
    { title: 'DOB', field: 'dob' },
    { title: 'Married', field: 'Married' },
    { title: 'Man Experience', field: 'managerial_experience' },
    { title: 'Created At', field: 'createdAt' },
  ],
}

class Business extends Component<{
  getBusinessImmigrants: (collection: collectionType) => AxiosPromise
  searchDb: (collection: collectionType, searchParam: object) => AxiosPromise
  businessList: businessType[]
  countries: { name: string; value: number }[]
  investRanges: { name: string; value: number }[]
}> {
  state = {
    _q: '',
    invest_funds: '',
    loading: false,
    query: {},
    startDate: '',
    endDate: '',
    sortConfig: { field: null, asc: true },
  }

  async componentDidMount() {
    this.setState({ loading: true })
    await this.props
      .getBusinessImmigrants('businesses')
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
    this.props.businessList.sort((a: any, b: any) => {
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
        .searchDb('businesses', this.state.query)
        .then((res) => this.setState({ loading: false }))
        .catch((err) => this.setState({ loading: false }))
    )

  render() {
    const { businessList, investRanges } = this.props,
      {
        loading,
        invest_funds,
        startDate,
        endDate,
        sortConfig: { asc, field: sortField },
      } = this.state
    return (
      <div id='requests' className='px-0 w-100 mx-auto'>
        <Loading show={loading} />
        <Row>
          <Col>
            <h2>Business</h2>
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
              data={businessList.map(
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
                  investRange,
                  networthRange,
                  managerial_experience,
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
                  invest: `${investRange.min}-${investRange.max}`,
                  networth: `${networthRange.min}-${networthRange.max}`,
                  residenceCountry: residenceCountry.name,
                  citizenshipCountry: citizenshipCountry.name,
                  managerial_experience,
                  createdAt,
                })
              )}
              target='_blank'
              className='btn btn-primary btn-block'
              filename='Business-Immigrants'
            >
              Exp All
            </CSVLink>
          </Col>
          <Col sm={3} xs={6} className='pl-1'>
            <CSVLink
              data={businessList.map(
                ({ first_name, last_name, email, phone }) => ({
                  first_name,
                  last_name,
                  email,
                  phone,
                })
              )}
              target='_blank'
              className='btn btn-info btn-block'
              filename='Business-Immigrants(filtered)'
            >
              Exp Few
            </CSVLink>
          </Col>
        </Row>

        <Row className='mt-3'>
          <Col sm='12'>
            <h4>Filter By:</h4>
          </Col>
          <Col xs='6'>
            <SelectGroup
              id='invest_funds'
              name='invest_funds'
              value={invest_funds}
              options={[{ name: 'None', value: '' }, ...investRanges]}
              placeholder='Select...'
              onSelect={this.onChange}
              label='Available to Invest'
              bsSize='sm'
            />
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
              {businessList.map((immigrant, key: any) => {
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
                  investRange,
                  networthRange,
                  managerial_experience,
                  residenceCountry,
                  citizenshipCountry,
                } = immigrant
                return (
                  <tr key={key}>
                    <th scope='row'>{key + 1}</th>
                    <td>{`${first_name} ${last_name}`}</td>
                    <td>Group {group}</td>
                    <td>{eligible_party}</td>
                    <td>
                      <NumberFormat
                        thousandSeparator
                        prefix='$'
                        value={investRange.min}
                        displayType='text'
                      />
                      {' - '}
                      <NumberFormat
                        thousandSeparator
                        prefix='$'
                        value={investRange.max}
                        displayType='text'
                      />
                    </td>
                    <td>
                      <NumberFormat
                        thousandSeparator
                        prefix='$'
                        value={networthRange.min}
                        displayType='text'
                      />
                      {' - '}
                      <NumberFormat
                        thousandSeparator
                        prefix='$'
                        value={networthRange.max}
                        displayType='text'
                      />
                    </td>
                    <td>{citizenshipCountry.name}</td>
                    <td>{residenceCountry.name}</td>
                    <td>{email}</td>
                    <td>{phone}</td>
                    <td>{_calculateAge(dob)}</td>
                    <td>{spouse !== null ? 'true' : 'false'}</td>
                    <td>{managerial_experience ? 'true' : 'false'}</td>

                    <td>{moment(createdAt).format('L | HH:mm')}</td>
                  </tr>
                )
              })}
            </tbody>
          </Table>
          {!businessList.length && (
            <div className='text-center'>
              <strong>No result found</strong>
            </div>
          )}
        </Card>
      </div>
    )
  }
}

const mapStateToProps = ({ businessList }: { businessList: [] }) => ({
  ...businessList,
})

export default connect(mapStateToProps, { getBusinessImmigrants, searchDb })(
  //@ts-ignore
  Business
)

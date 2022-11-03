import { AxiosPromise } from 'axios'
import moment from 'moment'
import { Component } from 'react'
import { CSVLink } from 'react-csv'
import { NumericFormat } from 'react-number-format'
import { connect } from 'react-redux'
import { toast } from 'react-toastify'
import { Button, Card, Col, Row, Table } from 'reactstrap'
import {
  collectionType,
  getBusinessImmigrants,
  searchDb,
  updateImmigrant,
} from '../actions/ImmigrantActions'
import { DateInputGroup, SelectGroup, TextInputGroup } from '../components/Form'
import Loading from '../components/Loading'
import { qualToString, _calculateAge } from '../helpers'
import { businessType } from '../interface/businessType'

const data = {
  titles: [
    { title: '', field: 'id' },
    { title: 'Convert To Client', field: 'client_status' },
    { title: 'Name', field: 'name' },
    { title: 'group', field: 'group' },
    { title: 'Eligible Party', field: 'eligible_party' },
    { title: 'invest funds', field: 'investRange' },
    { title: 'networth', field: 'networthRange' },
    { title: 'nationality', field: 'citizenshipCountry' },
    { title: 'Residence', field: 'residenceCountry' },
    { title: 'email', field: 'email' },
    { title: 'phone', field: 'phone' },
    { title: 'DOB', field: 'dob' },
    { title: 'Married', field: 'Married' },
    { title: 'Man Experience', field: 'managerial_experience' },
    { title: 'Qualifications', field: 'qualifications' },
    { title: 'Spouse', field: 'spouse' },
    { title: 'Created At', field: 'createdAt' },
  ],
}

class Business extends Component<{
  getBusinessImmigrants: (collection: collectionType) => AxiosPromise
  updateImmigrant: (id: number, data: any, type: collectionType) => AxiosPromise
  searchDb: (collection: collectionType, searchParam: object) => AxiosPromise
  businessList: businessType[]
  countries: { name: string; value: number }[]
  title: string
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
    isClients: 0,
  }

  async componentDidMount() {
    // @ts-ignore
    const { id } = this.props.match.params
    const isClients = id === 'clients' ? 1 : 0
    this.setState({ loading: true, isClients })
    await this.props
      .searchDb(`businesses`, { client_status: isClients })
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
        .searchDb('businesses', {
          ...this.state.query,
          client_status: this.state.isClients,
        })
        .then((res) => this.setState({ loading: false }))
        .catch((err) => this.setState({ loading: false }))
    )

  updateImmigrant = (id: number) =>
    this.setState({ loading: true }, () =>
      this.props
        .updateImmigrant(id, { client_status: true }, 'businesses')
        .then((res) =>
          this.setState({ loading: false }, () => {
            toast('Selected lead is now a client')
          })
        )
        .catch((err) =>
          this.setState({ loading: false }, () => {
            toast(err.response.message)
          })
        )
    )

  render() {
    const { businessList, investRanges, title } = this.props,
      {
        loading,
        invest_funds,
        startDate,
        endDate,
        sortConfig: { asc, field: sortField },
        isClients,
      } = this.state
    return (
      <div id='requests' className='px-0 mx-auto w-100'>
        <Loading show={loading} />
        <Row>
          <Col>
            <h2>
              {title} {isClients ? 'Clients' : 'Leads'}
            </h2>
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
                  qualifications,
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
                  qualifications: qualToString(qualifications),
                  spouse: spouse
                    ? `${_calculateAge(spouse.dob)} years | ${
                        spouse.birthCountry.name
                      } \n| ${qualToString(spouse.qualifications)}`
                    : 'NIL',
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
              // bsSize='sm'
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
        <Card className='p-0 mt-3 resp'>
          <Table responsive striped bordered>
            <thead>
              <tr>
                {data.titles.map(({ title, field }, key) =>
                  isClients && field === 'client_status' ? (
                    ''
                  ) : (
                    <th className='text-capitalize' key={key}>
                      {title}{' '}
                      <button
                        className='px-0 d-inline btn btn-link'
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
                  )
                )}
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
                  qualifications,
                  spouse,
                  createdAt,
                  investRange,
                  networthRange,
                  managerial_experience,
                  residenceCountry,
                  citizenshipCountry,
                  id,
                  client_status,
                } = immigrant
                return (
                  <tr key={key}>
                    <th scope='row'>{key + 1}</th>
                    {isClients ? (
                      ''
                    ) : (
                      <td>
                        <Button
                          color={client_status ? 'secondary' : 'success'}
                          onClick={() => this.updateImmigrant(id)}
                          size='sm'
                          disabled={client_status}
                        >
                          {client_status ? 'Converted' : 'Convert to Client'}
                        </Button>
                      </td>
                    )}
                    <td>{`${first_name} ${last_name}`}</td>
                    <td>Group {group}</td>
                    <td>{eligible_party}</td>
                    <td>
                      <NumericFormat
                        thousandSeparator
                        prefix='$'
                        value={investRange.min}
                        displayType='text'
                      />
                      {' - '}
                      <NumericFormat
                        thousandSeparator
                        prefix='$'
                        value={investRange.max}
                        displayType='text'
                      />
                    </td>
                    <td>
                      <NumericFormat
                        thousandSeparator
                        prefix='$'
                        value={networthRange.min}
                        displayType='text'
                      />
                      {' - '}
                      <NumericFormat
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
                    <td>{qualToString(qualifications)}</td>
                    <td>
                      {spouse ? (
                        <>
                          <strong>Age:</strong>{' '}
                          {`${_calculateAge(spouse.dob)} years`}
                          <br />
                          <strong>Quals:</strong>{' '}
                          {qualToString(spouse.qualifications)}
                          <br />
                        </>
                      ) : (
                        'NIL'
                      )}
                    </td>

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
const connectProps = connect(mapStateToProps, {
  getBusinessImmigrants,
  searchDb,
  updateImmigrant,
})
//@ts-ignore
export default connectProps(withRouter(Business))

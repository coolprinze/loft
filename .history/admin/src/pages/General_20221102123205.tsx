import { AxiosPromise } from 'axios'
import moment from 'moment'
import React, { Component } from 'react'
import { CSVLink } from 'react-csv'
import { connect } from 'react-redux'
import { toast } from 'react-toastify'
import { Button, Card, Col, Row, Table } from 'reactstrap'
import {
  collectionType,
  getGeneralImmigrants,
  searchDb,
  updateImmigrant,
} from '../actions/ImmigrantActions'
import { DateInputGroup, TextInputGroup } from '../components/Form'
import Loading from '../components/Loading'
import {
  experienceToString,
  laguageToString,
  qualToString,
  _calculateAge,
} from '../helpers'
import withRouter from '../helpers/withRouter'
import { generalType } from '../interface/generalType'

const data = {
  titles: [
    { title: '', field: 'id' },
    { title: 'Convert To Client', field: 'client_status' },
    { title: 'Name', field: 'name' },
    { title: 'group', field: 'group' },
    { title: 'Eligible Party', field: 'eligible_party' },
    { title: 'nationality', field: 'citizenshipCountry' },
    { title: 'Residence', field: 'residenceCountry' },
    { title: 'email', field: 'email' },
    { title: 'phone', field: 'phone' },
    { title: 'DOB', field: 'dob' },
    { title: 'Married', field: 'Married' },
    { title: 'Qualifications', field: 'qualifications' },
    { title: 'Experience', field: 'work_histories' },
    { title: 'Language Prof', field: 'language_proficiencies' },
    { title: 'Spouse', field: 'spouse' },
    { title: 'Children', field: 'children' },
    { title: 'Criminal Rec?', field: 'criminal_record' },
    { title: 'Famili in CA?', field: 'family_in_canada' },
    { title: 'Job Offer?', field: 'job_offer' },
    { title: 'Medical Condition?', field: 'medical_condition' },
    { title: 'Comment', field: 'comment' },
    { title: 'Created At', field: 'createdAt' },
  ],
}

class General extends Component<{
  getGeneralImmigrants: () => AxiosPromise
  updateImmigrant: (id: number, data: any, type: collectionType) => AxiosPromise
  searchDb: (collection: collectionType, searchParam: object) => AxiosPromise
  generalList: generalType[]
  title: string
}> {
  state = {
    _q: '',
    loading: false,
    query: {},
    startDate: '',
    endDate: '',
    sortConfig: { field: null, asc: true },
    isClients: 0,
  }

  async componentDidMount() {
    // @ts-ignore
    console.log(this.props.match.params)

    // @ts-ignore
    const { id } = this.props.match.params
    const isClients = id === 'clients' ? 1 : 0
    this.setState({ loading: true, isClients })
    await this.props
      .searchDb('generals', { client_status: isClients })
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
        .searchDb('generals', {
          ...this.state.query,
          client_status: this.state.isClients,
        })
        .then((res) => this.setState({ loading: false }))
        .catch((err) => this.setState({ loading: false }))
    )

  updateImmigrant = (id: number) =>
    this.setState({ loading: true }, () =>
      this.props
        .updateImmigrant(id, { client_status: true }, 'generals')
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
    const { generalList, title } = this.props,
      {
        loading,
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
              data={generalList.map(
                ({
                  first_name,
                  last_name,
                  group,
                  eligible_party,
                  citizenshipCountry,
                  residenceCountry,
                  email,
                  phone,
                  dob,
                  qualifications,
                  work_histories,
                  language_proficiencies,
                  spouse,
                  children,
                  criminal_record,
                  family_in_canada,
                  job_offer,
                  medical_condition,
                  comment,
                  createdAt,
                }) => ({
                  first_name,
                  last_name,
                  group,
                  eligible_party,
                  citizenshipCountry: citizenshipCountry.name,
                  residenceCountry: residenceCountry.name,
                  email,
                  phone,
                  dob,
                  married: spouse !== null,
                  qualifications: qualToString(qualifications),
                  work_histories: experienceToString(work_histories),
                  language_proficiencies: laguageToString(
                    language_proficiencies
                  ),
                  spouse: spouse
                    ? `${_calculateAge(spouse.dob)} years \n| ${qualToString(
                        spouse.qualifications
                      )} \n| ${experienceToString(
                        spouse.work_histories
                      )} \n| ${laguageToString(
                        spouse.language_proficiencies
                      )}  `
                    : 'NIL',
                  children,
                  criminal_record: criminal_record ? 'Yes' : 'No',
                  family_in_canada: family_in_canada ? 'Yes' : 'No',
                  job_offer: job_offer ? 'Yes' : 'No',
                  medical_condition: medical_condition ? 'Yes' : 'No',
                  comment,
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
                  qualifications,
                  work_histories,
                  language_proficiencies,
                  client_status,
                  children,
                  criminal_record,
                  family_in_canada,
                  job_offer,
                  medical_condition,
                  comment,
                  id,
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
                    <td>{citizenshipCountry.name}</td>
                    <td>{residenceCountry.name}</td>
                    <td>{email}</td>
                    <td>{phone}</td>
                    <td>{_calculateAge(dob)}</td>
                    <td>{spouse !== null ? 'true' : 'false'}</td>
                    <td>{qualToString(qualifications)}</td>
                    <td>{experienceToString(work_histories)}</td>
                    <td>{laguageToString(language_proficiencies)}</td>
                    <td>
                      {spouse ? (
                        <>
                          <strong>Age:</strong>{' '}
                          {`${_calculateAge(spouse.dob)} years`}
                          <br />
                          <strong>Quals:</strong>{' '}
                          {qualToString(spouse.qualifications)}
                          <br />
                          <strong>Exp's:</strong>{' '}
                          {experienceToString(spouse.work_histories)}
                          <br />
                          <strong>Lang's:</strong>{' '}
                          {laguageToString(spouse.language_proficiencies)}
                        </>
                      ) : (
                        'NIL'
                      )}
                    </td>
                    <td>{children}</td>
                    <td>{criminal_record ? 'Yes' : 'No'}</td>
                    <td>{family_in_canada ? 'Yes' : 'No'}</td>
                    <td>{job_offer ? 'Yes' : 'No'}</td>
                    <td>{medical_condition ? 'Yes' : 'No'}</td>
                    <td>{comment}</td>
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

export default connect(mapStateToProps, {
  getGeneralImmigrants,
  searchDb,
  updateImmigrant,
})(withRouter(General))

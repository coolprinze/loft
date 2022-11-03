import { AxiosPromise } from 'axios'
import moment from 'moment'
import React, { Component } from 'react'
import { CSVLink } from 'react-csv'
import { NumericFormat } from 'react-number-format'
import { connect } from 'react-redux'
import { Card, Col, Row, Table } from 'reactstrap'
import {
  collectionType,
  getImmigrants,
  searchDb,
} from '../actions/ImmigrantActions'
import { TextInputGroup } from '../components/Form'
import Loading from '../components/Loading'
import { antiguaType } from '../interface/antiguaType'

const data = {
  titles: [
    '',
    'Name',
    'email',
    'phone',
    'married',
    'invest funds',
    'networth',
    'residence',
    'nationality',
    'rejected',
    'deported',
    'O dep',
    'Y dep',
    'T dep',
    'A dep',
    'contact med',
    'ref',
    'time',
  ],
}

class Stkitts extends Component<{
  getImmigrants: (collection: collectionType) => AxiosPromise
  searchDb: (collection: collectionType, searchParam: string) => AxiosPromise
  immigrantList: antiguaType[]
}> {
  state = { search: '', loading: false }

  async componentDidMount() {
    this.setState({ loading: true })
    await this.props
      .getImmigrants('stkitts')
      .then((res) => this.setState({ loading: false }))
      .catch((err) => this.setState({ loading: false }))
  }
  onChange = (e?: any) => {
    this.setState({ [e.target.name]: e.target.value })
    this.onSearch(e.target.value)
  }

  onSearch = (param: string) =>
    this.setState({ loading: true }, () =>
      this.props
        .searchDb('stkitts', param)
        .then((res) => this.setState({ loading: false }))
        .catch((err) => this.setState({ loading: false }))
    )

  render() {
    const { immigrantList } = this.props
    return (
      <div id='requests' className='px-0 mx-auto w-100'>
        <Loading show={this.state.loading} />
        <Row>
          <Col>
            <h2>St. Kitts</h2>
          </Col>
        </Row>
        <Row>
          <Col sm={8}>
            <TextInputGroup
              onChange={(e: any) => this.onChange(e)}
              name={'search'}
              value={this.state.search}
              placeholder='Search...'
            />
          </Col>
          <Col sm={4}>
            <CSVLink
              data={immigrantList.map(
                ({
                  first_name,
                  last_name,
                  email,
                  phone,
                  married,
                  old_dependents,
                  young_dependents,
                  teen_dependents,
                  average_dependents,
                  rejected,
                  deported,
                  contact_medium,
                  referee,
                  createdAt,
                  investRange,
                  networthRange,
                  residenceCountry,
                  nationalityCountry,
                  RejectedCountries,
                  DeportedCountries,
                }) => ({
                  first_name,
                  last_name,
                  email,
                  phone,
                  married,
                  old_dependents,
                  young_dependents,
                  teen_dependents,
                  average_dependents,
                  contact_medium,
                  referee,
                  createdAt,
                  invest: `${investRange.min}-${investRange.max}`,
                  networth: `${networthRange.min}-${networthRange.max}`,
                  residenceCountry: residenceCountry.name,
                  nationalityCountry: nationalityCountry.name,
                  RejectedCountries,
                  DeportedCountries,
                  rejected: rejected
                    ? RejectedCountries.map((country) => (
                        <span className='' key={country.id}>
                          {country.name},{' '}
                        </span>
                      ))
                    : 'No',
                  deported: deported
                    ? DeportedCountries.map((country) => (
                        <span className='' key={country.id}>
                          {country.name},{' '}
                        </span>
                      ))
                    : 'No',
                })
              )}
              target='_blank'
              className='btn btn-primary btn-block'
              filename='Stkitts-Immigrants'
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
              {immigrantList.map((immigrant, key: any) => {
                const {
                  first_name,
                  last_name,
                  email,
                  phone,
                  married,
                  old_dependents,
                  young_dependents,
                  teen_dependents,
                  average_dependents,
                  rejected,
                  deported,
                  contact_medium,
                  referee,
                  createdAt,
                  investRange,
                  networthRange,
                  residenceCountry,
                  nationalityCountry,
                  RejectedCountries,
                  DeportedCountries,
                } = immigrant
                return (
                  <tr key={key}>
                    <th scope='row'>{key + 1}</th>
                    <td>{`${first_name} ${last_name}`}</td>
                    <td>{email}</td>
                    <td>{phone}</td>
                    <td>{married}</td>
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
                    <td>{residenceCountry.name}</td>
                    <td>{nationalityCountry.name}</td>
                    <td>
                      {rejected
                        ? RejectedCountries.map((country) => (
                            <span className='' key={country.id}>
                              {country.name},{' '}
                            </span>
                          ))
                        : 'No'}
                    </td>
                    <td>
                      {deported
                        ? DeportedCountries.map((country) => (
                            <span className='' key={country.id}>
                              {country.name},{' '}
                            </span>
                          ))
                        : 'No'}
                    </td>
                    <td>{old_dependents}</td>
                    <td>{young_dependents}</td>
                    <td>{teen_dependents}</td>
                    <td>{average_dependents}</td>
                    <td>{contact_medium}</td>
                    <td>{referee}</td>
                    <td>{moment(createdAt).format('L | HH:mm')}</td>
                  </tr>
                )
              })}
            </tbody>
          </Table>
          {!immigrantList.length && (
            <div className='text-center'>
              <strong>No result found</strong>
            </div>
          )}
        </Card>
      </div>
    )
  }
}

const mapStateToProps = ({ immigrantList }: { immigrantList: [] }) => ({
  ...immigrantList,
})

//@ts-ignore
export default connect(mapStateToProps, { getImmigrants, searchDb })(Stkitts)

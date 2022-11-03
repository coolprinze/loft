import axios from 'axios'
import moment from 'moment'
import { useEffect, useMemo, useState } from 'react'
import { CSVLink } from 'react-csv'
import { connect } from 'react-redux'
import { toast } from 'react-toastify'
import { Card, Col, Row, Table } from 'reactstrap'
import { TextInputGroup } from '../components/Form'
import Loading from '../components/Loading'
import { URL } from '../config'
import { handleErr } from '../helpers'

const data = {
  titles: [
    'ID',
    'Emp Ttal',
    'Emp ftime',
    'Emp ptime',
    'Emp needed',
    'Positions',
    'Situation',
    'Biz Activity',
    'Location',
    'Phone',
    'Email',
    'Website',
    'Created',
  ],
}

const IntlEmployer = ({ token }: any) => {
  const [search, setSearch] = useState(''),
    [loading, setLoading] = useState(false),
    [transferList, setTransferList] = useState([]),
    config = useMemo(
      () => ({
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }),
      [token]
    )

  const searchDb = async (query: object) => {
    try {
      let param = '?'

      for (const [key, value] of Object.entries(query)) {
        if (value.toString()) param += `${key}=${value}&`
      }

      const res = await axios.get(
        `${URL}/employers/intl-transfer${param}`,
        config
      )

      setTransferList(res.data)
    } catch (error) {
      toast(handleErr(error))
    }
    setLoading(false)
  }

  useEffect(() => {
    setLoading(true)
    axios
      .get(`${URL}/employers/intl-transfer`, config)
      .then((res) => setTransferList(res.data))

      .catch((error) => toast(handleErr(error)))
    setLoading(false)

    return () => {}
  }, [config])

  const onChange = (e?: any) => {
    setSearch(e.target.value)
    searchDb({ [e.target.name]: e.target.value })
  }

  return (
    <div id='requests' className='px-0 mx-auto w-100'>
      <Loading show={loading} />
      <Row>
        <Col>
          <h2>Intl Transfer</h2>
        </Col>
      </Row>
      <Row>
        <Col sm={8}>
          <TextInputGroup
            onChange={onChange}
            name={'_q'}
            value={search}
            placeholder='Search...'
          />
        </Col>
        <Col sm={4}>
          <CSVLink
            data={transferList.map(
              ({
                employees_total
company_name
managers_to_transfer
employees_to_transfer
revenue
hq_location
business_activity
phone
email
website,
                employees_total
company_name
managers_to_transfer
employees_to_transfer
revenue
hq_location
business_activity
phone
email
website,
                employees_total
company_name
managers_to_transfer
employees_to_transfer
revenue
hq_location
business_activity
phone
email
website,
                employees_total
company_name
managers_to_transfer
employees_to_transfer
revenue
hq_location
business_activity
phone
email
website,
                employees_total
company_name
managers_to_transfer
employees_to_transfer
revenue
hq_location
business_activity
phone
email
website,
                employees_total
company_name
managers_to_transfer
employees_to_transfer
revenue
hq_location
business_activity
phone
email
website,
                employees_total
company_name
managers_to_transfer
employees_to_transfer
revenue
hq_location
business_activity
phone
email
website,
                employees_total
company_name
managers_to_transfer
employees_to_transfer
revenue
hq_location
business_activity
phone
email
website,
                employees_total
company_name
managers_to_transfer
employees_to_transfer
revenue
hq_location
business_activity
phone
email
website,
                employees_total
company_name
managers_to_transfer
employees_to_transfer
revenue
hq_location
business_activity
phone
email
website,
                employees_total
company_name
managers_to_transfer
employees_to_transfer
revenue
hq_location
business_activity
phone
email
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
            filename='Intl-Transfers'
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
            {transferList.map((employer, key: any) => {
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
        {!transferList.length && (
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

export default connect(mapStateToProps)(IntlEmployer)

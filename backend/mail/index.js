const moment = require('moment')
const { mailer } = require('../config/mailer.js')

const properties = [
  'date_of_birth',
  'date_of_issue',
  'date_of_expiry',
  'date_of_marriage',
  'date_of_test',
  'from',
  'to',
]

const sendMail = (data, callback) =>
  mailer.sendMail(data, (err, res) => {
    if (err) {
      console.log(err)
      return false
    }
    callback(res)
    console.log('email sent')
  })

const emailTemplate = (immigrant) => {
  let details = ''

  for (const [key, value] of Object.entries(immigrant)) {
    if (typeof value === 'object') {
      let subDetails = ''

      value.map((val, index) => {
        subDetails += `<br>----------${index + 1}---------- `
        for (const [innerKey, innerValue] of Object.entries(val)) {
          subDetails += `<div>
            -- <strong style="color: #525252; text-transform: capitalize;">${innerKey.replaceAll(
              '_',
              ' '
            )}:</strong> ${
            properties.includes(innerKey)
              ? moment(innerValue).format('MMM Do YYYY')
              : innerValue
          }
          </div>`
        }
      })

      details += `<div>
        <strong style="color: #525252; text-transform: capitalize;">${key.replaceAll(
          '_',
          ' '
        )}:</strong> ${subDetails}
      </div>`
    } else
      details += `<div>
        <strong style="color: #525252; text-transform: capitalize;">${key.replaceAll(
          '_',
          ' '
        )}:</strong> ${
        properties.includes(key) ? moment(value).format('MMM Do YYYY') : value
      }
      </div>`
  }

  return `

  <div
  style="
    border-radius: 3px;
    border-top: 40px solid rgb(245, 245, 245);
    border-bottom: 10px solid rgb(245, 245, 245);
    border-right: 10px solid rgb(245, 245, 245);
    border-left: 10px solid rgb(245, 245, 245);
    font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
      'Lucida Sans', Arial, sans-serif;
    color: #434343;
    line-height: 23px;
    width: 90%;
    max-width: 500px;
    margin-right: auto;
    margin-left: auto;
    text-align: justify;
  "
>
  <div
    style="
      box-shadow: 0px -5px 6px rgb(216, 216, 216);
      padding: 5px 20px;
      border-radius: 3px 3px 0px 0px;
      border-bottom: 1px solid #f5f5f5;
    "
  >
    <h3
      style="
        text-align: center;
        font-family: Georgia, 'Times New Roman', Times, serif;
      "
    >
      <span style="color: #EC171F">O</span
      ><span style="color: #000">A</span
      ><span style="color: #0875B9">L</span> Immigration
    </h3>
  </div>
  <div style="padding: 20px">
  <p>Hello Mrs Oyelade,</p>
    <p>
      Here are the details the new applicant filled.
    </p>
    <h4
      style="
        color: #0b7400;
        margin-bottom: 7px;
        font-weight: 500;
        font-size: 20px;
        font-family: Georgia, 'Times New Roman', Times, serif;
      "
    >
      Applicant details
    </h4>
    ${details}
   
  </div>
  <div
    style="
      padding: 20px;
      background-color: rgb(245, 245, 245);
      font-size: 12px;
      text-align: center;
      color: #8c8c8c;
    "
  >
    <div>© 2020 OAL IMMIGRATION All Rights Reserved.</div>
    <div
      style="
        max-width: 80%;
        margin-right: auto;
        margin-left: auto;
        margin-top: 5px;
      "
    >
      <span style="display: inline-block; width: 32%">
        <a
          style="
            text-decoration: none;
            color: rgb(124, 124, 124);
            font-weight: 600;
          "
          href="http://oalimmigration.ca"
          >HOME</a
        >
      </span>
      <span style="display: inline-block; width: 32%">
        <a
          style="
            text-decoration: none;
            color: rgb(124, 124, 124);
            font-weight: 600;
          "
          href="http://oalimmigration.ca/contact"
          >CONTACT</a
        >
      </span>
      <span style="display: inline-block; width: 32%">
        <a
          style="
            text-decoration: none;
            color: rgb(124, 124, 124);
            font-weight: 600;
          "
          href="http://oalimmigration.ca/privacy-policy"
          >PRIVACY POLICY</a
        >
      </span>
    </div>
  </div>
</div>


`
}

module.exports = { sendMail, emailTemplate }

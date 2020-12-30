import moment = require('moment')

export const emailTemplate = ({
  id,
  fname,
  lname,
  membership: { title, price, application_fee },
  subscription: { expiresAt, createdAt },
}: {
  id: number
  fname: string
  lname: string
  membership: {
    title: string
    price: number
    application_fee: number
  }
  subscription: { expiresAt: string; createdAt: string }
}) => `

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
      Welcome To <span style="color: #ffc600">SOW</span
      ><span style="color: #0b7400">SHE</span
      ><span style="color: #ec1c23">-A</span>
    </h3>
  </div>
  <div style="padding: 20px">
  <p>Hi ${fname},</p>
    <p>
      Thank you for joining <span style="color: #ffc600">SOW</span
      ><span style="color: #0b7400">SHE</span
      ><span style="color: #ec1c23">-A</span> online. We're processing
      your application now. Your welcome pack will be sent to you shortly.
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
      Your membership details
    </h4>
    <div>
      <strong style="color: #525252">Name:</strong> ${fname} ${lname}
    </div>
    <div>
      <strong style="color: #525252">SOWSHE-A Membership number:</strong>
      ${id}
    </div>
    <div>
      <strong style="color: #525252">Invoice date:</strong> ${moment(
        Date.now()
      ).format('MMM Do YYYY')}
    </div>
    <div>
      <strong style="color: #525252">Membership product:</strong> SOWSHE-A
      ${title}
    </div>
    <div>
      <strong style="color: #525252">Membership start date:</strong>
      ${moment(createdAt).format('MMM Do YYYY')}
    </div>
    <div>
      <strong style="color: #525252">Membership end date:</strong>
      ${moment(expiresAt).format('MMM Do YYYY')}
    </div>
    <div>
      <strong style="color: #525252">Other IOSH products:</strong> Policy
      and Practice in Health and Safety journal e-receipt
    </div>

    <p>
      If you need a paper receipt and didn’t print one off when you joined
      us online, you can contact 
      <a
        style="text-decoration: none; color: #0b7400"
        href="mailto:membership@sowshea.org"
        >membership@sowshea.org</a
      > for a copy.
    </p>
    <div><strong style="color: #525252">Currency:</strong> Dollars</div>
    <div><strong style="color: #525252">Total cost:</strong> $0.00</div>
    <p>
      Do you think you’re eligible for a different membership category? If
      you believe you qualify for a different category, please contact us
      at
      <a
        style="text-decoration: none; color: #0b7400"
        href="mailto:membership@sowshea.org"
        >membership@sowshea.org</a
      >
      for support.
    </p>
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
    <div>© 2020 SOWSHE-A All Rights Reserved.</div>
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
          href="http://sowshea.org"
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
          href="http://sowshea.org/contact"
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
          href="http://sowshea.org/privacy-policy"
          >PRIVACY POLICY</a
        >
      </span>
    </div>
  </div>
</div>


`

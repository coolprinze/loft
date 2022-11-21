const { mailer } = require('../config/mailer.js')

const sendMail = (data, callback) => mailer.sendMail(data, callback)

const successEmailTemplate = (immigrant, type = '') => {
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
      padding: 5px 10px;
      border-radius: 3px 3px 0px 0px;
      border-bottom: 1px solid #f5f5f5;
    "
  >
    <div style="width: 20%; display: inline-block">
      <img
        src="https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png"
        alt="Loft Immigration"
        width="80px"
        height="auto"
      />
    </div>
    <div style="width: 78%; display: inline-block">
      <h4
        style="
          text-align: center;
          font-family: Georgia, 'Times New Roman', Times, serif;
          margin: 0px;
          color: #e50404;
        "
      >
        ${type} Assessment
      </h4>
    </div>
  </div>
  <div style="padding: 20px">
    <p>Hello ${immigrant.first_name},</p>
    <p>
      Thank you for taking the time to fill the assessment form, we will
      review it and get back to you in few minutes.
    </p>
    <p>Warm regards<br />
      <strong>Sophia Miles</strong><br />
      <small><em>Admin. Assistant</em></small>
    </p>
  </div>
  <div
    style="
      padding: 20px 0;
      background-color: rgb(245, 245, 245);
      font-size: 12px;
      color: #8c8c8c;
    "
  >
    <div style="color: #000">
      <strong
        ><small
          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights
          Reserved.</small
        ></strong
      >
    </div>
    <div>
      Member of the Immigration Consultants of Canada Regulatory Council
      (ICCRC) Member #R535739
    </div>
    <div>
      Member of Canadian Association of Professional Immigration Consultants
      (CAPIC)
    </div>
    <div>
      <a href="tel:+1 - (365) – 887 – 0360">+1 - (365) – 887 – 0360</a
      ><br />
      <a href="https://loftimmigration.com/"
        >https://loftimmigration.com/ </a
      ><br />
      <a
        href="https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g"
        target="_blank"
        rel="noreferrer"
        ><span
          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,
          ON L4C 3B5, Canada</span
        ></a
      >
      <p>
        <span
          >Be social, follow us on
          <a
            href="https://www.instagram.com/loftimmigration"
            target="_blank"
            rel="noreferrer"
            ><span style="color: blue">Instagram</span></a
          >,
          <a
            href="https://www.facebook.com/loftimmigration"
            target="_blank"
            rel="noreferrer"
            ><span style="color: blue">Facebook</span></a
          >,
          <a
            href="https://twitter.com/loftimmigration"
            target="_blank"
            rel="noreferrer"
            ><span style="color: blue">Twitter</span></a
          >,
          <a
            href="https://www.linkedin.com/company/loft-immigration-inc"
            target="_blank"
            rel="noreferrer"
            ><span style="color: blue">LinkedIn</span></a
          >
          &amp;
          <a
            href="https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg"
            target="_blank"
            rel="noreferrer"
            ><span style="color: blue">YouTube</span></a
          ><!-- o ignored --></span
        >
      </p>
    </div>
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
          href="http://loftimmigration.com"
          >WEBSITE</a
        >
      </span>
      <span style="display: inline-block; width: 32%">
        <a
          style="
            text-decoration: none;
            color: rgb(124, 124, 124);
            font-weight: 600;
          "
          href="http://loftimmigration.com/contact"
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
          href="http://loftimmigration.com/privacy-policy"
          >PRIVACY POLICY</a
        >
      </span>
    </div>
    <p>
      <small
        >Confidentiality Notice: The contents of this e-mail are intended
        for the named recipient only. It may contain confidential and
        privileged information. If you received it in error, please notify
        us immediately and then destroy it. Internet communications are not
        secure, and therefore Loft Immigration does not accept legal
        responsibility for the contents of this message. Also, and though we
        provide every effort to keep our network free from viruses, you
        would need to check this e-mail and any attachments for viruses as
        we can take no responsibility for any computer virus which might be
        transferred by way of this e-mail.
      </small>
    </p>
  </div>
</div>


`
  },
  reviewedEmailTemplate = (immigrant, type = '') => {
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
      padding: 5px 10px;
      border-radius: 3px 3px 0px 0px;
      border-bottom: 1px solid #f5f5f5;
    "
  >
    <div style="width: 20%; display: inline-block">
      <img
        src="https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png"
        alt="Loft Immigration"
        width="80px"
        height="auto"
      />
    </div>
    <div style="width: 78%; display: inline-block">
      <h4
        style="
          text-align: center;
          font-family: Georgia, 'Times New Roman', Times, serif;
          margin: 0px;
          color: #e50404;
        "
      >
        ${type} Assessment
      </h4>
    </div>
  </div>
  <div style="padding: 20px">
    <p>Hello ${immigrant.first_name},</p>
    <p>
      Thank you once again for taking the time to fill the assessment form, we have reviewed it.

      <p>We will like to book a one-on-one zoom session with you and Mr. Patrick Peters. However, we require a 5-10 minutes alignment session (pre-zoom meeting) to discuss with one of our licensed immigration specialist – Mrs. Adewunmi. You can reach her via - <a href="https://api.whatsapp.com/send?phone=14164921222" target="_blank" rel="noreferrer"><span style="color: black; background: yellow; mso-highlight: yellow">WHATSAPP</span></a>, <span style="background: yellow; mso-highlight: yellow"><a href="http://bit.ly/SkypewithLoftImmi" target="_blank" rel="noreferrer"><span style="color: black">SKYPE</span></a>, or directly via <u>+1 (416) 492-1222.</u></span>
      </p>
    </p>
    <p>Warm regards<br />
      <strong>Sophia Miles</strong><br />
      <small><em>Admin. Assistant</em></small>
    </p>
  </div>
  <div
    style="
      padding: 20px 0;
      background-color: rgb(245, 245, 245);
      font-size: 12px;
      color: #8c8c8c;
    "
  >
    <div style="color: #000">
      <strong
        ><small
          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights
          Reserved.</small
        ></strong
      >
    </div>
    <div>
      Member of the Immigration Consultants of Canada Regulatory Council
      (ICCRC) Member #R535739
    </div>
    <div>
      Member of Canadian Association of Professional Immigration Consultants
      (CAPIC)
    </div>
    <div>
      <a href="tel:+1 - (365) – 887 – 0360">+1 - (365) – 887 – 0360</a
      ><br />
      <a href="https://loftimmigration.com/"
        >https://loftimmigration.com/ </a
      ><br />
      <a
        href="https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g"
        target="_blank"
        rel="noreferrer"
        ><span
          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,
          ON L4C 3B5, Canada</span
        ></a
      >
      <p>
        <span
          >Be social, follow us on
          <a
            href="https://www.instagram.com/loftimmigration"
            target="_blank"
            rel="noreferrer"
            ><span style="color: blue">Instagram</span></a
          >,
          <a
            href="https://www.facebook.com/loftimmigration"
            target="_blank"
            rel="noreferrer"
            ><span style="color: blue">Facebook</span></a
          >,
          <a
            href="https://twitter.com/loftimmigration"
            target="_blank"
            rel="noreferrer"
            ><span style="color: blue">Twitter</span></a
          >,
          <a
            href="https://www.linkedin.com/company/loft-immigration-inc"
            target="_blank"
            rel="noreferrer"
            ><span style="color: blue">LinkedIn</span></a
          >
          &amp;
          <a
            href="https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg"
            target="_blank"
            rel="noreferrer"
            ><span style="color: blue">YouTube</span></a
          ><!-- o ignored --></span
        >
      </p>
    </div>
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
          href="http://loftimmigration.com"
          >WEBSITE</a
        >
      </span>
      <span style="display: inline-block; width: 32%">
        <a
          style="
            text-decoration: none;
            color: rgb(124, 124, 124);
            font-weight: 600;
          "
          href="http://loftimmigration.com/contact"
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
          href="http://loftimmigration.com/privacy-policy"
          >PRIVACY POLICY</a
        >
      </span>
    </div>
    <p>
      <small
        >Confidentiality Notice: The contents of this e-mail are intended
        for the named recipient only. It may contain confidential and
        privileged information. If you received it in error, please notify
        us immediately and then destroy it. Internet communications are not
        secure, and therefore Loft Immigration does not accept legal
        responsibility for the contents of this message. Also, and though we
        provide every effort to keep our network free from viruses, you
        would need to check this e-mail and any attachments for viruses as
        we can take no responsibility for any computer virus which might be
        transferred by way of this e-mail.
      </small>
    </p>
  </div>
</div>


`
  }

module.exports = { sendMail, successEmailTemplate, reviewedEmailTemplate }

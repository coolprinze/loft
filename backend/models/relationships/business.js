const BusinessImmigrant = require('./BusinessImmigrant')
const {
  Country,
} = require('./Country')
const Qualification = require('./Qualification')
const Spouse = require('./Spouse')
const BusinessProfile = require('./BusinessProfile')
const Fund = require('./Fund')
const MailQueue = require('./MailQueue')
const {
  successEmailTemplate,
  reviewedEmailTemplate,
  sendMail,
} = require('../mail/index.js')
const { _calculateAge } = require('../helpers/utilities')

/* -----------------------------------------------------------------*/
/* ---------------- Business Immigrant Associations ----------------*/
/* -----------------------------------------------------------------*/

BusinessImmigrant.hasMany(Qualification, {
  foreignKey: 'immigrantId',
  constraints: false,
  scope: {
    immigrantType: 'business',
    refType: 'applicant',
  },
})
BusinessImmigrant.hasMany(MailQueue, {
  foreignKey: 'immigrantId',
  constraints: false,
  scope: {
    immigrantType: 'business',
  },
})
BusinessImmigrant.hasOne(Spouse, {
  scope: {
    spouseType: 'business',
  },
  foreignKey: 'immigrantId',
})
BusinessImmigrant.belongsTo(Fund, {
  foreignKey: 'networth',
  as: 'networthRange',
})
BusinessImmigrant.belongsTo(Fund, {
  foreignKey: 'invest_funds',
  as: 'investRange',
})
BusinessImmigrant.hasOne(BusinessProfile)
BusinessImmigrant.belongsTo(Country, {
  foreignKey: 'residenceId',
  as: 'residenceCountry',
})
BusinessImmigrant.belongsTo(Country, {
  foreignKey: 'citizenshipId',
  as: 'citizenshipCountry',
})
BusinessImmigrant.beforeFindAfterExpandIncludeAll('huih', (immigrant) => {})

BusinessImmigrant.beforeCreate((immigrant) => {
  const { invest_funds, qualifications: quals, spouse, dob } = immigrant
  const checkQualification = (degreeLevel) =>
    !!quals.length &&
    (!!quals.find((qual) =>
      degreeLevel === 'single' ? qual.degreeId <= 2 : qual.degreeId > 2
    )
      ? { status: true, eligible_party: 'applicant' }
      : { status: false, eligible_party: null } ||
        (!!spouse &&
          !!spouse.qualifications.length &&
          !!spouse.qualifications.find((qual) =>
            degreeLevel === 'single' ? qual.degreeId <= 2 : qual.degreeId > 2
          )))
      ? { status: true, eligible_party: 'spouse' }
      : { status: false, eligible_party: null }

  let isBsc = checkQualification('single'),
    isMsc = checkQualification('multiple'),
    age = _calculateAge(dob),
    spouseAge = !!spouse ? _calculateAge(spouse.dob) : 100,
    spouseBsc = isBsc.eligible_party === 'spouse' && isBsc.status,
    spouseMsc = isMsc.eligible_party === 'spouse' && isMsc.status,
    group = 0,
    eligible_party = null

  if (invest_funds >= 7 && invest_funds <= 10) {
    group = 1
    eligible_party = 'applicant'
  } else if ((age > 30 && isBsc.status) || (spouseAge > 30 && spouseBsc)) {
    group = 7
    eligible_party = isBsc.eligible_party
  } else if ((age <= 30 && isMsc.status) || (spouseAge <= 30 && spouseMsc)) {
    group = 5
    eligible_party = isBsc.eligible_party
  } else if ((age >= 31 && isMsc.status) || (spouseAge >= 31 && spouseMsc)) {
    group = 6
    eligible_party = isBsc.eligible_party
  } else if ((age < 30 && isBsc.status) || (spouseAge < 30 && spouseBsc)) {
    group = 8
    eligible_party = isBsc.eligible_party
  }

  immigrant.group = group
  immigrant.eligible_party = eligible_party
})

BusinessImmigrant.afterCreate((immigrant) => {
  let { email } = immigrant
  const date = new Date()
  const type = 'Business'
  date.setMinutes(date.getMinutes() + 10)
  console.log(`Will send 2nd mail to ${email} on: `, date)
  sendMail(
    {
      to: email,
      from: {
        name: `Loft Immigration | ${type} Assessment`,
        address: 'immigrants@loftimmigration.com',
      },
      subject: 'Application Successful',
      html: successEmailTemplate(immigrant, type),
    },
    (res) => console.log(res.envelope || res)
  )
  immigrant.createMailQueue({
    to: email,
    from_name: `Loft Immigration | ${type} Assessment`,
    from_address: 'immigrants@loftimmigration.com',
    subject: 'Application Reviewed',
    message: reviewedEmailTemplate(immigrant, type),
    title: `2nd Mail to ${type} Immigrant`,
    schedule: date,
  })
})

module.exports = BusinessImmigrant
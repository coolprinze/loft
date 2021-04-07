const {
  Country,
} = require('./Country')
const Qualification = require('./Qualification')
const Experience = require('./WorkHistory')
const Spouse = require('./Spouse')
const MailQueue = require('./MailQueue')
const {
  successEmailTemplate,
  reviewedEmailTemplate,
  sendMail,
} = require('../mail/index.js')
const { _calculateAge } = require('../helpers/utilities')
const GeneralImmigrant = require('./General')


/* -----------------------------------------------------------------*/
/* ---------------- General Immigrant Associations ----------------*/
/* -----------------------------------------------------------------*/

GeneralImmigrant.hasOne(Spouse, {
  scope: {
    spouseType: 'business',
  },
  foreignKey: 'immigrantId',
})
GeneralImmigrant.belongsTo(Country, {
  foreignKey: 'citizenshipId',
  as: 'citizenshipCountry',
})
GeneralImmigrant.belongsTo(Country, {
  foreignKey: 'residenceId',
  as: 'residenceCountry',
})
GeneralImmigrant.hasMany(Qualification, {
  foreignKey: 'immigrantId',
  constraints: false,
  scope: {
    immigrantType: 'general',
    refType: 'applicant',
  },
})
GeneralImmigrant.hasMany(Experience, {
  unique: false,
  scope: {
    immigrantType: 'general',
  },
  foreignKey: 'immigrantId',
})
GeneralImmigrant.hasMany(MailQueue, {
  foreignKey: 'immigrantId',
  constraints: false,
  scope: {
    immigrantType: 'general',
  },
})
GeneralImmigrant.beforeFindAfterExpandIncludeAll('huih', (immigrant) => {})

GeneralImmigrant.beforeCreate((immigrant) => {
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

GeneralImmigrant.afterCreate((immigrant) => {
  let { email } = immigrant
  const date = new Date()
  const type = 'General'
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

module.exports = GeneralImmigrant

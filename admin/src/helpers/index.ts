import moment from 'moment'
import {
  experienceType,
  languageProfType,
  qualificationType,
} from '../interface'

const { format } = require('number-currency-format')
const logout = (err: string) => {
  if (err === 'Invalid token') {
    removeLocal('user')
    removeLocal('token')
    window.location.reload()
  }
}

export const getObject = (collection: any[], key: number) => {
  return collection.find((object: any) => object.id === key)
}

export const toPlural = (val: number, text: string) =>
  `${val} ${text}${(val > 1 && 's') || ''}`

export const getExt = (text: string) => `${text.split('.').pop()}`

export const handleErr = (error: any) => {
  if (error.response) {
    logout(error.response.data.message)
    return error.response.data.message
  } else if (error.message) {
    logout(error.message)
    return error.message
  }
}

export const getLocal = (name: string, parse: boolean = true) => {
  const data = localStorage.getItem(name)
  return data ? (parse ? JSON.parse(data) : data) : null
}
export const setLocal = (name: string, content: Object | string) =>
  localStorage.setItem(
    name,
    typeof content === 'object' ? JSON.stringify(content) : content
  )

export const removeLocal = (name: string) => localStorage.removeItem(name)

export const _calculateAge = (birthday: string) => {
  var ageDifMs = new Date().getTime() - new Date(birthday).getTime()
  var ageDate = new Date(ageDifMs) // miliseconds from epoch
  return Math.abs(ageDate.getUTCFullYear() - 1970)
}

const formatNum = (num: number) =>
  format(num, {
    currency: '$',
    showDecimals: 'NEVER',
    currencyPosition: 'LEFT',
    spacing: false,
  })

export const fundsAction = (
  funds: {
    min: number
    max: number
    type: string
    id: number
  }[]
) =>
  funds
    .sort((a, b) => a.min - b.min)
    .map((fund) => ({
      name:
        fund.min === 0
          ? `Less than ${formatNum(fund.max)}`
          : fund.max === 0
          ? `Above ${formatNum(fund.min)}`
          : `${formatNum(fund.min)} to ${formatNum(fund.max)}`,
      value: fund.id,
    }))

export const dateDiffsToReadable = (date1: string, date2: string) => {
  var a = moment(date1)
  var b = moment(date2)

  var years = b.diff(a, 'year')
  a.add(years, 'years')

  var months = b.diff(a, 'months')
  a.add(months, 'months')

  return `${years} years ${months ? `and ${months} months` : ''}`
}

export const qualToString = (_qs: qualificationType[]) => {
  let qs = ''

  _qs.map(({ from, to, degree, school, city, country }, index) => {
    qs += `(${dateDiffsToReadable(from, to)} ${
      degree.title
    } in ${school}, ${city} ${country.name})${
      index + 1 === _qs.length ? '' : ','
    } `
    return null
  })

  return _qs.length ? qs : 'None'
}

export const experienceToString = (_es: experienceType[]) => {
  let es = ''

  _es.map(({ from, to, employer, city, occupation, country }, index) => {
    es += `(Worked ${dateDiffsToReadable(from, to)} as a/an ${
      occupation.name
    } in ${employer}, ${city} ${country.name})${
      index + 1 === _es.length ? '' : ','
    } `
    return null
  })

  return _es.length ? es : 'None'
}

export const laguageToString = (_ls: languageProfType[]) => {
  let ls = ''

  _ls.map(({ level, language }, index) => {
    ls += `(${language.name} >> ${level})${
      index + 1 === _ls.length ? '' : ','
    } `
    return null
  })

  return _ls.length ? ls : 'None'
}

const { format } = require('number-currency-format')
const logout = (err: string) => {
  if (err === 'Invalid token') {
    removeLocal('user')
    removeLocal('token')
    window.location.reload()
  }
}

export const getObject = (collection: any[], key: any) => {
  return collection.find((object: any) => object.id == key)
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
  funds.map((fund: { min: number; max: number; type: string; id: number }) => ({
    name:
      fund.min === 0
        ? `Less than ${formatNum(fund.max)}`
        : fund.max === 0
        ? `Above ${formatNum(fund.min)}`
        : `${formatNum(fund.min)} to ${formatNum(fund.max)}`,
    value: fund.id,
  }))

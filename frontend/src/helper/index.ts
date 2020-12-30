const { format } = require('number-currency-format')

export const getObject = (collection: any[], key: any) => {
  return collection.find((object: any) => object.id === key)
}

export const toPlural = (val: number, text: string) =>
  `${val} ${text}${(val > 1 && 's') || ''}`

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

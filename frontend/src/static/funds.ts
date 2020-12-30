const { format } = require('number-currency-format')

const Funds = [
  { min: 0, max: 350000, type: 'worth', id: 1 },
  { min: 350000, max: 500000, type: 'worth', id: 2 },
  { min: 500000, max: 1000000, type: 'worth', id: 3 },
  { min: 1000000, max: 1500000, type: 'worth', id: 4 },
  { min: 2000000, max: 2500000, type: 'worth', id: 5 },
  { min: 2500000, max: 0, type: 'worth', id: 6 },
  { min: 150000, max: 250000, type: 'invest', id: 7 },
  { min: 250000, max: 500000, type: 'invest', id: 8 },
  { min: 500000, max: 1000000, type: 'invest', id: 9 },
  { min: 1000000, max: 0, type: 'invest', id: 10 },
]
const formatNum = (num: number) =>
  format(num, {
    currency: '$',
    showDecimals: 'NEVER',
    currencyPosition: 'LEFT',
    spacing: false,
  })

const action = (fund: {
  min: number
  max: number
  type: string
  id: number
}) => ({
  name:
    fund.min === 0
      ? `Less than ${formatNum(fund.max)}`
      : fund.max === 0
      ? `Above ${formatNum(fund.min)}`
      : `${formatNum(fund.min)} to ${formatNum(fund.max)}`,
  value: fund.id,
})

export const netWorthRange = Funds.filter(({ type }) => type === 'worth').map(
  action
)
export const investmentRange = Funds.filter(
  ({ type }) => type === 'invest'
).map(action)

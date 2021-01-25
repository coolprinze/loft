export const errHandler = (err: any, callback: (e: string) => void) => {
  console.log(err)

  if (Array.isArray(err)) {
    err.forEach((error) => callback(error[Object.keys(error)[0]]))
  } else if (typeof err === 'object') {
    if (err.message) {
      callback(err.message.replace('_', ' '))
    } else if (err.data?.name === 'SequelizeUniqueConstraintError') {
      const errField = err.data.errors[0].message
        .split(' ')[0]
        .replace(/_/g, ' ')
      callback(`Duplicate Entry: ${errField} already exists!`)
    } else {
      let keys = Object.keys(err)
      keys.forEach((key) => {
        callback(err[key])
      })
    }
  } else if (typeof err === 'string') {
    callback(err)
  }
}

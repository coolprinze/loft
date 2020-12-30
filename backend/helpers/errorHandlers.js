const dbErrorHandler = (err, callback) => {
  let errors = {}
  err.code && err.code === 11000
    ? (() => {
        Object.keys(err.keyValue).map((key) => {
          errors[key] = 'Duplicate entry'
        })
        callback(errors)
      })()
    : err.errors
    ? callback(err.errors)
    : callback(err)
}

const throwErr = (err) => {
  throw new Error(err)
}

module.exports = { dbErrorHandler, throwErr }

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

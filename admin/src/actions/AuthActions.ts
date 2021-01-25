import Axios from 'axios'
import { toast } from 'react-toastify'
import { header, URL } from '../config'
import { errHandler } from './errorHandler'
import { LOGOUT_USER, AUTH_SUCCESS } from './types'
import { Dispatch } from 'redux'
import userType from '../interface/user'

export const authenticateUser = (
  user: { identifier: string; password: string },
  callBack: any = () => {}
) => async (dispatch: Dispatch) => {
  await Axios.post(`${URL}/users/login`, user, header)
    .then(async (res) => {
      callBack(true, false)
      await setUser(res.data)(dispatch)
      toast('Login Successful')
    })
    .catch((err) => {
      callBack(false, { loading: false })
      errHandler('Invalid Credentials', toast)
    })
}

export const setUser = (data: { token: string; user: userType }) => async (
  dispatch: Dispatch
) => {
  dispatch({
    type: AUTH_SUCCESS,
    payload: data,
  })
}

export const resetPassword = async (data: any, callBack = (res: any) => {}) => {
  header.headers.Authorization = `Bearer ${data.token}`
  await Axios.patch(`${URL}/users/reset-password`, data, header)
    .then((res) => {
      callBack(true)
      toast('Password reset successful, proceed to login')
    })
    .catch((err) => {
      callBack(false)
      errHandler(err.response.data, toast)
    })
}

export const forgotPassword = async (
  email: string,
  callBack = (res: any) => {}
) =>
  await Axios.post(`${URL}/users/forgot-password`, { email }, header)
    .then(async (res) => {
      toast('A link to reset your password have been sent to your email')

      callBack(true)
    })
    .catch((err) => {
      callBack(false)
      errHandler(err.response.data, toast)
    })

export const logOut = () => (dispatch: Dispatch) => {
  localStorage.removeItem('user')
  localStorage.removeItem('token')
  header.headers.Authorization = ''

  toast('Successfully logged out')
  dispatch({
    type: LOGOUT_USER,
  })
}

import { LOGOUT_USER, AUTH_SUCCESS } from '../actions/types'
import { setLocal } from '../helpers'

const authReducer = (state = {}, action: { type: string; payload: any }) => {
  switch (action.type) {
    case AUTH_SUCCESS:
      const { token } = action.payload
      delete action.payload.token
      setLocal('token', token)
      setLocal('user', action.payload)
      return {
        ...state,
        authLoaded: true,
        token,
        user: action.payload,
        isAuthenticated: true,
        goBack: true,
      }

    case LOGOUT_USER:
      return {
        ...state,
        authLoaded: true,
        isAuthenticated: false,
        user: null,
        token: '',
      }

    default:
      return state
  }
}

export default authReducer

import {
  IMMIGRANT_DELETE_FAILED,
  IMMIGRANT_DELETE_REQUEST,
  IMMIGRANT_DELETE_SUCCESS,
  IMMIGRANT_LIST_FAILED,
  IMMIGRANT_LIST_REQUEST,
  IMMIGRANT_LIST_SUCCESS,
  BUSINESS_LIST_FAILED,
  BUSINESS_LIST_REQUEST,
  BUSINESS_LIST_SUCCESS,
  GENERAL_LIST_FAILED,
  GENERAL_LIST_REQUEST,
  GENERAL_LIST_SUCCESS,
  IMMIGRANT_LIST_RESET,
} from '../constants/immigrantsConstants'

export const immigrantDeleteReducer = (
  state = {},
  { type, payload = null }: { type: string; payload: any }
) => {
  switch (type) {
    case IMMIGRANT_DELETE_REQUEST:
      return { loading: true }
    case IMMIGRANT_DELETE_SUCCESS:
      return { loading: false, success: true }
    case IMMIGRANT_DELETE_FAILED:
      return { loading: true, error: payload }
    default:
      return state
  }
}

export const immigrantListReducer = (
  state = { immigrantList: [] },
  { type, payload = null }: { type: string; payload: any }
) => {
  switch (type) {
    case IMMIGRANT_LIST_REQUEST:
      return { ...state, loading: true }
    case IMMIGRANT_LIST_SUCCESS:
      return { ...state, loading: false, immigrantList: payload }
    case IMMIGRANT_LIST_FAILED:
      return { ...state, loading: false, error: payload }
    case IMMIGRANT_LIST_RESET:
      return { immigrantList: [] }
    default:
      return state
  }
}

export const businessListReducer = (
  state = { businessList: [] },
  { type, payload = null }: { type: string; payload: any }
) => {
  switch (type) {
    case BUSINESS_LIST_REQUEST:
      return { ...state, loading: true }
    case BUSINESS_LIST_SUCCESS:
      return { ...state, loading: false, businessList: payload }
    case BUSINESS_LIST_FAILED:
      return { ...state, loading: false, error: payload }
    default:
      return state
  }
}

export const generalListReducer = (
  state = { generalList: [] },
  { type, payload = null }: { type: string; payload: any }
) => {
  switch (type) {
    case GENERAL_LIST_REQUEST:
      return { ...state, loading: true }
    case GENERAL_LIST_SUCCESS:
      return { ...state, loading: false, generalList: payload }
    case GENERAL_LIST_FAILED:
      return { ...state, loading: false, error: payload }
    default:
      return state
  }
}

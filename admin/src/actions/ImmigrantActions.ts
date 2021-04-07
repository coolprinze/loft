import Axios from 'axios'
import { toast } from 'react-toastify'
import { Dispatch } from 'redux'
import { URL } from '../config'
import {
  BUSINESS_LIST_FAILED,
  BUSINESS_LIST_REQUEST,
  BUSINESS_LIST_SUCCESS,
  GENERAL_LIST_FAILED,
  GENERAL_LIST_REQUEST,
  GENERAL_LIST_SUCCESS,
  IMMIGRANT_LIST_FAILED,
  IMMIGRANT_LIST_REQUEST,
  IMMIGRANT_LIST_RESET,
  IMMIGRANT_LIST_SUCCESS,
  SEARCH_IMMIGRANT_FAILED,
  SEARCH_IMMIGRANT_REQUEST,
} from '../constants/immigrantsConstants'
import { handleErr } from '../helpers'

export type collectionType =
  | 'generals'
  | 'students'
  | 'businesses'
  | 'families'
  | 'antigua'
  | 'stkitts'

export const getImmigrants = (collection: collectionType) => async (
  dispatch: Dispatch,
  getState: any
) => {
  try {
    dispatch({
      type: IMMIGRANT_LIST_REQUEST,
    })
    const {
      auth: { token },
    } = getState()

    const config = {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    }
    const res = await Axios.get(`${URL}/immigrants/${collection}`, config)

    dispatch({
      type: IMMIGRANT_LIST_SUCCESS,
      payload: res.data,
    })
  } catch (error) {
    dispatch({
      type: IMMIGRANT_LIST_FAILED,
      payload: handleErr(error),
    })
    toast(handleErr(error))
  }
}

export const getBusinessImmigrants = () => async (
  dispatch: Dispatch,
  getState: any
) => {
  try {
    dispatch({
      type: BUSINESS_LIST_REQUEST,
    })
    const {
      auth: { token },
    } = getState()

    const config = {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    }
    const res = await Axios.get(`${URL}/immigrants/businesses`, config)

    dispatch({
      type: BUSINESS_LIST_SUCCESS,
      payload: res.data,
    })
    return res.data
  } catch (error) {
    dispatch({
      type: BUSINESS_LIST_FAILED,
      payload: handleErr(error),
    })
    toast(handleErr(error))
  }
}

export const getGeneralImmigrants = () => async (
  dispatch: Dispatch,
  getState: any
) => {
  try {
    dispatch({
      type: GENERAL_LIST_REQUEST,
    })
    const {
      auth: { token },
    } = getState()

    const config = {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    }
    const res = await Axios.get(`${URL}/immigrants/generals`, config)

    dispatch({
      type: GENERAL_LIST_SUCCESS,
      payload: res.data,
    })
    return res.data
  } catch (error) {
    dispatch({
      type: GENERAL_LIST_FAILED,
      payload: handleErr(error),
    })
    toast(handleErr(error))
  }
}

export const resetImmigrantList = () => (dispatch: Dispatch) => {
  dispatch({
    type: IMMIGRANT_LIST_RESET,
  })
}

export const searchDb = (collection: collectionType, query: object) => async (
  dispatch: Dispatch,
  getState: any
) => {
  try {
    dispatch({
      type: SEARCH_IMMIGRANT_REQUEST,
    })
    const {
      auth: { token },
    } = getState()

    const config = {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    }
    let param = '?'

    for (const [key, value] of Object.entries(query)) {
      if (value) param += `${key}=${value}&`
    }

    const res = await Axios.get(
      `${URL}/immigrants/${collection + param}`,
      config
    )

    dispatch({
      type:
        collection === 'businesses'
          ? BUSINESS_LIST_SUCCESS
          : IMMIGRANT_LIST_SUCCESS,
      payload: res.data,
    })
  } catch (error) {
    dispatch({
      type: SEARCH_IMMIGRANT_FAILED,
      payload: handleErr(error),
    })
    toast(handleErr(error))
  }
}

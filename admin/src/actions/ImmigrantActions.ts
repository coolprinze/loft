import Axios from 'axios'
import { toast } from 'react-toastify'
import { Dispatch } from 'redux'
import { URL } from '../config'
import {
  IMMIGRANT_LIST_FAILED,
  IMMIGRANT_LIST_REQUEST,
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

export const searchDb = (
  collection: collectionType,
  searchParam: string
) => async (dispatch: Dispatch, getState: any) => {
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
    const res = await Axios.get(
      `${URL}/immigrants/${collection}?_q=${searchParam}`,
      config
    )

    dispatch({
      type: IMMIGRANT_LIST_SUCCESS,
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

const realData = {
  id: 5,
  first_name: 'Ebuka',
  last_name: 'Nwosu',
  email: 'info@cybertechdigitals.com',
  phone: '8107539186',
  married: 'false',
  old_dependents: 0,
  young_dependents: 0,
  teen_dependents: 0,
  average_dependents: 0,
  rejected: true,
  deported: true,
  contact_medium: 'Phone Call',
  referee: 'Instagram',
  createdAt: '2021-01-14T08:35:33.000Z',
  updatedAt: '2021-01-14T08:35:33.000Z',
  invest_funds: 9,
  networth: 3,
  residence: 2,
  nationality: 3,
  fund: {
    id: 3,
    min: 500000,
    max: 1000000,
    type: 'worth',
    createdAt: '2021-01-14T07:49:27.000Z',
    updatedAt: '2021-01-14T07:49:27.000Z',
  },
  country: {
    id: 3,
    name: 'Albania',
    code: 'AL',
    slug: 'albania',
    flag: 'https://restcountries.eu/data/alb.svg',
    desc: 'Albania',
    createdAt: '2021-01-14T07:49:27.000Z',
    updatedAt: '2021-01-14T07:49:27.000Z',
  },
  RejectedCountries: [
    {
      id: 2,
      name: 'Åland Islands',
      code: 'AX',
      slug: 'land-islands',
      flag: 'https://restcountries.eu/data/ala.svg',
      desc: 'Åland Islands',
      createdAt: '2021-01-14T07:49:27.000Z',
      updatedAt: '2021-01-14T07:49:27.000Z',
      rejected_countries: {
        createdAt: '2021-01-14T08:35:33.000Z',
        updatedAt: '2021-01-14T08:35:33.000Z',
        antiguaImmigrantId: 5,
        countryId: 2,
      },
    },
    {
      id: 3,
      name: 'Albania',
      code: 'AL',
      slug: 'albania',
      flag: 'https://restcountries.eu/data/alb.svg',
      desc: 'Albania',
      createdAt: '2021-01-14T07:49:27.000Z',
      updatedAt: '2021-01-14T07:49:27.000Z',
      rejected_countries: {
        createdAt: '2021-01-14T08:35:33.000Z',
        updatedAt: '2021-01-14T08:35:33.000Z',
        antiguaImmigrantId: 5,
        countryId: 3,
      },
    },
  ],
  DeportedCountries: [],
}

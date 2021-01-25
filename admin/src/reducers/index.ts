import { combineReducers } from 'redux'
import { default as auth } from './AuthReducers'
import {
  immigrantDeleteReducer as immigrantDelete,
  immigrantListReducer as immigrantList,
} from './ImmigrantReducers'

export default combineReducers({
  auth,
  immigrantDelete,
  immigrantList,
})

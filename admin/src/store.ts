import { applyMiddleware, createStore } from 'redux'
import { composeWithDevTools } from 'redux-devtools-extension'
import thunk from 'redux-thunk'
import { getLocal } from './helpers'
import reducers from './reducers'

const auth = {
  isAuthenticated: getLocal('token', false),
  user: getLocal('user'),
  token: getLocal('token', false),
}

const initialState = {
  auth,
}

const middleware = [thunk]

const store = createStore(
  reducers,
  initialState,
  composeWithDevTools(applyMiddleware(...middleware))
)

export default store

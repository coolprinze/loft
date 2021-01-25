import { Dispatch } from 'redux';
import { LOGOUT_USER } from './types';

const dispatchAction = (action: { type: string; payload?: string }) => (
  dispatch: Dispatch
) => dispatch(action);

export const errHandler = (err: any, callback: (e: string) => void) => {
  if (Array.isArray(err)) {
    err.forEach(error => callback(error[Object.keys(error)[0]]));
  } else if (typeof err === 'object') {
    if (err.message) {
      callback(err.message);
    } else if (err.error && err.auth) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      callback(err.error);
      dispatchAction({ type: LOGOUT_USER });
    } else {
      let keys = Object.keys(err);
      keys.forEach(key => {
        callback(err[key]);
      });
    }
  } else if (typeof err === 'string') {
    callback(err);
  }
};

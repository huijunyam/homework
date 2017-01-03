import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

// const addLoggingToDispatch = store => next => action => {
//   const localDispatch = store.dispatch;
//   console.log(store.getState());
//   console.log(action);
//   let result = localDispatch(action);
//   console.log(store.getState());
//   return result;
// };

// const applyMiddleware = (store, ...middleWares) => {
//   let dispatch = store.dispatch;
//   middleWares.forEach(middleWare => {
//     dispatch = (middleWare(store)(dispatch));
//   });
//   return Object.assign({}, store, { dispatch });
// };

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  // store = applyMiddleware(store, addLoggingToDispatch);
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

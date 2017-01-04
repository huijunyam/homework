import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
// import { fetchSearchGiphys } from './actions/giphy_actions';
// import { receiveSearchGiphys } from './actions/giphy_actions';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    const root = document.getElementById('root');
    ReactDOM.render(<Root store={store} />, root);
});
// window.store = store;
// window.receiveSearchGiphys = receiveSearchGiphys;
// window.fetchSearchGiphys = fetchSearchGiphys;

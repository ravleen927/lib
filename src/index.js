import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

const root = document.getElementById('root');
const rootInstance = ReactDOM.createRoot(root);
rootInstance.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
);

reportWebVitals();

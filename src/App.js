import React from 'react';
import './App.css';
import { Route } from 'react-router-dom';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <Route path='/a'>
          Page A
        </Route>
        <Route path='/b'>
          Page B
        </Route>
      </header>
    </div>
  );
}

export default App;

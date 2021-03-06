import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import OtherPage from './OtherPage';
import Fib from './Fib';

class App extends Component {
  render() {
    return (
      <Router>
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo"/>
          <h3 className="App-title">Fib Calculator - Kubernetes Edition</h3>
          <p>
            <Link to="/">Home</Link>&nbsp;|&nbsp;
            <Link to="/otherpage">Other Page</Link>
          </p>
          <p>
          <div>
            <Route exact path="/" component={Fib} />
            <Route path="/otherpage" component={OtherPage} />
          </div>               
          </p>
        </header>     
      </div>
      </Router>
    );
  }
}

export default App;

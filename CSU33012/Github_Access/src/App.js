import React, { Component } from 'react';
import Heatmap from './Heatmap'
import './App.css';
import * as d3 from "d3";
import {hexbin} from 'd3-hexbin';

class App extends Component {
  constructor(props){
    super(props);
    this.state = {data:[]}
    this.getData();
    setInterval(()=>this.geData(), 1000);
  }

  async getFollowers(){
    var username;
    var api_link = 'https://api.github.com/users/rwejiv/followers';
    const response = await fetch(api_link);
    const data = await response.json();
    for (var i = 0; i < data.lenth; i++){
      username = data[i].login;
    }
    // fixture
  }

  render() {
    if (this.state.data.length === 0){
      return null;
    }
    return (
      <div className="App">
        <h2>Number of followers</h2>
        <HeatMap data = {this.state.data}/>
      </div>
    );
  }
}

export default App;

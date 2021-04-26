import React, { Component } from "react";
import { render } from "react-dom";
import axios from 'axios'
import { Link } from "react-router-dom";

class Streamer extends Component {
  // state = {
  //   weather: []
  // };

  // componentDidMount() {
  //   navigator.geolocation.getCurrentPosition(function(position) {
  //     console.log("Latitude is :", position.coords.latitude);
  //     console.log("Longitude is :", position.coords.longitude);
  //   });
  //   // axios
  //   //   .get('/weather')
  //   //   .then(response => {
  //   //     this.setState({ weather: response.data.weather });
  //   //   })
  // }

  // renderWeather = () => {
  //   return(
  //     <ul>
  //       {this.state.weather.map(post => (
  //         <li key={post}>{post}</li>
  //       ))}
  //     </ul>
  //   )
  // }

  render() {
    return (
      <div>
        <Link to="/getWeather" className="btn btn-link mt-3">
                    Get Weather
                  </Link>
        {/* {this.state.weather} */}
        {/* <h4>Using geolocation JavaScript API in React</h4> */}
      </div>
    );
  }
}
export default Streamer;
// render(<App />, document.getElementById("root"));
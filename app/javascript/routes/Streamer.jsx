import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
// import Streamer from "../components/elevator_media/Streamer";
import Weather from "../components/elevator_media/Weather"

export default (
  <Router>
    <Switch>
      <Route path="/react/weather" exact component={Weather} />
    </Switch>
  </Router>
);
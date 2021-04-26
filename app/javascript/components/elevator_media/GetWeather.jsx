import React, { useState } from 'react';
import axios from 'axios';

const GetWeather = () => {

    const [weather, setWeather] = useState([]);
    const [inputCity, setInputCity] = useState('');

    const handleCityChange = event => {
        setInputCity(event.target.value);
    };

    const getCityWeather = () => {
        axios.get('/getWeatherReact', {
            params: {
                city: inputCity
            }
        })
            .then(response => {
                // this.setState({ weather: response.data.html.main, isLoading: false});
                setWeather(response.data.html.main)
                console.log(response.data.html)})
    }

  return (
    <div>
        <input type="text" data-testid="cityInput" value={inputCity} onChange={handleCityChange}/>
        <button 
            data-testid="submitCity" 
            onClick={getCityWeather}
        > Get Weather </button>
        {weather.toString}
    </div>
  );
};

export default GetWeather;
require "json"
require 'httparty'
module ElevatorMedia
    class Streamer   

        # @streamer = Streamer.new       

        def getContent(selected, city = nil)

            case selected               
            when "1"
                response = self.getWeather(city)
                html = "
                    <div class='row wow slideInUp' data-wow-duration='1s'>
                    <div class='col-md-4 col-md-offset-4'> 
                    <h2 class='fw-600 fs-36 font-roboto' style='text-align: center'>
                    <img src='#{response['weather'][0]['icon_uri']}' alt='weather_ico'><br />
                    It feels like #{response['main']['feels_like']}°C in #{response['name']} 
                    </h2>
                    </div>
                    </div>".html_safe
            when "2"
                response = JSON.parse(self.getJoke)
                html = "<div class='row wow slideInUp' data-wow-duration='1s'><div class='col-md-4 col-md-offset-4'><p class='fs-18 font-roboto' style='text-align: center'>
                        <img src='#{response['icon_url']}' alt='chuck_ico'><br />
                        #{response['value']}</p></div></div>".html_safe
            when "3"
                response = self.getGif
                html = "<div class='row wow slideInUp' data-wow-duration='1s'><div class='col-md-4 col-md-offset-4'><h2 class='fs-36 font-roboto' style='text-align: center'>
                        <img src='#{response}' alt='gif'><br />
                        </h2></div></div>".html_safe
            when "4"
                response = self.getAdvice
                html = "<div class='row wow slideInUp' data-wow-duration='1s'><div class='col-md-4 col-md-offset-4'><p class='fs-20 font-roboto line-height-30' style='text-align: center'>                     
                        #{response['slip']['advice']}</p></div></div>".html_safe            
            when "5"
                response = self.getProgJoke
                html = "<div class='row wow slideInUp' data-wow-duration='1s'><div class='col-md-4 col-md-offset-4'><p class='fs-20 font-roboto line-height-30' style='text-align: center'>                     
                        #{response}</p></div></div>".html_safe     
            when "6"
                response = self.getDarkJoke
                html = "<div class='row wow slideInUp' data-wow-duration='1s'><div class='col-md-4 col-md-offset-4'><p class='fs-20 font-roboto line-height-30' style='text-align: center'>                     
                        #{response}</p></div></div>".html_safe
            when "11"
                response = self.getWeather(city)           
            else
                puts 'error!'
            end
            
        end

        def getWeather(city)
            client = OpenWeather::Client.new
            weather = client.current_weather(city: "#{city}")
            response = JSON.parse(weather.to_json)
        end

        def getJoke
            response = HTTParty.get('https://api.chucknorris.io/jokes/random')   
            response.body       
        end

        def getGif
            response = HTTParty.get("http://api.giphy.com/v1/gifs/random?api_key=#{ENV['GIPHY_API_KEY']}&rating=r&tag=cat")   
            response = response['data']['images']['original']['url']    
        end

        def getAdvice
            response = HTTParty.get("https://api.adviceslip.com/advice")
            response = JSON.parse(response.body)
        end

        def getProgJoke
            response = HTTParty.get("https://v2.jokeapi.dev/joke/Programming?type=single")
            response = JSON.parse(response.body)['joke']
        end

        def getDarkJoke
            response = HTTParty.get("https://v2.jokeapi.dev/joke/Dark?type=single")
            response = JSON.parse(response.body)['joke']
        end
    end
end
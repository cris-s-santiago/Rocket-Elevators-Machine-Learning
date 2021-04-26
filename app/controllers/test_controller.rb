class TestController < ApplicationController

    def test2 
        @streamer = ElevatorMedia::Streamer.new
    end

    def getContent(city = nil, lat = nil, lng = nil)
        # let!(:streamer){ElevatorMedia::Streamer.new}
        @streamer = ElevatorMedia::Streamer.new
        # weather = @streamer.getWeather(city)
        html = @streamer.getContent(city)
        respond_to do |format|
            # render :json => weather.to_json
            render html: "#{html.html_safe}"
        end
    end

    def getWeather(city)
        @streamer = ElevatorMedia::Streamer.new
        weather = @streamer.getWeather(city)
        # render :json => weather.to_json
        puts weather.to_json
    end

end
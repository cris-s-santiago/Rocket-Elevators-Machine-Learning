# require '../../lib/elevator_media/streamer.rb'
# require '../../lib/elevator_media'
# include '../../lib/elevator_media'
# include ElevatorMedia
# require 'ElevatorMedia'
class MediaController < ApplicationController
    # include ElevatorMedia
    def getContent(city = nil, lat = nil, lng = nil)
        # puts params[:content][:city]
        # let!(:streamer){ElevatorMedia::Streamer.new}
        @streamer = ElevatorMedia::Streamer.new
        # weather = @streamer.getWeather(city)
        # html = @streamer.getContent(params[:city])
        html = @streamer.getContent(params[:city])


        puts '======================================================'
        puts html.html_safe

        # render component: 'Weather', props: {weather: html}
        # render html: html
        # render html: "#{html.html_safe}"

        # render html: helpers.tag.strong('Not Found')
        # respond_to do |format|
        #     # render :json => weather.to_json
        #     format.html {render html: "#{html.html_safe}", :layout => "application"}
        # end
    end

    def getWeather(city)
        @streamer = ElevatorMedia::Streamer.new
        weather = @streamer.getWeather(city)
        # render :json => weather.to_json
        puts weather.to_json
    end


end
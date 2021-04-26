class ElevatorMediaController < ApplicationController

    def index 
        @streamer = ElevatorMedia::Streamer.new   
    end

    def react 
    end

    def getWeatherReact
        @streamer = ElevatorMedia::Streamer.new
        city = params[:city]
        if !(city.nil?)
           html = @streamer.getContent("11", city)
        else
            html = ""
        end

        render json: { html: html }

    end

    def getWeather
        @streamer = ElevatorMedia::Streamer.new
        city = params[:city]
        if !(city.nil?)
           html = @streamer.getContent("1", city)
        else
            html = ""
        end
        if request.xhr?
            respond_to do |format|
                format.html {
                    render html: html
                }
            end
        else 
            render json: { html: html }
        end
    end

    def getJoke
        @streamer = ElevatorMedia::Streamer.new
        html = @streamer.getContent("2")
        if request.xhr?
            respond_to do |format|
                format.html {
                    render html: html
                }
            end
        else 
            render json: { html: html }
        end
    end

    def getGif
        @streamer = ElevatorMedia::Streamer.new
        html = @streamer.getContent("3")
        if request.xhr?
            respond_to do |format|
                format.html {
                    render html: html
                }
            end
        else 
            render json: { html: html }
        end
    end

    def getAdvice
        @streamer = ElevatorMedia::Streamer.new
        html = @streamer.getContent("4")
        if request.xhr?
            respond_to do |format|
                format.html {
                    render html: html
                }
            end
        else 
            render json: { html: html }
        end
    end

    def getProgJoke
        @streamer = ElevatorMedia::Streamer.new
        html = @streamer.getContent("5")
        if request.xhr?
            respond_to do |format|
                format.html {
                    render html: html
                }
            end
        else 
            render json: { html: html }
        end
    end

    def getDarkJoke
        @streamer = ElevatorMedia::Streamer.new
        html = @streamer.getContent("6")
        if request.xhr?
            respond_to do |format|
                format.html {
                    render html: html
                }
            end
        else 
            render json: { html: html }
        end
    end
end
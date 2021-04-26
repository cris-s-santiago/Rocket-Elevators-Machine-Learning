require 'elevator_media/streamer.rb'
require 'rails_helper'

describe ElevatorMedia::Streamer do

    # Streamer var init
    let!(:streamer){ElevatorMedia::Streamer.new}

    context 'Does getContent work?' do
        it 'it works' do
            expect(streamer).to respond_to(:getContent)
        end
    end

    context 'Does getWeather work?' do 
        it 'Get Weather Works!' do 
            expect(streamer).to respond_to(:getWeather)
        end
    end

    context 'Get weather info from getContent' do 
        it 'return infos' do 
            expect(streamer.getContent('1','Levis')).not_to be_nil
        end
    end

    context 'City name from the query should be Charlesbourg' do 
        it "It works!" do          
            response = OpenWeather::Client.new.current_weather(city: "Charlesbourg")
            expect((JSON.parse(response.to_json)['name']) == 'Charlesbourg')
        end
    end    

    context 'Get html from getContent' do
        it 'Returns html!' do 
            # puts (streamer.getContent('Lévis')).html_safe
            expect((streamer.getContent('1','Lévis')).html_safe).to include('div')
        end
    end

    context 'Does getJoke exists?' do
        it 'it exist' do
            expect(streamer).to respond_to(:getJoke)
        end
    end

    context 'Does getJoke return a joke?' do 
        it 'It returns a joke' do 
            expect(streamer.getJoke).to include('id')
        end
    end

    context 'Does getGif exists?' do
        it 'it exist' do
            expect(streamer).to respond_to(:getGif)
        end
    end

    context 'Does getGif return an url?' do 
        it 'It returns an url' do 
            expect(streamer.getGif).to include('.com')
        end
    end

    context 'Get Gif html by getContent' do 
        it 'It returns a valid html' do 
            expect(streamer.getContent('3')).to include('div')
        end
    end

    context 'Does getAdvice exists?' do
        it 'it exist' do
            expect(streamer).to respond_to(:getAdvice)
        end
    end  

    context 'Get advice returns something?' do
        it 'it does' do
            expect(streamer.getAdvice).not_to be_empty
        end
    end  

end

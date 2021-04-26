require 'net/http'
require 'httparty'
require 'openssl'
require 'net/http/post/multipart'

class MainController < ApplicationController

    def /
    end

    def index
    end

    def residential
    end

    def commercial
    end
    
    def quote
    end
    
    def speaker
    end

    def stt      
    end

    def speech
      @fileList = Dir.entries("./app/assets/sounds").reject{|filename| filename =~/^.{1,2}$/}
      puts @fileList.length
    end

    def identifySpeaker
      uri = URI('https://westus.api.cognitive.microsoft.com/speaker/identification/v2.0/text-independent/profiles/identifySingleSpeaker?profileIds=e0762f50-c521-4c65-a901-12e4e4b3c2f2,a52253bd-9734-4dcc-bf4c-07d97ceb8015,2f202d1a-0772-4f4f-94ce-11ec2d936f4a,a7f1e383-e3e3-4c2e-aec2-97cf9a5a869a')
      puts "================================================="
      puts "MY URL : #{uri}"
      puts "================================================="
      result = Net::HTTP.new(uri.host, uri.port)
      myRequest = Net::HTTP::Post.new(uri)
      myRequest['Content-Type'] = 'multipart/form-data'
      myRequest['Ocp-Apim-Subscription-Key'] = ENV['AZURE_KEY_FELIX']
      myRequest.body = params['speakerid-attachment'].read
      result.use_ssl = true
      response = result.request(myRequest)
      puts "+++++++++++++++++++++++++++++++++++++++++++++++++"
      puts response
      puts "+++++++++++++++++++++++++++++++++++++++++++++++++"
      render json: response.body
    end

    def speechConverter
          
      uri = URI('https://westus.stt.speech.microsoft.com/speech/recognition/conversation/cognitiveservices/v1?language=en-US')
      
      request = Net::HTTP::Get.new(uri.request_uri)
      # Request headers
      request['Ocp-Apim-Subscription-Key'] = ENV['AZURE_SPEECH_KEY']
      # Request body
      myRequest.body = params['stt-attachment'].read
      
      response = Net::HTTP.start(uri.host, uri.port, :use_ssl => true == 'https') do |http|
          http.request(request)
      end

      puts response.body

    end
  end

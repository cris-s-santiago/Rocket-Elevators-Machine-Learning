# require 'net/http'
# require 'httparty'
# require 'openssl'
# require 'net/http/post/multipart'

# class SpeechController < ApplicationController

#     def home
#         puts "working"
#     end

#     def speech
#         @fileList = Dir.entries("./app/assets/sounds").reject{|filename| filename =~/^.{1,2}$/}
#         puts @fileList.length
#     end

#     def identifySpeaker
#         uri = URI('https://westus.api.cognitive.microsoft.com/speaker/identification/v2.0/text-independent/profiles/identifySingleSpeaker?profileIds=e0762f50-c521-4c65-a901-12e4e4b3c2f2,a52253bd-9734-4dcc-bf4c-07d97ceb8015,2f202d1a-0772-4f4f-94ce-11ec2d936f4a,a7f1e383-e3e3-4c2e-aec2-97cf9a5a869a')
#         puts "================================================="
#         puts "MY URL : #{uri}"
#         puts "================================================="
#         result = Net::HTTP.new(uri.host, uri.port)
#         myRequest = Net::HTTP::Post.new(uri)
#         myRequest['Content-Type'] = 'multipart/form-data'
#         myRequest['Ocp-Apim-Subscription-Key'] = '3d7458d4dcb44b6ebdbc20af017f777a'
#         myRequest.body = params['speakerid-attachment'].read
#         result.use_ssl = true
#         response = result.request(myRequest)
#         puts "+++++++++++++++++++++++++++++++++++++++++++++++++"
#         puts response
#         puts "+++++++++++++++++++++++++++++++++++++++++++++++++"
#         render json: response.body
#     end
#     # V2 of the API who englobe speakerIdentification and get operation status
#     # def identifySpeaker

#     #     uri = URI("https://westus.stt.speech.microsoft.com/speaker/identification/v2.0/text-independent/profiles/identifySingleSpeaker?profileIds=e0762f50-c521-4c65-a901-12e4e4b3c2f2,a52253bd-9734-4dcc-bf4c-07d97ceb8015,2f202d1a-0772-4f4f-94ce-11ec2d936f4a,a7f1e383-e3e3-4c2e-aec2-97cf9a5a869a")

#     #     # uri.query = URI.encode_www_form({
         
#     #     #     'ignoreMinLength' => 'true'
#     #     # })

#     #     # puts "*******************************"
#     #     puts uri
#     #     # puts "************ URI **************"

#     #     request = Net::HTTP::Post.new(uri.request_uri)
        
#     #     # Request headers
#     #     request['Content-Type'] = 'multipart/form-data'
#     #     # Request headers
#     #     request['Ocp-Apim-Subscription-Key'] = '3d7458d4dcb44b6ebdbc20af017f777a' #ENV['AZURE_SPEECH_KEY']
#     #     # Request body -> wave file
#     #     request.body = params['speakerid-attachment'].read

#     #     response = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
#     #         http.request(request)
#     #     end
#     #     # puts "---------------------------"
        
#     #     # sleep 15

#     #     puts response.body
#     #     @response = render json: response #, :callback => 'IdentifiedSingleSpeakerInfo(0)'
#     #     # speakerinfo = response['IdentifiedSingleSpeakerInfo']
#     #     # @speakerId = speakerinfo
#     #     puts "Profiles ID = #{@response}"
#     #     puts "---------------------------"
#     # end
    
#     def initialize
#         @language = 'en-US'
#     end

#     # method to transcribe from an wave file to a text
#     def speechToText()

        
#         uri = URI('https://westus.stt.speech.microsoft.com/speech/recognition/conversation/cognitiveservices/v1?language=en-US')
#         uri.query = URI.encode_www_form({
#                 'language' => 'en-US'
#         })

#         request = Net::HTTP::Get.new(uri.request_uri)
#         # request['language'] = 'en-US'
#         # Request headers
#         request['Ocp-Apim-Subscription-Key'] = ENV['AZURE_SPEECH_KEY']

#         request['Content-Type'] = 'audio/vnd.wave'
#         # Request body
#         request.body = './app/assets/sounds/Claude.wav'

#         response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
#             http.request(request)
#         end

#         puts response.body
#     end







#     def identCreateProfile

#         uri = URI('https://westus.api.cognitive.microsoft.com/spid/v1.0/identificationProfiles')
#         uri.query = URI.encode_www_form({
#         })
#         request = Net::HTTP::Post.new(uri.request_uri)
#         # Request headers
#         request['Content-Type'] = 'application/json'
#         # Request headers
#         request['Ocp-Apim-Subscription-Key'] = ENV['AZURE_SPEECH_KEY']
#         # Request body
#         request.body = "{body}"
#         response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
#             http.request(request)
#         end
#         puts response.body
#     end

#     def identCreateEnrollment

#         uri = URI('https://westus.api.cognitive.microsoft.com/spid/v1.0/identificationProfiles/{identificationProfileId}/enroll')
#         uri.query = URI.encode_www_form({
#             # Request parameters
#             'shortAudio' => '{boolean}'
#         })
#         request = Net::HTTP::Post.new(uri.request_uri)
#         # Request headers
#         request['Content-Type'] = 'multipart/form-data'
#         # Request headers
#         request['Ocp-Apim-Subscription-Key'] = ENV['AZURE_SPEECH_KEY']
#         # Request body
#         request.body = "{body}"
#         response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
#             http.request(request)
#         end
#         puts response.body
#     end

#     def identDeleteProfile

#         uri = URI('https://westus.api.cognitive.microsoft.com/spid/v1.0/identificationProfiles/{identificationProfileId}')
#         uri.query = URI.encode_www_form({
#         })

#         request = Net::HTTP::Delete.new(uri.request_uri)
#         # Request headers
#         request['Ocp-Apim-Subscription-Key'] = ENV['AZURE_SPEECH_KEY']
#         # Request body
#         request.body = "{body}"

#         response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
#             http.request(request)
#         end
#         puts response.body
#     end
    
#     # method to identify who is speaking
#     def speakerIdentification(file)

#         # File file = new File(`./app/assets/sounds/#{audioFile}`);
#         # byte[] data = new byte[file.length()];
#         # FileInputStream in = new FileInputStream(file);
#         # in.read(data);
#         # in.close();
#         # puts data;


#         uri = URI('https://westus.api.cognitive.microsoft.com/spid/v1.0/identify?identificationProfileIds={identificationProfileIds}')
#         uri.query = URI.encode_www_form({
#             # Request parameters
#             'shortAudio' => '{boolean}'
#         })

#         request = Net::HTTP::Post.new(uri.request_uri)
#         # Request headers
#         request['Content-Type'] = 'application/octet-stream'
#         # Request headers
#         request['Ocp-Apim-Subscription-Key'] = ENV['AZURE_SPEECH_KEY']
#         # Request body
#         request.body = "{body}"

#         response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
#             http.request(request)
#         end

#         puts response.body
#     end
#     # method to retrieve the identified profile Id
#     def getOperationStatus

#         uri = URI('https://westus.api.cognitive.microsoft.com/spid/v1.0/operations/{operationId}')
#         uri.query = URI.encode_www_form({
#         })

#         request = Net::HTTP::Get.new(uri.request_uri)
#         # Request headers
#         request['Ocp-Apim-Subscription-Key'] = ENV['AZURE_SPEECH_KEY']
#         # Request body
#         request.body = "{body}"

#         response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
#         http.request(request)
#         end

#         puts response.body
#     end

    


# end
require "json"
require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
class WatsonController < ApplicationController

  def update
  end

  def greetings(name)

    @user = name
    @elevators = Elevator.all
    @buildings = Building.all
    @addresses = Address.all
    @elevators_amount = Elevator.all.length
    @buildings_amount = Building.all.length
    @customers_amount = Customer.all.length
    @elevators_in_service = @elevators.find_all{|elevator| elevator.status === 'Inactive'}.length

    # Create an array to store all the cities from the buildings
    @cities = Array.new

    # NEED TO CHANGE THIS
    @unprocessed_quotes = Quote.all.length
    @leads_amount = Lead.all.length

    # Loop through each buildings, get the city and push it to the array
    @buildings.each do |building|
      @building_address = @addresses.find{|a| a.id === building.id}
      @city = @building_address.city
      @cities.push(@city)
    end

    # Remove the duplicates
    @amount_of_cities = @cities.uniq.length
    @amount_of_batteries = Battery.all.length


    @content = "Greetings#{@user}!
    There are currently #{@elevators_amount.to_int} elevators deployed in the #{@buildings_amount.to_int} buildings of your #{@customers_amount.to_int} customers.
    Currently, #{@elevators_in_service.to_int} elevators are not in Running Status and are being serviced.
    You currently have #{@unprocessed_quotes.to_int} quotes awaiting processing.
    You currently have #{@leads_amount.to_int} leads in your contact requests.
    #{@amount_of_batteries.to_int} Batteries are deployed across #{@amount_of_cities.to_int} cities."

    # @testing = "Hey #{@user}, #{@elevators_in_service.to_int} being serviced."


                      ##########
                      # Watson #
                      ##########
    authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
      apikey: ENV['TEXT_TO_SPEECH_IAM_APIKEY']
    )


    text_to_speech = IBMWatson::TextToSpeechV1.new(
      authenticator: authenticator
    )
    text_to_speech.service_url = ENV['TEXT_TO_SPEECH_URL']

    File.open(File.join(Rails.root,'app','assets','sounds',"#{@user}" + '.wav'), "wb") do |audio_file|
      response = text_to_speech.synthesize(
        text: @content,
        accept: "audio/wav",
        voice: "en-GB_CharlotteV3Voice"
      ).result

      audio_file << response
    end
  end
end

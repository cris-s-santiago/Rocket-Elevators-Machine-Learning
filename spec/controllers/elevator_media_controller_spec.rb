require "rails_helper"

RSpec.describe ElevatorMediaController, :type => :controller do
  describe "responds to" do
    it "post getWeather returns Json" do
        post :getWeather, :params => { :city => "Levis" }
      expect(response.content_type).to eq "application/json"
    end

    it "post getJoke returns Json" do
        post :getJoke
      expect(response.content_type).to eq "application/json"
    end

    it "post getAdvice returns Json" do
        post :getAdvice
      expect(response.content_type).to eq "application/json"
    end

    it "post getProgJoke returns Json" do
        post :getProgJoke
      expect(response.content_type).to eq "application/json"
    end

    it "post getGif returns Json" do
        post :getGif
      expect(response.content_type).to eq "application/json"
    end

    it "post getDarkJoke returns Json" do
        post :getDarkJoke
      expect(response.content_type).to eq "application/json"
    end
  end
end
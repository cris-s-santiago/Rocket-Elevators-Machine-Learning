require "rails_helper"

RSpec.describe "Quotes management", :type => :request do

  it "creates a Quote and redirects to the index" do
    get "/quotes/new"
    expect(response).to have_http_status(:ok)

    post "/quotes", :params => { :quote => {:name => "My Quote", :email => "abc@123"} }
    expect(response).to have_http_status(302)

    follow_redirect!

    expect(response).to have_http_status(:success)
  end

end
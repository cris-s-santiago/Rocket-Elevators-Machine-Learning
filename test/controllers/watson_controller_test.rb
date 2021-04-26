require 'test_helper'

class WatsonControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get watson_update_url
    assert_response :success
  end

end

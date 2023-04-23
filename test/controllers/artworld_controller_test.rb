require "test_helper"

class ArtworldControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get artworld_welcome_url
    assert_response :success
  end
end

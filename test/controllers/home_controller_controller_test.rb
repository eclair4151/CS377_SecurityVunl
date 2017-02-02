require 'test_helper'

class HomeControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get home_controller_get_url
    assert_response :success
  end

end

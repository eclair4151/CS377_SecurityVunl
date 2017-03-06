require 'test_helper'

class CreateAccountControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get create_account_index_url
    assert_response :success
  end

  test "should get create" do
    get create_account_create_url
    assert_response :success
  end

end

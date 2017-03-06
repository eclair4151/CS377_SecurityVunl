require 'test_helper'

class MakeTransferControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get make_transfer_index_url
    assert_response :success
  end

end

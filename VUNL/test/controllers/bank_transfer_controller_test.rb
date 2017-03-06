require 'test_helper'

class BankTransferControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bank_transfer_index_url
    assert_response :success
  end

  test "should get create" do
    get bank_transfer_create_url
    assert_response :success
  end

end

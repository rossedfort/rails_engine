require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json

    assert_response :success
  end

  test "index action returns all the merchants" do
    merchant_count = Merchant.count
    get :index, format: :json
    controller_response = JSON.parse(response.body)

    assert_equal merchant_count, controller_response.count
  end
end

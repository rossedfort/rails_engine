require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json

    assert_response :success
  end

  test "index action returns all the customers" do
    customer_count = Customer.count
    get :index, format: :json
    controller_response = JSON.parse(response.body)

    assert_equal customer_count, controller_response.count
  end

  test "should get show" do
    get :show, format: :json, id: 1

    assert_response:success
  end

  test "show action returns correct customer" do
    get :show, format: :json, id: 1
    customer = Customer.find(1)
    controller_response = JSON.parse(response.body)

    assert_equal customer.id, controller_response["id"]
    assert_equal customer.first_name, controller_response["first_name"]
    assert_equal customer.last_name, controller_response["last_name"]
  end
end

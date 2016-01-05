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

  test "A TEST FOR #RANDOM GOES HERE" do
    skip
    assert true
  end

  test "find customer by id" do
    get :find, format: :json, id: 1

    assert_response :success
  end

  test "find customer by first name" do
    get :find, format: :json, first_name: "Ross"

    assert_response :success
  end

  test "find customer by first name - case insensitive" do
    get :find, format: :json, first_name: "rOsS"

    assert_response :success
  end

  test "find customer by last name" do
    get :find, format: :json, first_name: "Edfort"

    assert_response :success
  end

  test "find customer by last name - case insensitive" do
    get :find, format: :json, first_name: "EdFoRT"

    assert_response :success
  end

  test "find all returns all records matching query parameters - first name" do
    controller_response = get :find_all, format: :json, first_name: "Ross"
    parsed_response = JSON.parse(controller_response.body)
    assert_response :success
    assert 2, parsed_response.count
  end

  test "find all returns all records matching query parameters - last name" do
    controller_response = get :find_all, format: :json, last_name: "Furgeson"
    parsed_response = JSON.parse(controller_response.body)
    assert_response :success
    assert 2, parsed_response.count
  end

end

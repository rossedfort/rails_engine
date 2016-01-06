require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json

    assert_response :success
  end

  test "index action returns all the customers" do
    get :index, format: :json

    assert_equal Customer.count, json_response.count
  end

  test "should get show" do
    get :show, format: :json, id: Customer.first.id

    assert_response:success
  end

  test "show action returns correct customer" do
    get :show, format: :json, id: Customer.first.id
    customer = Customer.find(1)

    assert_equal customer.id, json_response["id"]
    assert_equal customer.first_name, json_response["first_name"]
    assert_equal customer.last_name, json_response["last_name"]
  end

  test "random action returns a random record" do
    get :random, format: :json

    assert_response :success
  end

  test "find customer by id" do
    get :find, format: :json, id: Customer.first.id

    assert_response :success
  end

  test "find customer by first name" do
    get :find, format: :json, first_name: "Ross"

    assert_response :success
    assert_equal "Ross", json_response["first_name"]
  end

  test "find customer by last name" do
    get :find, format: :json, last_name: "Edfort"

    assert_response :success
    assert_equal "Edfort", json_response["last_name"]
  end

  test "find all returns all records matching query parameters - first name" do
    get :find_all, format: :json, first_name: "Ross"

    assert_response :success
    assert_equal 2, json_response.count
  end

  test "find all returns all records matching query parameters - last name" do
    get :find_all, format: :json, last_name: "Furgeson"

    assert_response :success
    assert_equal 2, json_response.count
  end

  test "find all returns all records matching query parameters - created at" do
    get :find_all, format: :json, created_at: "2016-01-05T04:44:17.000Z"

    assert_response :success
    assert_equal 3, json_response.count
  end

  test "#invoices responds to json" do
    get :invoices, format: :json, id: Customer.first.id

    assert_response :success
  end

  test "#invoices returns an array of invoices" do
    get :invoices, format: :json, id: Customer.first.id

    assert_kind_of Array, json_response
    assert Customer.first.invoices.count, json_response.count
  end

  test "#transactions responds to json" do
    get :transactions, format: :json, id: Customer.first.id

    assert_response :success
  end

  test "#transactions returns an array of transactions" do
    get :transactions, format: :json, id: Customer.first.id

    assert_kind_of Array, json_response
    assert Customer.first.transactions.count, json_response.count
  end

  test "#favorite_merchant responds to json" do
    get :favorite_merchant, format: :json, id: Customer.first.id

    assert_response :success
  end
end

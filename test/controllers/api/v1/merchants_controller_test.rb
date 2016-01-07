require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json

    assert_response :success
  end

  test "#index action returns all the merchants" do
    merchant_count = Merchant.count
    get :index, format: :json

    assert_equal merchant_count, json_response.count
  end

  test "should get show" do
    get :show, format: :json, id: Merchant.first.id

    assert_response :success
  end

  test "#show action returns correct merchant" do
    get :show, format: :json, id: Merchant.first.id
    merchant = Merchant.find(Merchant.first.id)

    assert_equal merchant.id, json_response["id"]
    assert_equal merchant.name, json_response["name"]
  end

  test "#random action returns a random record" do
    get :random, format: :json

    assert_response :success
    assert json_response["name"]
  end

  test "#find merchant by id" do
    get :find, format: :json, id: Merchant.first.id

    assert_response :success
    json_response["name"]
  end

  test "#find merchant by name" do
    get :find, format: :json, name: "A Cool Store"

    assert_response :success
    json_response["name"]
  end

  test "#find_all returns all records matching query parameters - name" do
    get :find_all, format: :json, name: "A Cool Store"
    assert_response :success

    assert_equal 2, json_response.count
  end

  test "#find_all returns all records matching query parameters - created at" do
    get :find_all, format: :json, created_at: "2016-01-05T04:44:17.000Z"
    assert_response :success

    assert_equal 3, json_response.count
  end

  test "#items returns the items for a specific merchant" do
    get :items, format: :json, id: Merchant.first.id

    assert_response :success
  end

  test "#items returns an array the items for a specific merchant" do
    get :items, format: :json, id: Merchant.first.id

    assert_kind_of Array, json_response
    assert json_response[0].include?("name")
  end

  test "#invoices returns the invoices for a specific merchant" do
    get :invoices, format: :json, id: Merchant.first.id

    assert_response :success
  end

  test "#invoices returns an array the invoices for a specific merchant" do
    get :invoices, format: :json, id: Merchant.first.id

    assert_kind_of Array, json_response
  end

  test "#most_items responds to json" do
    get :most_items, format: :json, quantity: 10

    assert_response :success
  end

  test "#most_items returns an array of items" do
    get :most_items, format: :json, quantity: 10

    assert_kind_of Array, json_response
    assert json_response[0].include?("name")
  end

  test "#most_revenue responds to json" do
    get :most_revenue, format: :json, quantity: 10

    assert_response :success
  end

  test "#most_revenue returns an array of items" do
    get :most_revenue, format: :json, quantity: 10

    assert_kind_of Array, json_response
    assert json_response[0].include?("name")
  end

  test "#customers_with_pending_invoices responds to json" do
    get :customers_with_pending_invoices, format: :json, id: Merchant.first.id

    assert_response :success
  end

  test "#customers_with_pending_invoices returns an array of customers" do
    get :customers_with_pending_invoices, format: :json, id: Merchant.first.id

    assert_kind_of Array, json_response
    assert json_response[0].include?("first_name")
    assert json_response[0].include?("last_name")
  end

  test "#favorite_customer responds to json" do
    get :favorite_customer, format: :json, id: Merchant.first.id

    assert_response :success
  end

  test "#favorite_customer returns a customer" do
    get :favorite_customer, format: :json, id: Merchant.first.id

    assert_kind_of Hash, json_response
    assert json_response.include?("first_name")
    assert json_response.include?("last_name")
  end

  test "#revenue responds to json" do
    get :revenue, format: :json, id: 1

    assert_response :success
  end

  test "#revenue works with optional date argument" do
    get :revenue, format: :json, id: 1, date: "2016-01-06 15:22:34 -0700"

    assert_response :success
  end

  test "#all_revenue responds to json" do
    get :all_revenue, format: :json, date: "2016-01-06 15:22:34 -0700"

    assert_response :success
  end

  test "#all_revenue returns a hash" do
    get :all_revenue, format: :json, date: "2016-01-06 15:22:34 -0700"

    assert_kind_of Hash, json_response
    assert json_response["total_revenue"]
  end
end

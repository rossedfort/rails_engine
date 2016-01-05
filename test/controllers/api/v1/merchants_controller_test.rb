require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json

    assert_response :success
  end

  test "#index action returns all the merchants" do
    merchant_count = Merchant.count
    get :index, format: :json
    controller_response = JSON.parse(response.body)

    assert_equal merchant_count, controller_response.count
  end

  test "should get show" do
    get :show, format: :json, id: 1

    assert_response :success
  end

  test "#show action returns correct merchant" do
    get :show, format: :json, id: 1
    merchant = Merchant.find(1)
    parsed_response = JSON.parse(response.body)

    assert_equal merchant.id, parsed_response["id"]
    assert_equal merchant.name, parsed_response["name"]
  end

  test "#random action returns a random record" do
    get :random, format: :json

    assert_response :success
  end

  test "#find merchant by id" do
    get :find, format: :json, id: 1

    assert_response :success
  end

  test "#find merchant by name" do
    get :find, format: :json, name: "A Cool Store"

    assert_response :success
  end

  test "#find merchant by first name - case insensitive" do
    get :find, format: :json, name: "a coOl StoRe"

    assert_response :success
  end

  test "#find_all returns all records matching query parameters - name" do
    get :find_all, format: :json, name: "A Cool Store"
    parsed_response = JSON.parse(response.body)
    assert_response :success

    assert_equal 2, parsed_response.count
  end

  test "#find_all returns all records matching query parameters - created at" do
    get :find_all, format: :json, created_at: "2016-01-05T04:44:17.000Z"
    parsed_response = JSON.parse(response.body)
    assert_response :success

    assert_equal 3, parsed_response.count
  end

  test "#items returns the items for a specific merchant" do
    get :items, format: :json, id: Merchant.first.id

    assert_response :success
  end

  test "#items returns an array the items for a specific merchant" do
    get :items, format: :json, id: Merchant.first.id

    assert_kind_of Array, json_response
  end

  test "#invoices returns the invoices for a specific merchant" do
    get :invoices, format: :json, id: Merchant.first.id

    assert_response :success
  end

  test "#invoices returns an array the invoices for a specific merchant" do
    get :invoices, format: :json, id: Merchant.first.id

    assert_kind_of Array, json_response
  end
end

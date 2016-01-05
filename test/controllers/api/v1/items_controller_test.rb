require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json

    assert_response :success
  end

  test "index action returns all the items" do
    item_count = Item.count
    get :index, format: :json
    parsed_response = JSON.parse(response.body)

    assert_equal item_count, parsed_response.count
  end

  test "should get show" do
    get :show, format: :json, id: 1

    assert_response:success
  end

  test "show action returns correct item" do
    get :show, format: :json, id: 1
    item = Item.find(1)
    parsed_response = JSON.parse(response.body)

    assert_equal item.id, parsed_response["id"]
    assert_equal item.name, parsed_response["name"]
    assert_equal item.description, parsed_response["description"]
  end

  test "random action returns a random record" do
    get :random, format: :json

    assert_response :success
  end

  test "find item by id" do
    get :find, format: :json, id: 1

    assert_response :success
  end

  test "find item by name" do
    get :find, format: :json, name: "A Blue Mug"

    assert_response :success
  end

  test "find item by name - case insensitive" do
    get :find, format: :json, name: "a blUe MUg"

    assert_response :success
  end

  test "find item by description" do
    get :find, format: :json, description: "A hat that looks like doge"

    assert_response :success
  end

  test "find item by description - case insensitive" do
    get :find, format: :json, description: "a Hat ThAt LoOks LiKE DOge"

    assert_response :success
  end

  test "find all returns all records matching query parameters - name" do
    get :find_all, format: :json, name: "A Doge Hat"
    parsed_response = JSON.parse(response.body)
    assert_response :success
    assert_equal 2, parsed_response.count
  end

  test "find all returns all records matching query parameters - description" do
    get :find_all, format: :json, description: "A hat that looks like doge"
    parsed_response = JSON.parse(response.body)
    assert_response :success
    assert_equal 1, parsed_response.count
  end

  test "#invoice_items responds to json" do
    get :invoice_items, format: :json, id: Item.first.id

    assert_response :success
  end

  test "#invoice_items returns an array of invoice items for the correct invoice" do
    get :invoice_items, format: :json, id: Item.first.id

    assert_kind_of Array, json_response
    assert_equal Item.first.invoice_items.count, json_response.count
  end

  test "#merchant responds to json" do
    get :merchant, format: :json, id: Item.first.id

    assert_response :success
  end

  test "#merchant returns a single merchant record for the item" do
    get :merchant, format: :json, id: Item.first.id

    assert_kind_of Hash, json_response
    assert_equal Item.first.merchant.name, json_response["name"]
  end
end

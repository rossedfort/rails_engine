require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json

    assert_response :success
  end

  test "index action returns all the invoices items" do
    invoice_item_count = InvoiceItem.count
    get :index, format: :json
    controller_response = JSON.parse(response.body)

    assert_equal invoice_item_count, controller_response.count
  end

  test "should get show" do
    get :show, format: :json, id: 1

    assert_response :success
  end

  test "show action returns correct invoice items" do
    get :show, format: :json, id: 1
    invoice_item = InvoiceItem.find(1)
    parsed_response = JSON.parse(response.body)

    assert_equal invoice_item.id, parsed_response["id"]
    assert_equal invoice_item.unit_price, parsed_response["unit_price"]
    assert_equal invoice_item.item_id, parsed_response["item_id"]
    assert_equal invoice_item.invoice_id, parsed_response["invoice_id"]
  end

  test "A TEST FOR #RANDOM GOES HERE" do
    skip
    assert true
  end

  test "find invoice item by id" do
    get :find, format: :json, id: 1

    assert_response :success
  end

  test "find invoice by item_id" do
    get :find, format: :json, item_id: 1

    assert_response :success
  end

  test "find invoice by invoice_id" do
    get :find, format: :json, invoice_id: 1

    assert_response :success
  end

  test "find invoice by unit price" do
    get :find, format: :json, unit_price: 17.99

    assert_response :success
  end

  test "find all returns all records matching query parameters - unit price" do
    get :find_all, format: :json, unit_price: 17.99
    parsed_response = JSON.parse(response.body)
    assert_response :success

    assert_equal 2, parsed_response.count
  end

  test "find all returns all records matching query parameters - quantity" do
    get :find_all, format: :json, quantity: 1
    parsed_response = JSON.parse(response.body)
    assert_response :success

    assert_equal 3, parsed_response.count
  end
end

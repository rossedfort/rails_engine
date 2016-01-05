require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json

    assert_response :success
  end

  test "index action returns all the invoices" do
    invoice_count = Invoice.count
    get :index, format: :json
    controller_response = JSON.parse(response.body)

    assert_equal invoice_count, controller_response.count
  end

  test "should get show" do
    get :show, format: :json, id: 1

    assert_response :success
  end

  test "show action returns correct invoice" do
    get :show, format: :json, id: 1
    invoice = Invoice.find(1)
    parsed_response = JSON.parse(response.body)

    assert_equal invoice.id, parsed_response["id"]
    assert_equal invoice.status, parsed_response["status"]
    assert_equal invoice.merchant_id, parsed_response["merchant_id"]
    assert_equal invoice.customer_id, parsed_response["customer_id"]
  end

  test "random action returns a random record" do
    get :random, format: :json

    assert_response :success
  end

  test "find invoice by id" do
    get :find, format: :json, id: 1

    assert_response :success
  end

  test "find invoice by merchant_id" do
    get :find, format: :json, merchant_id: 1

    assert_response :success
  end

  test "find invoice by status" do
    get :find, format: :json, status: "shipped"

    assert_response :success
  end

  test "find invoice by status - case insensitive" do
    get :find, format: :json, status: "ShiPeD"

    assert_response :success
  end

  test "find all returns all records matching query parameters - merchant_id" do
    get :find_all, format: :json, merchant_id: 2
    parsed_response = JSON.parse(response.body)
    assert_response :success

    assert_equal 2, parsed_response.count
  end

  test "find all returns all records matching query parameters - status" do
    get :find_all, format: :json, status: "shipped"
    parsed_response = JSON.parse(response.body)
    assert_response :success

    assert_equal 3, parsed_response.count
  end

  test "#transactions returns all transactions for an invoice" do
    get :transactions, format: :json, id: Invoice.first.id

    assert_response :success
  end

  test "#invoice_items responds to json" do
    get :invoice_items, format: :json, id: Invoice.first.id

    assert_response :success
  end

  test "#invoice_items returns an array of invoice items" do
    get :invoice_items, format: :json, id: Invoice.first.id

    assert_kind_of Array, json_response
    assert_equal Invoice.first.invoice_items.count, json_response.count
  end

  test "#items responds to json" do
    get :items, format: :json, id: Invoice.first.id

    assert_response :success
  end

  test "#items returns an array of items" do
    get :items, format: :json, id: Invoice.first.id

    assert_kind_of Array, json_response
    assert Invoice.first.items.count, json_response.count
  end

  test "#cusomter responds to json" do
    get :customer, format: :json, id: Invoice.first.id

    assert_response :success
  end

  test "#customer returns a single customer record" do
    get :customer, format: :json, id: Invoice.first.id

    assert_kind_of Hash, json_response
    assert_equal Invoice.first.customer.first_name, json_response["first_name"]
    assert_equal Invoice.first.customer.last_name, json_response["last_name"]
  end

  test "#merchant responds to json" do
    get :merchant, format: :json, id: Invoice.first.id

    assert_response :success
  end

  test "#merchant returns a single merchant record" do
    get :merchant, format: :json, id: Invoice.first.id

    assert_kind_of Hash, json_response
    assert_equal Invoice.first.merchant.name, json_response["name"]
  end
end

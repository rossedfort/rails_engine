require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json

    assert_response :success
  end

  test "index action returns all the transactions" do
    transaction_count = Transaction.count
    get :index, format: :json

    assert_equal transaction_count, json_response.count
  end

  test "should get show" do
    get :show, format: :json, id: Transaction.first.id

    assert_response :success
  end

  test "show action returns correct transaction" do
    get :show, format: :json, id: Transaction.first.id
    transaction = Transaction.find(Transaction.first.id)

    assert_equal transaction.id, json_response["id"]
    assert_equal transaction.credit_card_number, json_response["credit_card_number"]
    assert_equal transaction.result, json_response["result"]
    assert_equal transaction.invoice_id, json_response["invoice_id"]
  end

  test "random action returns a random record" do
    get :random, format: :json

    assert_response :success
  end

  test "find transaction by id" do
    get :find, format: :json, id: Transaction.first.id

    assert_response :success
  end

  test "find transaction by result" do
    get :find, format: :json, result: "success"

    assert_response :success
  end


  test "find all returns all records matching query parameters - result" do
    get :find_all, format: :json, result: "failed"
    assert_response :success

    assert_equal 2, json_response.count
  end

  test "find all returns all records matching query parameters - invoice id" do
    get :find_all, format: :json, invoice_id: 2
    assert_response :success

    assert_equal 2, json_response.count
  end

  test "#invoice responds to json" do
    get :invoice, format: :json, id: Transaction.first.id

    assert_response :success
  end

  test "#invoice returns a single invoice record for the transaction" do
    get :invoice, format: :json, id: Transaction.first.id

    assert_kind_of Hash, json_response
    assert json_response["merchant_id"]
    assert json_response["customer_id"]
    assert json_response["status"]
  end
end

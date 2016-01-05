require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json

    assert_response :success
  end

  test "index action returns all the transactions" do
    transaction_count = Transaction.count
    get :index, format: :json
    controller_response = JSON.parse(response.body)

    assert_equal transaction_count, controller_response.count
  end

  test "should get show" do
    get :show, format: :json, id: 1

    assert_response :success
  end

  test "show action returns correct transaction" do
    get :show, format: :json, id: 1
    transaction = Transaction.find(1)
    parsed_response = JSON.parse(response.body)

    assert_equal transaction.id, parsed_response["id"]
    assert_equal transaction.credit_card_number, parsed_response["credit_card_number"]
    assert_equal transaction.result, parsed_response["result"]
    assert_equal transaction.invoice_id, parsed_response["invoice_id"]
  end

  test "A TEST FOR #RANDOM GOES HERE" do
    skip
    assert true
  end

  test "find transaction by id" do
    get :find, format: :json, id: 1

    assert_response :success
  end

  test "find transaction by result" do
    get :find, format: :json, result: "success"

    assert_response :success
  end

  test "find transaction by result - case insensitive" do
    get :find, format: :json, result: "sUcCeSS"

    assert_response :success
  end

  test "find all returns all records matching query parameters - result" do
    get :find_all, format: :json, result: "failed"
    parsed_response = JSON.parse(response.body)
    assert_response :success

    assert_equal 2, parsed_response.count
  end

  test "find all returns all records matching query parameters - invoice id" do
    get :find_all, format: :json, invoice_id: 2
    parsed_response = JSON.parse(response.body)
    assert_response :success

    assert_equal 2, parsed_response.count
  end
end

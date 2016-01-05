class Api::V1::TransactionsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find(params[:id])
  end

  def find
    respond_with Transaction.where("#{request.query_parameters.keys.first} ILIKE ?", request.query_parameters.values.first).first
  end

  def find_all
    respond_with Transaction.where("#{request.query_parameters.keys.first} ILIKE ?", request.query_parameters.values.first)
  end
end

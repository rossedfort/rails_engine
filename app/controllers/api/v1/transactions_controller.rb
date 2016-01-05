class Api::V1::TransactionsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find(params[:id])
  end

  def find
    respond_with Transaction.where("#{params.first[0]}": params.first[1]).first
  end

  def find_all
    respond_with Transaction.where("#{params.first[0]}": params.first[1])
  end
end

class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def find
    respond_with Customer.where("#{params.first[0]}": params.first[1]).first
  end

  def find_all
    respond_with Customer.where("#{params.first[0]}": params.first[1])
  end

  def random
    respond_with Customer.random
  end
end

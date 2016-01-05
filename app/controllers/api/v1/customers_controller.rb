class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def find
    if params["first_name"] || params["last_name"]
      respond_with Customer.where("#{params.first[0]} ILIKE ?", params.first[1]).first
    else
      respond_with Customer.where("#{params.first[0]}": params.first[1]).first
    end
  end

  def find_all
    if params["first_name"] || params["last_name"]
      respond_with Customer.where("#{params.first[0]} ILIKE ?", params.first[1])
    else
      respond_with Customer.where("#{params.first[0]}": params.first[1])
    end
  end

  def random
    respond_with Customer.random
  end
end

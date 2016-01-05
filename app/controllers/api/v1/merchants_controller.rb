class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    if request.query_parameters.keys.first == "id"
      respond_with Merchant.where(id: request.query_parameters.values.first.to_i).first
    elsif request.query_parameters.keys.first == "created_at" || request.query_parameters.keys.first == "updated_at"
      respond_with Merchant.where("#{request.query_parameters.keys.first}": request.query_parameters.values.first.to_time).first
    else
      respond_with Merchant.where("#{request.query_parameters.keys.first} ILIKE ?", request.query_parameters.values.first).first
    end
  end

  def find_all
    if request.query_parameters.keys.first == "id"
      respond_with Merchant.where(id: request.query_parameters.values.first.to_i)
    elsif request.query_parameters.keys.first == "created_at" || request.query_parameters.keys.first == "updated_at"
      respond_with Merchant.where("#{request.query_parameters.keys.first}": request.query_parameters.values.first.to_time)
    else
      respond_with Merchant.where("#{request.query_parameters.keys.first} ILIKE ?", request.query_parameters.values.first)
    end
  end
end

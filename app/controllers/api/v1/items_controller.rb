class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def find
    if request.query_parameters.keys.first == "id" || request.query_parameters.keys.first == "merchant_id" || request.query_parameters.keys.first == "unit_price"
      respond_with Item.where(id: request.query_parameters.values.first.to_i).first
    elsif request.query_parameters.keys.first == "created_at" || request.query_parameters.keys.first == "updated_at"
      respond_with Item.where("#{request.query_parameters.keys.first}": request.query_parameters.values.first.to_time).first
    else
      respond_with Item.where("#{request.query_parameters.keys.first} ILIKE ?", request.query_parameters.values.first).first
    end
  end

  def find_all
    if request.query_parameters.keys.first == "id" || request.query_parameters.keys.first == "merchant_id" || request.query_parameters.keys.first == "unit_price"
      respond_with Item.where(id: request.query_parameters.values.first.to_i)
    elsif request.query_parameters.keys.first == "created_at" || request.query_parameters.keys.first == "updated_at"
      respond_with Item.where("#{request.query_parameters.keys.first}": request.query_parameters.values.first.to_time)
    else
      respond_with Item.where("#{request.query_parameters.keys.first} ILIKE ?", request.query_parameters.values.first)
    end
  end
end

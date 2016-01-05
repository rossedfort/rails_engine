class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def find
    if request.query_parameters.keys.first == "id" || "merchant_id"
      respond_with Item.where("#{request.query_parameters.keys.first}": request.query_parameters.values.first.to_i).first
    else
      respond_with Item.where("#{request.query_parameters.keys.first} ILIKE ?", request.query_parameters.values.first).first
    end
  end

  def find_all
    if request.query_parameters.keys.first == "id" || "merchant_id"
      respond_with Item.where("#{request.query_parameters.keys.first}": request.query_parameters.values.first.to_i)
    else
      respond_with Item.where("#{request.query_parameters.keys.first} ILIKE ?", request.query_parameters.values.first)
    end
  end
end

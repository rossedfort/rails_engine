class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def find
    if params["id"] || params["merchant_id"] || params["unit_price"]
      respond_with Item.where("#{params.first[0]}": params.first[1]).first
    elsif params["created_at"] || params["updated_at"]
      respond_with Item.where("#{params.first[0]}": params.first[1]).first
    else
      respond_with Item.where("#{params.first[0]} ILIKE ?", params.first[1]).first
    end
  end

  def find_all
    if params["id"] || params["merchant_id"] || params["unit_price"]
      respond_with Item.where("#{params.first[0]}": params.first[1])
    elsif params["created_at"] || params["updated_at"]
      respond_with Item.where("#{params.first[0]}": params.first[1])
    else
      respond_with Item.where("#{params.first[0]} ILIKE ?", params.first[1])
    end
  end
end

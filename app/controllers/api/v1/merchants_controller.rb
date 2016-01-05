class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    if params["id"]
      respond_with Merchant.where(id: params["id"].to_i).first
    elsif params["created_at"] || params["updated_at"]
      respond_with Merchant.where("#{params.first[0]}": params.first[1]).first
    else
      respond_with Merchant.where("#{params.first[0]} ILIKE ?", params.first[1]).first
    end
  end

  def find_all
    if params["id"]
      respond_with Merchant.where(id: params["id"].to_i)
    elsif params["created_at"] || params["updated_at"]
      respond_with Merchant.where("#{params.first[0]}": params.first[1])
    else
      respond_with Merchant.where("#{params.first[0]} ILIKE ?", params.first[1])
    end
  end
end

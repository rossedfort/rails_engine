class Api::V1::InvoicesController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find(params[:id])
  end

  def find
    if params["status"]
      respond_with Invoice.where("#{params.first[0]} ILIKE ?", params.first[1]).first
    else
      respond_with Invoice.where("#{params.first[0]}": params.first[1]).first
    end
  end

  def find_all
    if params["status"]
      respond_with Invoice.where("#{params.first[0]} ILIKE ?", params.first[1])
    else
      respond_with Invoice.where("#{params.first[0]}": params.first[1])
    end
  end
end

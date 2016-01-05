class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  def find
    respond_with InvoiceItem.where("#{request.query_parameters.keys.first} ILIKE ?", request.query_parameters.values.first).first
  end

  def find_all
    respond_with InvoiceItem.where("#{request.query_parameters.keys.first} ILIKE ?", request.query_parameters.values.first)
  end
end

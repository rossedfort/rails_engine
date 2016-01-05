class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  def find
    respond_with InvoiceItem.where("#{params.first[0]}": params.first[1]).first
  end

  def find_all
    respond_with InvoiceItem.where("#{params.first[0]}": params.first[1])
  end
end

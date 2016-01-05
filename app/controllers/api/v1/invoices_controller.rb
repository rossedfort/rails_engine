class Api::V1::InvoicesController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find(params[:id])
  end

  def find
    respond_with Invoice.where("#{request.query_parameters.keys.first} ILIKE ?", request.query_parameters.values.first).first
  end

  def find_all
    respond_with Invoice.where("#{request.query_parameters.keys.first} ILIKE ?", request.query_parameters.values.first)
  end
end

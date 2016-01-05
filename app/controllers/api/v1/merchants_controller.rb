class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    respond_with Merchant.where('name ILIKE ?', request.query_parameters.values.first)
  end

  private

  def paramaterize_query(query_parameters)
    #is it necessary to paramterize the params to make it case insensitive
  end
end

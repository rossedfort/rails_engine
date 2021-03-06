class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    respond_with Merchant.find_by(merchant_params)
  end

  def find_all
    respond_with Merchant.where(merchant_params)
  end

  def random
    respond_with Merchant.random
  end

  def items
    respond_with Merchant.find(params[:id]).items
  end

  def invoices
    respond_with Merchant.find(params[:id]).invoices
  end

  def most_revenue
    respond_with Merchant.most_revenue(params[:quantity])
  end

  def most_items
    respond_with Merchant.most_items(params[:quantity])
  end

  def customers_with_pending_invoices
    respond_with Merchant.find(params[:id]).customers_with_pending_invoices
  end

  def favorite_customer
    respond_with Merchant.favorite_customer(params[:id])
  end

  def revenue
    respond_with Merchant.find(params[:id]).revenue(params)
  end

  def all_revenue
    respond_with Merchant.all_revenue(params[:date])
  end

  private

  def merchant_params
    params.permit(:id,
                  :name,
                  :created_at,
                  :updated_at
                  )
  end
end

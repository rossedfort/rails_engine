class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def calculate_revenue
    invoices.successful.joins(:invoice_items).sum("quantity * unit_price")
  end

  def calculate_items
    invoices.successful.joins(:invoice_items).sum(:quantity)
  end

  def self.random
    order("RANDOM()").first
  end

  def self.most_revenue(quantity)
    all.sort_by(&:calculate_revenue).reverse.first(quantity.to_i)
  end

  def self.most_items(quantity)
    all.sort_by(&:calculate_items).reverse.first(quantity.to_i)
  end

  def customers_with_pending_invoices
    invoices.pending.distinct.map(&:customer)
  end

  def revenue(params)
    if params[:date]
      {"revenue" => invoices.successful.where(created_at: params[:date]).joins(:invoice_items).sum("quantity * unit_price")}
    else
      {"revenue" => invoices.successful.joins(:invoice_items).sum("quantity * unit_price")}
    end
  end

  def self.favorite_customer(merchant_id)
    Customer.find(Merchant.find(merchant_id)
                  .invoices.group(:customer_id)
                  .order("count_id desc")
                  .count("id")
                  .first[0]
                  )
  end
end

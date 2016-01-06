class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def self.random
    order("RANDOM()").first
  end

  def revenue
    invoices.successful.joins(:invoice_items).sum("quantity * unit_price")
  end

  def self.most_revenue(quantity)
    all.sort_by(&:revenue).reverse.first(quantity.to_i)
  end

  def self.most_items(quantity)
    #some code here that will determine the merhcants with the most sold items
    {"a" => quantity}
  end

  def self.all_revenue(date)
    #some code here that will determine the total revenue for the date across all merchants
    {"a" => quantity}
  end

  def self.single_revenue(date)
    #returns the total revenue for that merchant for a specific invoice date x
    {"a" => quantity}
  end

  def self.revenue
    {"revenue" => "shmevenue"}
  end

  def self.customers_with_pending_invoices
    {"customers_with_pending_invoices" => "shmustomers with shmending shminvoices"}
  end

  def self.favorite_customer
    {"favorite_customer" => "shmavorite customer"}
  end
end

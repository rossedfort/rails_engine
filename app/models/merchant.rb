class Merchant < ActiveRecord::Base
  has_many :items

  def self.random
    order("RANDOM()").first
  end

  def self.most_revenue(quantity)
    #some code here that will determine the merchants with most revenue
    {"a" => quantity}
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

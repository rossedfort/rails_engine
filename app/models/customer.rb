class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.random
    order("RANDOM()").first
  end

  def self.favorite_merchant(customer_id)
    Merchant.find(Customer.find(customer_id)
                  .invoices.group(:merchant_id)
                  .order("count_id desc")
                  .count("id")
                  .first[0]
                  )
  end
end

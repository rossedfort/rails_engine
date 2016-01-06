class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.random
    order("RANDOM()").first
  end

  def self.favorite_merchant
    {"favorite_merchant" => "shmavorite merchant"}
  end
end

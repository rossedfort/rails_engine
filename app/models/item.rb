class Item < ActiveRecord::Base
  before_validation :sanitize_price
  validates :unit_price, presence: true

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def sanitize_price
    self.unit_price = (unit_price.to_f/100).to_s
  end

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

  def self.best_day
    {"best day" => "shmest day"}
  end
end

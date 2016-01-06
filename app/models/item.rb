class Item < ActiveRecord::Base
  before_validation :sanitize_price
  validates :unit_price, presence: true

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def calculate_revenue
    invoices.successful.joins(:invoice_items).sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def sanitize_price
    self.unit_price = (unit_price.to_f/100).to_s
  end

  def self.random
    order("RANDOM()").first
  end

  def self.most_revenue(quantity)
    all.sort_by(&:calculate_revenue).reverse.first(quantity.to_i)
  end
end

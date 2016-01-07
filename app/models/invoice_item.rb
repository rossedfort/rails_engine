class InvoiceItem < ActiveRecord::Base
  before_validation :sanitize_price
  validates :unit_price, presence: true

  belongs_to :item
  belongs_to :invoice

  def sanitize_price
    self.unit_price = (unit_price.to_f/100).to_s
  end

  def self.random
    order("RANDOM()").first
  end

  def self.successful
    joins(:invoice).merge(Invoice.successful)
  end
end

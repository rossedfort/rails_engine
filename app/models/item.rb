class Item < ActiveRecord::Base
  before_validation :sanitize_price
  validates :unit_price, presence: true

  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def sanitize_price
    self.unit_price = (unit_price.to_f/100).to_s
  end
end

require 'test_helper'
require 'bigdecimal'

class ItemTest < ActiveSupport::TestCase
  test "sanitize price" do
    inv_item = Item.create!(name: "A Cool Hat", description: "The coolest hat ever", unit_price: 12345, merchant_id: 1)

    assert_equal BigDecimal.new("123.45"), inv_item.unit_price
  end
end

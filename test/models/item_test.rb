require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "sanitize price" do
    inv_item = Item.create!(name: "A Cool Hat", description: "The coolest hat ever", unit_price: 12345, merchant_id: 1)

    assert_equal "123.45", inv_item.unit_price
  end
end

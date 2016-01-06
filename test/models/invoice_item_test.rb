require 'test_helper'
require 'bigdecimal'

class InvoiceItemTest < ActiveSupport::TestCase
  test "sanitize price" do
    inv_item = InvoiceItem.create!(quantity: 1, unit_price: 12345, item_id: 1, invoice_id: 1)

    assert_equal BigDecimal.new("123.45"), inv_item.unit_price
  end
end

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "Validate Presence of fields" do
    assert true
  end
  test "should not save Order" do
    order = Order.new
    assert_not order.save, "Saved Order without Model, IMEI, Anual Price "
  end
end

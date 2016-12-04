# == Schema Information
#
# Table name: carted_products
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  product_id :integer
#  quantity   :integer
#  status     :string
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CartedProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

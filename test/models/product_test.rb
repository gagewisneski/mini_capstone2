# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  price       :decimal(6, 2)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  stock       :boolean          default(TRUE)
#  supplier_id :integer
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

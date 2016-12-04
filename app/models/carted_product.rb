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

class CartedProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user
  belongs_to :product
end

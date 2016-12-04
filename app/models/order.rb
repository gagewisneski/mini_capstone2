# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  subtotal   :decimal(10, 2)
#  tax        :decimal(10, 2)
#  total      :decimal(10, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  has_many :carted_products
  has_many :products, through: :carted_products
  belongs_to :user

end

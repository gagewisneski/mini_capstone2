# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  image_src  :string
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Image < ApplicationRecord
  belongs_to :product

  validates :image_src, presence: true
  validates :product_id, presence: true
end

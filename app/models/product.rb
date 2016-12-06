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

class Product < ApplicationRecord

  belongs_to :supplier

  has_many :images

  has_many :product_categories
  has_many :categories, through: :product_categories

  has_many :carted_products
  has_many :orders, through: :carted_products

  validates :name, :description, :price, presence: true
  validates :price, numericality: {greater_than: 0}

  def sale_message
    if price < 15
      return "Discount Item!"
    else
      return "On Sale!"
    end
  end

  def tax
    return price*0.09
  end

  def price_tax
    return price + tax
  end

  def discounted?
    if sale_message == "Discount Item!"
      return "jumbotron jumbotron-red-index"
    else
      return "jumbotron jumbotron-index"
    end
  end

end


#the models go here and contain most of your logic/code

class Product < ApplicationRecord

  belongs_to :supplier

  has_many :images

  belongs_to :user

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
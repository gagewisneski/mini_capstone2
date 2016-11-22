class Product < ApplicationRecord

  def sale_message
    if price < 20
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
      return "jumbotron jumbotron-red"
    else
      return "jumbotron"
    end
  end

end


#the models go here and contain most of your logic/code
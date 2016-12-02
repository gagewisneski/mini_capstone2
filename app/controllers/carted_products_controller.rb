class CartedProductsController < ApplicationController
  before_action :empty_cart!, only: [:index]


  def create
    carted_product = CartedProduct.new(product_id: params[:product_id], quantity: params[:quantity].to_i, user_id: current_user.id, status: "carted")
    carted_product.save

    redirect_to "/checkout"
  end

  def index
    user = User.find_by(id: current_user.id)
    @cartedproducts = user.carted_products.where("status LIKE ?", "carted")

    @total = 0
  end

  def destroy
    @cartedproduct = CartedProduct.find_by(id: params[:id])
    @cartedproduct.assign_attributes(status: "removed")
    @cartedproduct.save

    flash[:success] = "You've removed #{@cartedproduct.product.name} from your cart"
    redirect_to "/checkout"
  end
end

class OrdersController < ApplicationController

  def create
    @product = Product.find_by(id: params[:product_id])
    @order = Order.new(user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity].to_i, subtotal: (@product.price * params[:quantity].to_i), tax: (@product.price * params[:quantity].to_i * 0.09), total: (@product.price * params[:quantity].to_i * 1.09))
    @order.save
  end

end

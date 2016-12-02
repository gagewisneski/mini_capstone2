class OrdersController < ApplicationController

  def create
    user = User.find_by(id: current_user.id)
    @cartedproducts = user.carted_products.where("status LIKE ?", "carted")

    @order = Order.new(user_id: current_user.id, subtotal: session[:subtotal], tax: session[:tax], total: session[:total])
    @order.save

    @cartedproducts.each do |product|
      product.assign_attributes(status: "purchased", order_id: @order.id)
      product.save
    end

    flash[:success] = "You done ordered that stuff!"

    redirect_to "/"
  end

end

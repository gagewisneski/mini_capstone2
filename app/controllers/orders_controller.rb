class OrdersController < ApplicationController

  def create
    user = User.find_by(id: current_user.id)
    @cartedproducts = user.carted_products.where("status LIKE ?", "carted")

    @order = Order.new(user_id: current_user.id, subtotal: params[:subtotal].to_i, tax: params[:tax].to_i, total: params[:total].to_i)
    @order.save

    @cartedproducts.each do |product|
      product.assign_attributes(status: "purchased", order_id: @order.id)
      product.save
    end

    flash[:success] = "You done ordered that stuff!"

    redirect_to "/"
  end

end

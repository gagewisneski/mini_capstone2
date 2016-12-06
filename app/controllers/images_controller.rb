class ImagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def new
    @product = Product.find_by(id: params[:id])
    @image = Image.new
  end

  def create
    @image = Image.new(image_src: params[:image_src], product_id: params[:product_id])
    @product = Product.find_by(id: params[:product_id])
    

    if @image.save
      flash[:success] = "You added a new image for the product: #{@product.name}"
      redirect_to "/products/#{@product.id}"
    else
      flash[:warning] = @image.errors.full_messages.join(", ")
      render :new
    end
  end
end

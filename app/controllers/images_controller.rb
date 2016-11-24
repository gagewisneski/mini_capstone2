class ImagesController < ApplicationController
  def new
    @product = Product.find_by(id: params[:id])
  end

  def create
    @image = Image.new(image_src: params[:image_src], product_id: params[:product_id])
    @image.save

    @product = Product.find_by(id: params[:product_id])

    flash[:success] = "You added a new image for the product: #{@product.name}"

    redirect_to "/products/#{@product.id}"
  end
end

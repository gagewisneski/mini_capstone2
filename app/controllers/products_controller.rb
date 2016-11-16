class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price].to_i, image: params[:image], description: params[:description])
    @product.save

    flash[:success] = "Product has been created"

    redirect_to "/product/#{@product.id}"
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes(name: params[:name], price: params[:price].to_i, image: params[:image], description: params[:description])
    product.save

    flash[:success] = "Product has been updated"

    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy

    flash[:success] = "Product has been deleted"

    redirect_to "/products"
  end

end



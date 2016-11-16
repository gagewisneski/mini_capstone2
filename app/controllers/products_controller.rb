class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price].to_i, image: params[:image], description: params[:description])
    @product.save

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

    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy

    redirect_to "/products"
  end

end







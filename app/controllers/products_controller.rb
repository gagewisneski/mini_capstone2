class ProductsController < ApplicationController

  def home

    @products = Product.all

  end

  def new_product
  end

  def index
    @products = Product.all
  end

  def create_product
    @product = Product.new(name: params[:name], price: params[:price].to_i, image: params[:image], description: params[:description])
    @product.save
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

end

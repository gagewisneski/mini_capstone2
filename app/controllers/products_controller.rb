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

    redirect_to "/products/#{@product.id}"
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def confirmation

    @product = Product.find_by(id: params[:id])

    redirect_to "/products/#{@product.id}"

    flash[:danger] = "Are you sure you want to delete this product?!?! <a class='btn btn-danger btn-lg' data-method='delete' href='/products/#{@product.id}' role='button'> Yes</a> <a class='btn btn-success btn-lg' href='/products/#{@product.id}' role='button'> No</a>"


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

    flash[:danger] = "Product has been deleted"

    redirect_to "/products"
  end

end



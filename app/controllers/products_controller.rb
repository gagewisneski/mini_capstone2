class ProductsController < ApplicationController

  def index
    @sort_column = params[:sort]
    # in url /products?sort=id
    # in url /products?sort=name
    if @sort_column == "PriceDesc"
      @products = Product.all.order(price: :desc)
    elsif
      @sort_column == "IdDesc"
      @products = Product.all.order(id: :desc)
    else
      @products = Product.all.order(@sort_column)
    end

    @search = params[:name]
    @products = Product.where("name iLike ?", "%#{@search}%").order(:name)

    discount = params[:discount]
    if discount == "15"
      @products = Product.where("price < ?", 15)
    end

    if @sort_column == nil
      @sort_column = "Sort By"
    end
  end

  def search
    @search = params[:name]
    redirect_to "/products?name=#{@search}"
  end

  def new
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price].to_i, image: params[:image], description: params[:description], supplier_id: params[:supplier_id].to_i)
    @product.save

    flash[:success] = "Product has been created"

    redirect_to "/products/#{@product.id}"
  end

  def show
    rando = params[:id]
    prods = Product.all
    if rando == "random"
      rando = prods.sample
      rando = rando[:id]
    end
    @product = Product.find_by(id: rando)
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
    product.assign_attributes(name: params[:name], price: params[:price].to_i, image: params[:image], description: params[:description], supplier_id: params[:supplier_id].to_i)
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



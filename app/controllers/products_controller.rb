class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :edit]
  before_action :current_user_admin, only: [:new, :create, :edit, :update, :destroy]

  def home
    @products = Product.all
    @suppliers = Supplier.all
  end

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
    @category = Category.find_by(name: params[:category])

    if params[:category]
      @products = @category.products
    elsif @search
      @products = Product.where("name iLike ?", "%#{@search}%").order(:name)
    else
      @products = Product.all
    end

    discount = params[:discount]
    if discount == "15"
      @products = Product.where("price < ?", 15)
    end

    if @category == nil
      @category = "Category"
    else 
      @category = @category.name.capitalize
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
    @product = Product.new
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price].to_i, description: params[:description], supplier_id: params[:supplier_id].to_i)

    if @product.save
      flash[:success] = "Product has been created"
      redirect_to "/products/#{@product.id}"
    else
      flash[:warning] = @product.errors.full_messages.join(", ")
      render :new
    end
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
    @product = Product.find_by(id: params[:id])
    @product.assign_attributes(name: params[:name], price: params[:price].to_i, description: params[:description], supplier_id: params[:supplier_id].to_i)

    if @product.save
      flash[:success] = "Product has been updated"
      redirect_to "/products/#{product.id}"
    else
      flash[:warning] = @product.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy

    flash[:danger] = "Product has been deleted"

    redirect_to "/products"
  end

end



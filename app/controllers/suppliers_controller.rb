class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all.order(@sort_column)
  end

  def new
  end

  def create
    @supplier = Supplier.new(name: params[:name], email: params[:email], phone: params[:phone])
    @supplier.save

    flash[:success] = "Supplier has been created"

    redirect_to "/suppliers"
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
  end

  def confirmation
    @supplier = Supplier.find_by(id: params[:id])

    redirect_to "/suppliers/#{@supplier.id}"

    flash[:danger] = "Are you sure you want to delete this supplier?!?! <a class='btn btn-danger btn-lg' data-method='delete' href='/suppliers/#{@supplier.id}' role='button'> Yes</a> <a class='btn btn-success btn-lg' href='/suppliers/#{@supplier.id}' role='button'> No</a>"
  end

  def edit
    @supplier = Supplier.find_by(id: params[:id])
  end

  def update
    supplier = Supplier.find_by(id: params[:id])
    supplier.assign_attributes(name: params[:name], email: params[:email], phone: params[:phone])
    supplier.save

    flash[:success] = "Supplier has been updated"

    redirect_to "/suppliers/#{supplier.id}"
  end

  def destroy
    supplier = Supplier.find_by(id: params[:id])
    supplier.destroy

    flash[:danger] = "Supplier has been deleted"

    redirect_to "/suppliers"
  end


end

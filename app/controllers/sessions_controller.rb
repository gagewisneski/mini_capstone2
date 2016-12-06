class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You've logged in"
      redirect_to "/"
    else
      flash[:warning] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to "/"
  end
end

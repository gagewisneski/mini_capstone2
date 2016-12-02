class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    unless current_user
      flash[:warning] = "Only people that are logged in can do that!"
      redirect_to "/login"
    end
  end

  def empty_cart!
    user = User.find_by(id: current_user.id)
    cartedproducts = user.carted_products.where("status LIKE ?", "carted")
    if cartedproducts.length == 0
      flash[:info] = "You ain't carted nothin yet!"
      redirect_to "/products"
    end
  end

end

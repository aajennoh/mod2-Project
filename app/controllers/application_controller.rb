class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user, :logged_in?
  
  def current_user
    User.find_by({ id: session[:user_id] })
  end
  
  def logged_in?
    !!current_user
  end
  
  def authorized
    redirect_to login_path unless logged_in?
  end

  def cart
    session[:cart] ||= []
  end

  # need to hold all my recipe id's
  def add_item_to_cart(item_id)
    cart << item_id
  end

  # method to add a recipe to a cart
  def see_the_items
    @items = Recipe.find(cart)
  end

end
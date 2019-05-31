class CartController < ApplicationController
  def update
    add_item_to_cart(params[:recipe_id])
    redirect_to budget_path
  end

  def destroy
    cart.delete(params[:recipe_id])
    redirect_to budget_path
  end

end
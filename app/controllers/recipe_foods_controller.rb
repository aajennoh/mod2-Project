class RecipeFoodsController < ApplicationController


  def new
 @recipe_food = Recipe_foods.new
  end


  def create
   @recipe = Recipe.find(params[:recipe_id])

     params[:foods].select { |f| f.id }.each do |food|
      RecipeFood.create(food_id: food["id"], recipe_id: @recipe.id}
     end
  end


  def edit
  end

  def create
  end

  def destroy
  end



end

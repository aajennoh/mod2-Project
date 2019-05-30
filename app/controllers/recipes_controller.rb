class RecipesController < ApplicationController

  def index
    @recipes  = Recipe.all
  end

  def new
  @recipe = Recipe.new
  @foods = Food.all
  end

  def create
    @recipe = Recipe.create(recipe_params)
    byebug
    if session[:user_id]
        @recipe.user_id = session[:user_id]
        @recipe.save
    redirect_to "/recipes/#{@recipe.id}"
      # if @recipe.valid?
      #   @recipe.save
      #   redirect_to "/recipes/#{@recipe.id}"
      # else
      #   flash[:notice] = @recipe.errors.messages
      #   redirect_to "/recipes/new"
      # end
    end
  end


  def show
    @recipe = Recipe.find(params[:id])
    @recipe.info_fill
    @gluten_foods = []
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    @recipe = Recipe.create(recipe_params)
    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to "/recipes"

  end


private

def recipe_params
params.require(:recipe).permit(:name, :description, :total_price, :total_protein, :total_calories, :user_id, :catagory, foods_attributes:[:name,:_destroy, :id] , food_ids:[])
end


end

class RecipesController < ApplicationController


  def index
    @recipes  = Recipe.all
  end


  def new
  @recipe = Recipe.new
  @foods = Food.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
      if @recipe.valid?
        @recipe.save
        redirect_to "/recipes/#{@recipe.id}"
      else
        flash[:notice] = @recipe.errors.messages
        redirect_to "/recipes/new"
      end
  end


  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipes_params)
    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to "/recipes"

  end


private

def recipe_params
params.require(:recipe).permit(:name, :description, :total_price, :total_protein, :total_calories, :owner_id )
end


end

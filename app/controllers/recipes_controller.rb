class RecipesController < ApplicationController


    def breakfast
      @recipes = Recipe.where(category: "breakfast")
      render "/recipes/index_breakfast"
    end

    def snack
      @recipes = Recipe.where(category: "snack")
      render "/recipes/index_breakfast"
    end

    def dinner
      @recipes = Recipe.where(category: "dinner")
      render "/recipes/index_breakfast"
    end

  def index
    @recipes = Recipe.all
  end

  def new
  @recipe = Recipe.new
  @foods = Food.all
  end

  def create

    @recipe = Recipe.new(recipe_params)
    if @recipe.valid?
      session[:user_id]
      @recipe.user_id = session[:user_id]
      @recipe.info_fill
      @recipe.save
      redirect_to "/recipes/#{@recipe.id}"
    else
       flash[:notice] = @recipe.errors.messages
       redirect_to "/recipes/new"
      # if @recipe.valid?
      #   @recipe.save
      #   redirect_to "/recipes/#{@recipe.id}"
      # else
      #   flash[:notice] = @recipe.errors.messages
      #   redirect_to "/recipes/new"
      # end


#       def create
#
#   byebug
#    [{id: 1}, {id: 3}, {id: 6}, {id: nil}]
#    @recipe = Recipe.find(params[:recipe_id])
#
#    params[:foods].select { |f| f.id }.each do |food|
#     RecipeFood.create(food_id: food["id"], recipe_id: @recipe.id}
#    end
# end
    end
  end

  def budget
    @recipes = Recipe.search(params[:search])
    see_the_items

  end

  def show
    @recipe = Recipe.find(params[:id])
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
    @recipe = Recipe.find(params[:id])
    if cart.include?(@recipe.id)
      cart - [@recipe.id]
    end
    @recipe.destroy
    redirect_to "/recipes"

  end






private

def recipe_params

params.require(:recipe).permit(:name, :search, :description, :total_price, :total_protein, :total_calories, :user_id, :category, foods_attributes:[:name,:_destroy, :id] , food_ids:[])

end


end

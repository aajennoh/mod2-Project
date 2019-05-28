class FoodsController < ApplicationController

def index
  @foods = Food.all
end


def new
  @food = Food.new
end

def create
  @food = Food.new(foods_params)
    if @food.valid?
      @food.save
      redirect_to "/foods/#{@food.id}"
    else
      flash[:notice] = @food.errors.messages
      redirect_to "/foods/new"
    end
end


def show
  @food = Food.find(params[:id])
end

def edit
  @food = Food.find_by(params[:id])
end

def update
  @food = Food.find(params[:id])
  @food.update(foods_params)
  redirect_to "/foods/#{@food.id}"

end

def destroy
  Food.find(params[:id]).destroy
  redirect_to "/foods"

end



private

def food_params
params.require(:food).permit(:name, :description, :price, :protien, :calories)
end


end
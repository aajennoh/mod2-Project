class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:notice] = @user.errors.messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @user_recipes = []
    Recipe.where(user_id: params[:id]).each {|rec| @user_recipes << rec}
    end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:notice] = @user.errors.messages
      render :edit
    end
  end

  def destroy # DELETE request /users/:id
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Your account has been deleted."
    redirect_to new_user_path
  end

  def welcome
    render "/welcome"
  end

private

def user_params
params.require(:user).permit(:username, :password)
end


end

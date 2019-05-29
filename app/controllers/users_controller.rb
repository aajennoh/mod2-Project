class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  if @user.valid?
    @user.save
    redirect_to "/users/#{@user.id}"
  else
    flash[:notice] = @user.errors.messages
    redirect_to "/users/new"
  end
  end

  def edit
  end

  def create
  end

  def destroy
  end

  def welcome
    render "/welcome"
  end

private

def user_params
params.require(:user).permit(:name)
end





end

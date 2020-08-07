class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

  def show 
    @restaurants = @user.restaurants
  end 

  def new
    @user = User.new
  end 

  def create
    user = User.create(user_params)
    params[:user][:password_digest]
    session[:user_id] = user.id
    redirect_to user_path(user)
  end 

  def edit
  end

  def update
    authenticate 
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else 
      flash[:notice] = "Your account was not updated"     
      render :edit
    end 
  end


private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end  

  def set_user
    @user = User.find(params[:id])
  end
end


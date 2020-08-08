class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

  def show 
    @restaurants = @user.restaurants
    if params[:restaurant_id]
      @restaurant = Restaurant.find(params[:restaurant_id])
    end 
  end 

  def new
    @user = User.new
  end 

  def create
    @user = User.create(user_params)
    if @user.save
      params[:user][:password_digest]
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      if User.find_by(username: params[:user][:username]) || User.find(email: params[:user][:email])
        flash[:alert] = "Looks like you've already signed up!"
        redirect_to login_path
      else 
        render :new
      end 
    end 
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
    params.require(:user).permit(:username, :email, :password, :search)
  end  

  def set_user
    @user = User.find(params[:id])
  end
end


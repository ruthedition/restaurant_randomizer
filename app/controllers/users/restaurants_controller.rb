class User::RestaurantsController < ApplicationController
  
  before_action :set_user, only: [:new, :index]

  def index
    @restaurants = @user.restaurants
  end 

  def new
    @restaurant = Restaurant.new(user_ids: [@user.id])
  end

  private

  def set_user
    @user = User.find(params[:user_id])    
  end

end
class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end 

  def show
    @user_restaurant = UserRestaurant.find_by(restaurant_id: @restaurant.id, user_id: current_user.id)
  end

  def new 
    @restaurant = Restaurant.new(user_ids: [current_user.id])
  end 

  def create
    if @restaurant = Restaurant.find_or_create_by(name: params[:restaurant][:name])
      if @restaurant.update(rest_params)
        redirect_to @restaurant
      else 
        flash[:alert] = "Your restaurant was not saved!"
        render :new 
      end  
    elsif @restaurant = current_user.restaurants.new(rest_params)
      if @restaurant.save
        redirect_to @restaurant
      end 
    else 
      flash[:alert] = "Your restaurant was not saved!"
      render :new  
    end
  end

  def edit 
    @restaurant_user = UserRestaurant.find_by_current_user_and_restaurant(current_user.id, @restaurant.id)
  end

  def update
    if @restaurant.update(rest_params)
      redirect_to @restaurant
    else 
      flash[:alert] = "Your restaurant was not updated"
      flash[:alert] = @restaurant.errors.full_messages
      redirect_to edit_restaurant_path(@restaurant)
    end 
  end 

  def destroy
    UserRestaurant.find_by(restaurant_id: @restaurant.id, user_id: current_user.id).destroy
    redirect_to profile_path(current_user)
  end

  private 

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end 
  
  def rest_params
    params.require(:restaurant).permit(:name, food_type:[:name], food_type_ids:[], user_restaurants_attributes:[:id, :notes, :user_id])
  end 

end

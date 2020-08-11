class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end 

  def show
    @restaurant_notes = UserRestaurant.find_by(restaurant_id: @restaurant.id, user_id: current_user.id).notes
  end

  def new 
    @restaurant = Restaurant.new(user_ids: [current_user.id])
  end 

  def create
    @restaurant = current_user.restaurants.new(rest_params)
    @restaurant.user_restaurants.first.user_id = current_user.id
    if @restaurant.save
      redirect_to @restaurant
    else 
      flash[:alert] = "Your restaurant was not save!"
      render :new
    end  
  end

  def edit    
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
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private 

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end 

  def rest_params
    params.require(:restaurant).permit(:name, food_type:[:name], food_type_ids:[], user_restaurants_attributes:[:id, :notes, :user_id])
  end 


end

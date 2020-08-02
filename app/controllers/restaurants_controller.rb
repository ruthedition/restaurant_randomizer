class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end 

  def show
  end

  def new 
    @restaurant = Restaurant.new
  end 

  def create
    restaurant = Restaurant.create(rest_params)
    redirect_to restaurant
  end

  def edit    
  end

  def update
    if @restaurant.update(rest_params)
      redirect_to @restaurant
    else 
      redirect_to edit_restaurant_path(@restaurant)
    end 
  end 

  def destroy
    @restaurant.delete
    redirect_to restaurants_path
  end


  private 

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end 

  def rest_params
    params.require(:restaurant).permit(:name)
  end 

  
end

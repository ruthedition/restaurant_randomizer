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
    @restaurant = Restaurant.create(rest_params)
    if @restaurant.save
      if !params[:restaurant][:food_types].nil?
        food_type = FoodType.new(name: params[:restaurant][:food_type][:name])
        @restaurant.food_types << food_type
      end 
      @restaurant.users << current_user
      redirect_to user_path(current_user)
    else 
      flash[:alert] = "Your restaurant was not save!"
      render :new
    end 
  end

  def edit    
  end

  def update
    food_type = FoodType.new(name: params[:restaurant][:food_type][:name])
    if @restaurant.update(rest_params)
      @restaurant.food_types << food_type
      redirect_to @restaurant
    else 
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
    params.require(:restaurant).permit(:name, food_type_ids:[])
  end 


end

class FoodTypes::RestaurantsController < ApplicationController
  
  before_action :set_food_type, only: [:new, :index]

  def index
    @restaurants = @food_type.restaurants
  end 

  def new
    food_type = RestaurantFoodType.find(@food_type.id)
    @restaurant = Restaurant.new(food_type_ids: [@food_type.id])
  end

  private

  def set_food_type
    @food_type = FoodType.find(params[:food_type_id])    
  end

end
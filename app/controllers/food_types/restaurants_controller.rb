class FoodTypes::RestaurantsController < ApplicationController
  
  def index
    @food_type = FoodType.find(params[:food_type_id])
    @restaurants = @food_type.restaurants
  end 
end
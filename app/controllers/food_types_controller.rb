class FoodTypesController < ApplicationController
  
  def index
    @food_types = FoodType.all
  end

  def show
    @food_type = FoodType.find(params[:id])
    @restaurants = @food_type.restaurants
  end 
end 
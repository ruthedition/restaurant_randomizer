class FoodTypesController < ApplicationController

  
  def index
    @food_types = FoodType.all
  end
end 
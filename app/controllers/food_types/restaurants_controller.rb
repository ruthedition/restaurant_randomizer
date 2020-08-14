class FoodTypes::RestaurantsController < ApplicationController
  
  before_action :set_food_type, only: [:new, :index]

  def index
    @restaurants = FoodType.user_restaurants(@food_type.id, current_user.id)
  end 

  def new
    @restaurant = Restaurant.new(food_type_ids: [@food_type.id], user_ids: [current_user.id])
  end

  private

  def set_food_type
    @food_type = FoodType.find(params[:food_type_id])    
  end

end
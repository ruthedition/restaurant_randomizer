class RestaurantFoodType < ApplicationRecord
  belongs_to :restaurant
  belongs_to :food_type
end 
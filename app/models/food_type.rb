class FoodType < ApplicationRecord
  has_many :restaurant_food_types
  has_many :restaurants, through: :restaurant_food_types
end

class Restaurant < ApplicationRecord
  # validates :name, :presence true 
  # validates :name, :uniqueness true 
  has_many :restaurant_food_types
  has_many :food_types, through: :restaurant_food_types
end

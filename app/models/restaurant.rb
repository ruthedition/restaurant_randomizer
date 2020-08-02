class Restaurant < ApplicationRecord
  validate :name, presence: true 
  validate :name, uniqueness: true 
  has_many :restaurant_food_types, dependent: :destroy
  has_many :food_types, through: :restaurant_food_types
end

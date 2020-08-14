class FoodType < ApplicationRecord
  #validates :name, presence: true 
  validates :name, uniqueness: true 
  has_many :restaurant_food_types, dependent: :destroy
  has_many :restaurants, through: :restaurant_food_types
  scope :sort_alphabetical, -> { order(:name) }
  scope :user_restaurants, -> (food_type_id, user_id) { find(food_type_id).restaurants.joins(:users).where(users: {id: user_id})}
  
end
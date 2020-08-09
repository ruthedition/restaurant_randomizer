class Restaurant < ApplicationRecord
  validates :name, presence: true 
  validates :name, uniqueness: true 
  has_many :restaurant_food_types, dependent: :destroy
  has_many :food_types, through: :restaurant_food_types
  has_many :user_restaurants, dependent: :destroy 
  has_many :users, through: :user_restaurants
  accepts_nested_attributes_for :user_restaurants, allow_destroy: true
  scope :sort_alphbetical, ->{order(:name)}

end

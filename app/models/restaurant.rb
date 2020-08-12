class Restaurant < ApplicationRecord
  validates :name, presence: true 
  # validates :name, uniqueness: true 
  has_many :restaurant_food_types, dependent: :destroy
  has_many :food_types, through: :restaurant_food_types
  has_many :user_restaurants, dependent: :destroy 
  has_many :users, through: :user_restaurants
  accepts_nested_attributes_for :user_restaurants, allow_destroy: true
  scope :sort_alphbetical, ->{order(:name)}
  
  def food_type=(food_type)
    unless food_type[:name].empty?
      self.food_types.build(name: food_type[:name])
    end
  end
end

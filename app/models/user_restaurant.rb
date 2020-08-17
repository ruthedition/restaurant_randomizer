class UserRestaurant < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  def self.find_by_current_user_and_restaurant(user_id, restaurant_id)
    UserRestaurant.find_by(user_id: user_id, restaurant_id: restaurant_id)
  end
end
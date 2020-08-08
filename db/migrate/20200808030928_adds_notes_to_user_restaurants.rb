class AddsNotesToUserRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :user_restaurants, :notes, :text
  end
end

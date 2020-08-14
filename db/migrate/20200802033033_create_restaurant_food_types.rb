class CreateRestaurantFoodTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurant_food_types do |t|
      t.references :food_type, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.timestamps
    end
  end
end

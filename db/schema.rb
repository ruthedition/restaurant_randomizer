# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_08_030928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "restaurant_food_types", force: :cascade do |t|
    t.bigint "food_type_id", null: false
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_type_id"], name: "index_restaurant_food_types_on_food_type_id"
    t.index ["restaurant_id"], name: "index_restaurant_food_types_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_restaurants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "restaurant_id", null: false
    t.text "notes"
    t.index ["restaurant_id"], name: "index_user_restaurants_on_restaurant_id"
    t.index ["user_id"], name: "index_user_restaurants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "restaurant_food_types", "food_types"
  add_foreign_key "restaurant_food_types", "restaurants"
  add_foreign_key "user_restaurants", "restaurants"
  add_foreign_key "user_restaurants", "users"
end

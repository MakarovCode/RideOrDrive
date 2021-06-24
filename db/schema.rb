# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_21_232325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.bigint "user_id"
    t.string "token"
    t.string "name"
    t.string "brand"
    t.string "holder"
    t.string "exp_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.bigint "user_id"
    t.float "current_lat"
    t.float "current_lng"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_drivers_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "ride_id"
    t.float "value"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ride_id"], name: "index_payments_on_ride_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "riders", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "points", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_riders_on_user_id"
  end

  create_table "rides", force: :cascade do |t|
    t.bigint "rider_id"
    t.bigint "driver_id"
    t.float "start_at_lat"
    t.float "start_at_lng"
    t.float "end_at_lat"
    t.float "end_at_lng"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.float "cost"
    t.float "distance"
    t.float "duration"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driver_id"], name: "index_rides_on_driver_id"
    t.index ["rider_id"], name: "index_rides_on_rider_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid"
    t.string "auth_token"
    t.string "refresh_token"
    t.string "access_token"
    t.datetime "access_token_expired_at"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cards", "users"
  add_foreign_key "drivers", "users"
  add_foreign_key "payments", "rides"
  add_foreign_key "payments", "users"
  add_foreign_key "riders", "users"
  add_foreign_key "rides", "drivers"
  add_foreign_key "rides", "riders"
end

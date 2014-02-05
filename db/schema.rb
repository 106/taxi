# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140204071430) do

  create_table "cities", force: true do |t|
    t.string "name"
  end

  create_table "drivers", force: true do |t|
    t.string   "number"
    t.string   "car"
    t.string   "car_naumber"
    t.integer  "taxi_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "car_color"
  end

  create_table "feedbacks", force: true do |t|
    t.integer  "user_id"
    t.integer  "taxi_id"
    t.integer  "rank"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "phone"
  end

  create_table "orders", force: true do |t|
    t.integer  "taxi_id"
    t.integer  "user_id"
    t.float    "cost"
    t.float    "distance"
    t.integer  "driver_id"
    t.string   "user_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.text     "comment"
    t.boolean  "by_count",         default: false
    t.boolean  "animals"
    t.boolean  "air_conditioning"
    t.boolean  "vip"
    t.boolean  "minivan"
    t.boolean  "out_of_town"
    t.boolean  "check"
  end

  create_table "places", force: true do |t|
    t.integer  "city_id"
    t.string   "address"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "porch"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "region",     default: "Donetsk"
    t.string   "uniq_id"
  end

  create_table "streets", force: true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxis", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "website"
    t.float    "default_price"
    t.float    "price_for_km"
    t.float    "rank"
    t.text     "description"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.float    "min_distance"
    t.boolean  "animals"
    t.boolean  "air_conditioning"
    t.boolean  "vip"
    t.boolean  "minivan"
    t.boolean  "out_of_town"
    t.boolean  "check"
    t.float    "animals_price",          default: 0.0
    t.float    "air_conditioning_price", default: 0.0
    t.float    "vip_price",              default: 0.0
    t.float    "minivan_price",          default: 0.0
    t.float    "out_of_town_price",      default: 0.0
    t.float    "check_price",            default: 0.0
  end

  add_index "taxis", ["email"], name: "index_taxis_on_email", unique: true, using: :btree
  add_index "taxis", ["reset_password_token"], name: "index_taxis_on_reset_password_token", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.integer  "points"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

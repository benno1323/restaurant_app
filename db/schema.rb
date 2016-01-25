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

ActiveRecord::Schema.define(version: 20160125161614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "dishes", force: :cascade do |t|
    t.string   "dish_group"
    t.string   "name"
    t.text     "description"
    t.decimal  "price",         precision: 8, scale: 2, default: 0.0, null: false
    t.string   "photo"
    t.integer  "restaurant_id"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "dishes", ["restaurant_id"], name: "index_dishes_on_restaurant_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "order_id"
    t.integer  "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "calories"
  end

  add_index "items", ["dish_id"], name: "index_items_on_dish_id", using: :btree
  add_index "items", ["order_id"], name: "index_items_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.date     "date"
    t.decimal  "sub_total",     precision: 8, scale: 2, default: 0.0, null: false
    t.decimal  "taxes",         precision: 8, scale: 2, default: 0.0, null: false
    t.decimal  "total",         precision: 8, scale: 2, default: 0.0, null: false
    t.integer  "restaurant_id"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "orders", ["restaurant_id"], name: "index_orders_on_restaurant_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "file"
  end

  add_index "pictures", ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "address"
    t.string   "phone"
    t.string   "logo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "dishes", "restaurants"
  add_foreign_key "items", "dishes"
  add_foreign_key "items", "orders"
  add_foreign_key "orders", "restaurants"
end

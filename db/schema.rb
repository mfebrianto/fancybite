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

ActiveRecord::Schema.define(version: 20141025043540) do

  create_table "addresses", force: true do |t|
    t.string "address"
    t.string "city"
    t.string "customer_id"
    t.string "kecamatan"
    t.string "kelurahan"
  end

  create_table "banner_menus", force: true do |t|
    t.integer  "sequence"
    t.string   "url"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "customers", force: true do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password"
  end

  create_table "featuring_items", force: true do |t|
    t.integer "sequence"
    t.integer "menu_item_id"
  end

  add_index "featuring_items", ["menu_item_id"], name: "index_featuring_items_on_menu_item_id", using: :btree

  create_table "menu_categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_items", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "price"
    t.string   "picture"
    t.integer  "menu_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "menu_items", ["menu_category_id"], name: "index_menu_items_on_menu_category_id", using: :btree

  create_table "order_details", force: true do |t|
    t.string  "menu_item_id"
    t.string  "order_id"
    t.decimal "quantity",     precision: 10, scale: 0
  end

  create_table "orders", force: true do |t|
    t.string "customer_id"
    t.string "transfer_key"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101214203816) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", :force => true do |t|
    t.string   "name",        :limit => 60,  :null => false
    t.string   "description", :limit => 500
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orderlines", :force => true do |t|
    t.integer  "order_id",                      :null => false
    t.integer  "service_id",                    :null => false
    t.integer  "count",                         :null => false
    t.boolean  "done",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orderlines", ["order_id"], :name => "index_orderlines_on_order_id"

  create_table "orders", :force => true do |t|
    t.integer  "client_id",                                      :null => false
    t.integer  "manager_id",                                     :null => false
    t.string   "description",  :limit => 500
    t.date     "completed_at"
    t.boolean  "paid",                        :default => false
    t.string   "code",                                           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "part_categories", :force => true do |t|
    t.string   "name",        :limit => 60,  :null => false
    t.string   "description", :limit => 500
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", :force => true do |t|
    t.string   "name",             :limit => 60,                                 :null => false
    t.string   "description",      :limit => 500
    t.decimal  "price",                           :precision => 10, :scale => 0, :null => false
    t.integer  "manufacturer_id",                                                :null => false
    t.integer  "part_category_id",                                               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts_services", :id => false, :force => true do |t|
    t.integer "part_id"
    t.integer "service_id"
  end

  add_index "parts_services", ["part_id", "service_id"], :name => "index_parts_services_on_part_id_and_service_id", :unique => true

  create_table "roles", :force => true do |t|
    t.string "name",       :limit => 40, :null => false
    t.string "controller",               :null => false
  end

  create_table "services", :force => true do |t|
    t.string   "name",        :limit => 60,                                 :null => false
    t.string   "description", :limit => 500
    t.decimal  "price",                      :precision => 10, :scale => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                              :null => false
    t.string   "phone",                             :null => false
    t.string   "email",                             :null => false
    t.string   "login",                             :null => false
    t.string   "crypted_password",                  :null => false
    t.string   "password_salt",                     :null => false
    t.string   "persistence_token",                 :null => false
    t.integer  "role_id",                           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "perishable_token",  :default => "", :null => false
  end

  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end

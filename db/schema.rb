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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130524065552) do

  create_table "Persons", :id => false, :force => true do |t|
    t.integer "P_Id"
    t.string  "LastName"
    t.string  "FirstName"
    t.string  "Address"
    t.string  "City"
  end

  create_table "Persons_26", :id => false, :force => true do |t|
    t.integer "P_Id"
    t.string  "LastName"
    t.string  "FirstName"
    t.string  "Address"
    t.string  "City"
  end

  create_table "Persons_27", :id => false, :force => true do |t|
    t.integer "P_Id"
    t.string  "LastName"
    t.string  "FirstName"
    t.string  "Address"
    t.string  "City"
  end

  create_table "Persons_28", :id => false, :force => true do |t|
    t.integer "P_Id"
    t.string  "LastName"
    t.string  "FirstName"
    t.string  "Address"
    t.string  "City"
  end

  create_table "Persons_29", :id => false, :force => true do |t|
    t.integer "P_Id"
    t.string  "LastName"
    t.string  "FirstName"
    t.string  "Address"
    t.string  "City"
  end

  create_table "admin_34", :primary_key => "login_id", :force => true do |t|
    t.string "password", :limit => 100
  end

  create_table "adminlogins", :force => true do |t|
    t.string   "loginid"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contactpeople", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contactpeople_34", :id => false, :force => true do |t|
    t.string "name",    :limit => 100
    t.string "email"
    t.string "phone"
    t.string "message"
  end

  create_table "homes", :primary_key => "user_id", :force => true do |t|
    t.string   "c_name"
    t.string   "phone"
    t.string   "address"
    t.string   "logo"
    t.string   "slider_img_1"
    t.string   "slider_img_2"
    t.string   "slider_3"
    t.string   "c_img_1"
    t.string   "c_img_2"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "human_27", :id => false, :force => true do |t|
    t.integer "P_Id"
    t.string  "LastName"
    t.string  "FirstName"
    t.string  "Address"
    t.string  "City"
  end

  create_table "human_28", :id => false, :force => true do |t|
    t.integer "P_Id"
    t.string  "LastName"
    t.string  "FirstName"
    t.string  "Address"
    t.string  "City"
  end

  create_table "human_29", :id => false, :force => true do |t|
    t.integer "P_Id"
    t.string  "LastName"
    t.string  "FirstName"
    t.string  "Address"
    t.string  "City"
  end

  create_table "m_contacts", :primary_key => "user_id", :force => true do |t|
    t.string   "contant"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "m_stories", :primary_key => "user_id", :force => true do |t|
    t.string   "contant"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "master_users", :primary_key => "master_user_id", :force => true do |t|
    t.string   "shop_name"
    t.string   "password"
    t.string   "master_email"
    t.boolean  "validate"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "master_users", ["shop_name"], :name => "index_master_users_on_shop_name", :unique => true

  create_table "properties", :primary_key => "property_id", :force => true do |t|
    t.string   "property_name"
    t.integer  "price"
    t.string   "state"
    t.string   "property_type"
    t.string   "purpose"
    t.integer  "bedroom"
    t.string   "image"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "sub_property_type"
    t.string   "contant"
  end

  create_table "properties_34", :primary_key => "property_id", :force => true do |t|
    t.string  "property_name"
    t.string  "price"
    t.string  "state"
    t.string  "property_type"
    t.string  "purpose"
    t.integer "bedroom"
    t.string  "image"
    t.string  "sub_property_type"
    t.string  "contant"
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "stories", :force => true do |t|
    t.string   "name"
    t.integer  "phone"
    t.string   "email"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "storiesses", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.string   "story"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "storiesses_34", :primary_key => "story_id", :force => true do |t|
    t.integer "sub_user_id"
    t.string  "name",        :limit => 100
    t.string  "email"
    t.string  "phone"
    t.string  "story"
    t.string  "image",       :limit => 2
  end

  create_table "stors", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.string   "story"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :primary_key => "user_id", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "my_properties"
    t.string   "email"
    t.boolean  "validate"
  end

  create_table "users_34", :primary_key => "sub_user_id", :force => true do |t|
    t.string  "name",          :limit => 100
    t.string  "password"
    t.string  "my_properties"
    t.string  "email"
    t.boolean "validates"
  end

end

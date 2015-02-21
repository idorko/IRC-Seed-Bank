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

ActiveRecord::Schema.define(:version => 20150221191813) do

  create_table "dispensals", :force => true do |t|
    t.string   "family"
    t.string   "variety"
    t.float    "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "farmer_id"
    t.integer  "seed_id"
  end

  add_index "dispensals", ["id", "updated_at", "farmer_id", "seed_id"], :name => "dispensals_index"

  create_table "donations", :force => true do |t|
    t.string   "family"
    t.string   "variety"
    t.float    "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "donor_id"
    t.integer  "seed_id"
    t.float    "value"
    t.integer  "farmer_id"
  end

  add_index "donations", ["id", "updated_at", "donor_id", "seed_id"], :name => "donations_index"

  create_table "donors", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_phone"
  end

  add_index "donors", ["id", "name"], :name => "index_donors_on_id_and_name"

  create_table "donors_seeds", :id => false, :force => true do |t|
    t.integer "donor_id"
    t.integer "seed_id"
  end

  create_table "farmers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "language"
    t.string   "country"
    t.string   "farm_site"
  end

  add_index "farmers", ["id", "name"], :name => "index_farmers_on_id_and_name"

  create_table "seeds", :force => true do |t|
    t.string   "family"
    t.string   "variety"
    t.float    "quantity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "spacing"
    t.string   "maturity"
    t.string   "common_names"
    t.string   "description"
    t.string   "comments"
  end

  add_index "seeds", ["family", "id"], :name => "index_seeds_on_family_and_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

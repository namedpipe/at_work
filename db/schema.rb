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

ActiveRecord::Schema.define(:version => 20101012183807) do

  create_table "accomplishments", :force => true do |t|
    t.text     "accomplishment"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                     :limit => 100
    t.string   "first_name",                :limit => 100
    t.string   "last_name",                 :limit => 100
    t.string   "permanent_login"
    t.string   "crypted_password",          :limit => 50
    t.text     "current_status"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "salt"
  end

end

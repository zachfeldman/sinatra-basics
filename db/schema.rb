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

ActiveRecord::Schema.define(version: 20140221003302) do

  create_table "addresses", force: true do |t|
    t.string "line_1"
    t.string "line_2"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zip"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "password"
  end

  create_table "users_addresses", force: true do |t|
    t.integer "user_id"
    t.integer "address_id"
  end

end

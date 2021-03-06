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

ActiveRecord::Schema.define(version: 20141118024204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text    "comment"
    t.integer "user_id"
    t.integer "commentable_id"
    t.string  "commentable_type"
  end

  create_table "favorites", force: true do |t|
    t.integer "rant_id"
    t.integer "user_id"
  end

  create_table "follows", force: true do |t|
    t.integer "follower_id"
    t.integer "followee_id"
  end

  create_table "rants", force: true do |t|
    t.string   "topic"
    t.text     "rant"
    t.integer  "user_id"
    t.integer  "favorites_count", default: 0
    t.boolean  "spam",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.text     "bio"
    t.string   "frequency"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.boolean  "admin",              default: false
    t.string   "email"
    t.boolean  "disabled",           default: false
    t.string   "confirmation_token"
    t.boolean  "confirmed",          default: false
  end

end

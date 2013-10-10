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

ActiveRecord::Schema.define(version: 1) do

  create_table "comments", force: true do |t|
    t.integer  "post_id",                               null: false
    t.integer  "user_id",                               null: false
    t.string   "title",      limit: 140
    t.text     "body"
    t.boolean  "unread",                 default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id", "user_id"], name: "index_comments_on_post_id_and_user_id"
  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "posts", force: true do |t|
    t.integer  "user_id",                             null: false
    t.string   "title",       limit: 140
    t.text     "body"
    t.integer  "quantity",                default: 0
    t.string   "unit",        limit: 70
    t.integer  "price",                   default: 0
    t.integer  "amount",                  default: 0
    t.string   "place",       limit: 140
    t.string   "category",    limit: 140
    t.integer  "category_id",             default: 0
    t.text     "remarks"
    t.string   "image"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id", "category"], name: "index_posts_on_user_id_and_category"
  add_index "posts", ["user_id", "category_id"], name: "index_posts_on_user_id_and_category_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name",            limit: 140,                 null: false
    t.string   "email",           limit: 50,                  null: false
    t.boolean  "admin",                       default: false
    t.text     "description"
    t.string   "tel",             limit: 20
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "access_token"
    t.text     "address"
    t.string   "url"
    t.string   "facebook"
    t.string   "twitter"
    t.integer  "reputation"
    t.string   "image"
    t.string   "facebook_id"
    t.string   "twitter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["access_token"], name: "index_users_on_access_token"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["facebook_id"], name: "index_users_on_facebook_id"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["twitter_id"], name: "index_users_on_twitter_id"

end

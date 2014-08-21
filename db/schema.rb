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

ActiveRecord::Schema.define(version: 20140821191751) do

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "isbn"
    t.string   "image"
    t.boolean  "is_active"
    t.boolean  "is_approved"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "avg_rating",  precision: 3, scale: 2
    t.integer  "user_id"
  end

  add_index "books", ["user_id"], name: "index_books_on_user_id"

  create_table "follows", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "book_id"
  end

  create_table "opted_outs", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.boolean "by_rating"
    t.integer "rating_threshold"
    t.boolean "by_review"
  end

  create_table "reviews", force: true do |t|
    t.string   "description"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "book_id"
  end

  add_index "reviews", ["book_id"], name: "index_reviews_on_book_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "user_configs", force: true do |t|
    t.integer  "user_id"
    t.integer  "rating_threshold"
    t.boolean  "opt_out_by_rating"
    t.boolean  "opt_out_by_review"
    t.boolean  "daily_digest_enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "avatar"
    t.string   "email"
    t.integer  "sign_in_count",      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",           default: false
    t.boolean  "is_blocked",         default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end

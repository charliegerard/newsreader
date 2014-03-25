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

ActiveRecord::Schema.define(version: 20140324231850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "copy"
    t.text     "image"
    t.string   "author"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_id"
  end

  create_table "sources", force: true do |t|
    t.string   "name"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "topic_id"
  end

  create_table "sources_users", id: false, force: true do |t|
    t.integer "source_id"
    t.integer "user_id"
  end

  create_table "topics", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics_users", id: false, force: true do |t|
    t.integer "topic_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.text     "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
    t.string   "password_digest"
  end

end

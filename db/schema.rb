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

ActiveRecord::Schema.define(:version => 20120212170155) do

  create_table "posts", :force => true do |t|
    t.string    "title"
    t.text      "body"
    t.string    "category"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "image_file_name"
    t.string    "image_content_type"
    t.integer   "image_file_size"
    t.timestamp "image_updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string    "name"
    t.text      "value"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "tweets", :force => true do |t|
    t.string    "screen_name"
    t.string    "text"
    t.timestamp "tweet_date"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end

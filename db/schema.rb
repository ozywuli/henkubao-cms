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

ActiveRecord::Schema.define(version: 2018_05_07_215411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "settings", force: :cascade do |t|
    t.string "metaTitle"
    t.string "metaAuthor"
    t.string "metaDescription"
    t.string "metaKeywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "metaSocial", default: "{'name' => 'twitter', 'url' => 'https://twitter.com'}"
    t.json "social", default: {"0"=>{"name"=>"twitter", "url"=>"https://twitter.com"}}
  end

  create_table "social_addresses", force: :cascade do |t|
    t.text "name"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "setting_id"
    t.index ["setting_id"], name: "index_social_addresses_on_setting_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "social_addresses", "settings"
end

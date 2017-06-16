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

ActiveRecord::Schema.define(version: 20170616082012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "engagements", force: :cascade do |t|
    t.text "engagement_description"
    t.bigint "user_id"
    t.integer "request_id"
    t.integer "offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_engagements_on_offer_id"
    t.index ["request_id"], name: "index_engagements_on_request_id"
    t.index ["user_id"], name: "index_engagements_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "title"
    t.text "offer_description"
    t.string "offer_category"
    t.integer "token"
    t.string "photo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "images"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "title"
    t.text "request_description"
    t.string "request_category"
    t.integer "token"
    t.string "photo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "location"
    t.integer "token"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "birthday"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "engagements", "offers"
  add_foreign_key "engagements", "requests"
  add_foreign_key "engagements", "users"
  add_foreign_key "offers", "users"
  add_foreign_key "requests", "users"
end

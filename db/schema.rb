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

ActiveRecord::Schema.define(version: 20180211052133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accepted_users", force: :cascade do |t|
    t.bigint "request_id"
    t.bigint "user_id"
    t.index ["request_id", "user_id"], name: "index_accepted_users_on_request_id_and_user_id", unique: true
    t.index ["request_id"], name: "index_accepted_users_on_request_id"
    t.index ["user_id"], name: "index_accepted_users_on_user_id"
  end

  create_table "beacons", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "major", null: false
    t.integer "minor", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["major", "minor"], name: "index_beacons_on_major_and_minor", unique: true
    t.index ["user_id"], name: "index_beacons_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "target_id", null: false
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_id"], name: "index_messages_on_target_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "title", null: false
    t.float "timelimit"
    t.string "reward"
    t.text "comment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accepted_users", "requests"
  add_foreign_key "accepted_users", "users"
  add_foreign_key "beacons", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "messages", "users", column: "target_id"
  add_foreign_key "requests", "users"
end

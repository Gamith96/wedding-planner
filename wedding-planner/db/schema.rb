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

ActiveRecord::Schema.define(version: 20170426185806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guests", force: :cascade do |t|
    t.boolean  "rsvp",       default: false, null: false
    t.string   "name",       default: "",    null: false
    t.string   "email",      default: "",    null: false
    t.integer  "wedding_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["wedding_id"], name: "index_guests_on_wedding_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "photo_img",    default: ""
    t.string   "url",          default: ""
    t.string   "address",      default: "", null: false
    t.string   "name",         default: "", null: false
    t.integer  "price",        default: 0,  null: false
    t.integer  "max_capacity"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "role",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "weddings", force: :cascade do |t|
    t.string   "couple_name",  default: "", null: false
    t.datetime "wedding_date"
    t.integer  "max_budget"
    t.integer  "min_budget"
    t.integer  "location_id"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["location_id"], name: "index_weddings_on_location_id", using: :btree
    t.index ["user_id"], name: "index_weddings_on_user_id", using: :btree
  end

  add_foreign_key "guests", "weddings"
  add_foreign_key "weddings", "users"
end

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

ActiveRecord::Schema.define(version: 20161121162616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "receipts", force: :cascade do |t|
    t.integer  "etsy_id",                   null: false
    t.boolean  "active",     default: true, null: false
    t.integer  "user_id",                   null: false
    t.integer  "status_id",                 null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["etsy_id"], name: "index_receipts_on_etsy_id", unique: true, using: :btree
    t.index ["status_id"], name: "index_receipts_on_status_id", using: :btree
    t.index ["user_id"], name: "index_receipts_on_user_id", using: :btree
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_statuses_on_title", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.integer  "etsy_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["etsy_id"], name: "index_users_on_etsy_id", unique: true, using: :btree
  end

end

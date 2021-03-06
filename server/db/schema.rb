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

ActiveRecord::Schema.define(version: 20160304121302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "displays", force: :cascade do |t|
    t.string   "model",                           null: false
    t.float    "size",                            null: false
    t.integer  "response_time"
    t.boolean  "is_ips",          default: false, null: false
    t.integer  "price_cents"
    t.integer  "manufacturer_id",                 null: false
    t.integer  "resolution_id",                   null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "displays", ["is_ips"], name: "index_displays_on_is_ips", using: :btree
  add_index "displays", ["manufacturer_id"], name: "index_displays_on_manufacturer_id", using: :btree
  add_index "displays", ["model"], name: "index_displays_on_model", using: :btree
  add_index "displays", ["price_cents"], name: "index_displays_on_price_cents", using: :btree
  add_index "displays", ["resolution_id"], name: "index_displays_on_resolution_id", using: :btree
  add_index "displays", ["response_time"], name: "index_displays_on_response_time", using: :btree
  add_index "displays", ["size"], name: "index_displays_on_size", using: :btree

  create_table "manufacturers", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "manufacturers", ["title"], name: "index_manufacturers_on_title", unique: true, using: :btree

  create_table "resolutions", force: :cascade do |t|
    t.integer  "width",      null: false
    t.integer  "height",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "resolutions", ["width", "height"], name: "index_resolutions_on_width_and_height", unique: true, using: :btree

  add_foreign_key "displays", "manufacturers"
  add_foreign_key "displays", "resolutions"
end

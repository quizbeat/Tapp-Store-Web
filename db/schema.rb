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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", primary_key: "app_id", force: :cascade do |t|
    t.string  "app_name",     limit: 20,                                                      null: false
    t.string  "description",  limit: 1000,                                                    null: false
    t.integer "category_id",                                                                  null: false
    t.money   "price",                                    scale: 2,                           null: false
    t.integer "app_version",                                                                  null: false
    t.decimal "app_size",                  precision: 20, scale: 2,                           null: false
    t.string  "status",       limit: 20,                            default: "on moderation", null: false
    t.integer "developer_id",                                                                 null: false
  end

  add_index "applications", ["app_id"], name: "applicationindex", unique: true, using: :btree

  create_table "categories", primary_key: "category_id", force: :cascade do |t|
    t.string "category_name", limit: 40,  null: false
    t.string "description",   limit: 200, null: false
  end

  add_index "categories", ["category_id"], name: "categoryindex", unique: true, using: :btree

  create_table "developers", primary_key: "person_id", force: :cascade do |t|
  end

  add_index "developers", ["person_id"], name: "developerindex", unique: true, using: :btree

  create_table "downloads", primary_key: "download_id", force: :cascade do |t|
    t.integer  "app_id",                          null: false
    t.integer  "person_id",                       null: false
    t.datetime "download_date", default: "now()", null: false
  end

  add_index "downloads", ["download_id"], name: "downloadindex", unique: true, using: :btree

  create_table "moderators", primary_key: "person_id", force: :cascade do |t|
  end

  add_index "moderators", ["person_id"], name: "moderatorindex", unique: true, using: :btree

  create_table "people", primary_key: "person_id", force: :cascade do |t|
    t.string "first_name", limit: 20,                          null: false
    t.string "last_name",  limit: 20,                          null: false
    t.date   "birth_date",                                     null: false
    t.string "gender",     limit: 6,                           null: false
    t.string "email",      limit: 100,                         null: false
    t.money  "balance",                scale: 2, default: 0.0, null: false
  end

  add_index "people", ["person_id"], name: "personindex", unique: true, using: :btree

  create_table "publication_requests", primary_key: "request_id", force: :cascade do |t|
    t.integer  "app_id",                                      null: false
    t.integer  "moderator_id"
    t.string   "status",       limit: 20, default: "waiting", null: false
    t.datetime "request_date",            default: "now()",   null: false
  end

  create_table "reports", primary_key: "report_id", force: :cascade do |t|
    t.string  "reason",       limit: 40,   null: false
    t.string  "description",  limit: 2000, null: false
    t.integer "app_id",                    null: false
    t.string  "status",       limit: 20,   null: false
    t.integer "person_id",                 null: false
    t.integer "moderator_id"
  end

  add_index "reports", ["report_id"], name: "reportindex", unique: true, using: :btree

  add_foreign_key "applications", "categories", primary_key: "category_id", name: "r_5"
  add_foreign_key "applications", "developers", primary_key: "person_id", name: "r_29"
  add_foreign_key "developers", "people", primary_key: "person_id", name: "r_25"
  add_foreign_key "downloads", "applications", column: "app_id", primary_key: "app_id", name: "r_24"
  add_foreign_key "downloads", "people", primary_key: "person_id", name: "r_23"
  add_foreign_key "moderators", "people", primary_key: "person_id", name: "r_26"
  add_foreign_key "publication_requests", "applications", column: "app_id", primary_key: "app_id", name: "r_3", on_delete: :cascade
  add_foreign_key "publication_requests", "moderators", primary_key: "person_id", name: "r_28"
  add_foreign_key "reports", "applications", column: "app_id", primary_key: "app_id", name: "r_6"
  add_foreign_key "reports", "moderators", primary_key: "person_id", name: "r_27"
  add_foreign_key "reports", "people", primary_key: "person_id", name: "r_21"
end

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

ActiveRecord::Schema.define(version: 20180221122154) do

  create_table "keywords", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.integer "person_id"
    t.index ["person_id"], name: "person_id_idx"
  end

  create_table "pages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "url", null: false
    t.integer "site_id", null: false
    t.timestamp "found_date_time", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "last_scan_date"
    t.index ["site_id"], name: "SiteID_idx"
    t.index ["url"], name: "url", unique: true
  end

  create_table "person_page_rank", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "person_id", null: false
    t.integer "page_id", null: false
    t.integer "rank"
    t.index ["page_id"], name: "PageID_idx"
    t.index ["person_id"], name: "PersonID_idx"
  end

  create_table "persons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
  end

  create_table "sites", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "keywords", "persons", name: "PersonIDKeywords", on_update: :cascade, on_delete: :cascade
  add_foreign_key "pages", "sites", name: "SiteID", on_update: :cascade, on_delete: :cascade
  add_foreign_key "person_page_rank", "pages", name: "PageID", on_update: :cascade, on_delete: :cascade
  add_foreign_key "person_page_rank", "persons", name: "PersonIDRank", on_update: :cascade, on_delete: :cascade
end

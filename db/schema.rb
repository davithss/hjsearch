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

ActiveRecord::Schema.define(version: 20170131153656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "searches", force: :cascade do |t|
    t.string   "title"
    t.string   "user_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searchjoy_searches", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "search_type"
    t.string   "query"
    t.string   "normalized_query"
    t.integer  "results_count"
    t.datetime "created_at"
    t.integer  "convertable_id"
    t.string   "convertable_type"
    t.datetime "converted_at"
    t.index ["convertable_id", "convertable_type"], name: "index_searchjoy_searches_on_convertable_id_and_convertable_type", using: :btree
    t.index ["created_at"], name: "index_searchjoy_searches_on_created_at", using: :btree
    t.index ["search_type", "created_at"], name: "index_searchjoy_searches_on_search_type_and_created_at", using: :btree
    t.index ["search_type", "normalized_query", "created_at"], name: "index_searchjoy_searches_on_search_type_normalized_query", using: :btree
  end

end

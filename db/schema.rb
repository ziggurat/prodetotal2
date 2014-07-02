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

ActiveRecord::Schema.define(version: 20140702193116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "owner_id"
    t.integer  "competition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "challenges", ["competition_id"], name: "index_challenges_on_competition_id", using: :btree
  add_index "challenges", ["owner_id"], name: "index_challenges_on_owner_id", using: :btree

  create_table "competitions", force: true do |t|
    t.integer  "exact_match_points",  default: 6
    t.integer  "result_match_points", default: 3
    t.integer  "no_match_points",     default: 0
    t.integer  "no_forecast_points",  default: 0
    t.string   "logo"
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "archive",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.integer  "competition_id"
    t.integer  "local_id"
    t.integer  "visitor_id"
    t.datetime "date"
    t.integer  "local_score"
    t.integer  "visitor_score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["competition_id"], name: "index_matches_on_competition_id", using: :btree
  add_index "matches", ["local_id"], name: "index_matches_on_local_id", using: :btree
  add_index "matches", ["visitor_id"], name: "index_matches_on_visitor_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "key"
    t.string   "name"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_challenges", force: true do |t|
    t.integer "user_id"
    t.integer "challenge_id"
    t.integer "points"
  end

  create_table "users", force: true do |t|
    t.string   "facebook_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

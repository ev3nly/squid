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

ActiveRecord::Schema.define(version: 20131022020526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "activities", force: true do |t|
    t.string   "name",       null: false
    t.string   "short_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "availability_times", force: true do |t|
    t.string  "day",     null: false
    t.string  "period",  null: false
    t.integer "user_id", null: false
  end

  create_table "interests", force: true do |t|
    t.integer  "interesting_id",   null: false
    t.string   "interesting_type", null: false
    t.integer  "interested_id",    null: false
    t.string   "interested_type",  null: false
    t.boolean  "casual"
    t.boolean  "competitive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interests", ["interesting_id", "interesting_type", "interested_id", "interested_type"], name: "index_interests_on_interested_and_interesting", unique: true, using: :btree

  create_table "referrals", force: true do |t|
    t.string  "code",   null: false
    t.integer "visits"
  end

  create_table "suggestions", force: true do |t|
    t.text     "body",       null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id",        null: false
    t.integer  "taggable_id",   null: false
    t.string   "taggable_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type"], name: "index_taggings_on_taggable_id_and_taggable_type", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",                      null: false
    t.string   "email"
    t.string   "facebook_id",               null: false
    t.string   "facebook_token",            null: false
    t.string   "phone"
    t.string   "profile_picture_url"
    t.datetime "facebook_token_expires_at"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "referral_code",             null: false
  end

end

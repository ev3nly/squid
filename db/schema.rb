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

ActiveRecord::Schema.define(version: 20130925013936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "courses", force: true do |t|
    t.string   "name",                                  null: false
    t.string   "difficulty",                            null: false
    t.decimal  "price",         precision: 8, scale: 2, null: false
    t.string   "style",                                 null: false
    t.integer  "time_quantity"
    t.string   "time_unit"
    t.string   "url",                                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "provider_id",                           null: false
  end

  add_index "courses", ["name"], name: "index_courses_on_name", using: :btree

  create_table "professors", force: true do |t|
    t.string   "name",       null: false
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "professors", ["name"], name: "index_professors_on_name", using: :btree

  create_table "providers", force: true do |t|
    t.string   "name",       null: false
    t.string   "url",        null: false
    t.string   "style"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "providers", ["name"], name: "index_providers_on_name", using: :btree

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

  create_table "teachings", force: true do |t|
    t.integer  "course_id",    null: false
    t.integer  "professor_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teachings", ["course_id", "professor_id"], name: "index_teachings_on_course_id_and_professor_id", using: :btree

end

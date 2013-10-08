class RemoveCourseStuff < ActiveRecord::Migration
  def up
  	drop_table :courses
  	drop_table :professors
  	drop_table :providers
  	drop_table :teachings
  end

  def down
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

  	create_table "professors", force: true do |t|
  	  t.string   "name",       null: false
  	  t.string   "url"
  	  t.datetime "created_at"
  	  t.datetime "updated_at"
  	end

  	create_table "providers", force: true do |t|
  	  t.string   "name",       null: false
  	  t.string   "url",        null: false
  	  t.string   "style"
  	  t.datetime "created_at"
  	  t.datetime "updated_at"
  	end

  	create_table "teachings", force: true do |t|
  	  t.integer  "course_id",    null: false
  	  t.integer  "professor_id", null: false
  	  t.datetime "created_at"
  	  t.datetime "updated_at"
  	end
  end
end

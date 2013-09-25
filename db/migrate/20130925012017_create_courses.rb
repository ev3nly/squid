class CreateCourses < ActiveRecord::Migration
  def up
    create_table :courses do |t|
    	t.string :name, null: false
    	t.string :difficulty, null: false
    	t.decimal :price, precision: 8, scale: 2, null: false
    	t.string :style, null: false
    	t.integer :time_quantity
    	t.string :time_unit
    	t.string :url, null: false

    	t.timestamps
    end

    add_index :courses, :name
  end

  def down
  	drop_table :courses
  end
end

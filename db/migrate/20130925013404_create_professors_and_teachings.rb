class CreateProfessorsAndTeachings < ActiveRecord::Migration
  def up
    create_table :professors do |t|
    	t.string :name, null: false
    	t.string :url

    	t.timestamps
    end

    add_index :professors, :name

    create_table :teachings do |t|
    	t.references :course, null: false
    	t.references :professor, null: false

    	t.timestamps
    end

    add_index :teachings, [:course_id, :professor_id]
  end

  def down
  	drop_table :professors
  	drop_table :teachings
  end
end

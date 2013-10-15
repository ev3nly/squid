class AddLevelToInterests < ActiveRecord::Migration
  def up
  	add_column :interests, :level, :string, null: false
  	add_index :interests, ["interesting_id", "interesting_type", "interested_id", "interested_type", "level"], 
    					unique: true, 
    					name: "index_interests_on_interested_and_interesting_and_level"

    remove_index :interests, name: :index_interests_on_interested_and_interesting
  end

  def down
  	remove_column :interests, :level
  	add_index "interests", ["interesting_id", "interesting_type", "interested_id", "interested_type"], name: "index_interests_on_interested_and_interesting", unique: true, using: :btree
  end
end

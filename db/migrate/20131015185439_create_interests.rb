class CreateInterests < ActiveRecord::Migration
  def up
    create_table :interests do |t|
    	t.references :interesting, polymorphic: true, null: false
    	t.references :interested,  polymorphic: true, null: false
    end

    add_index :interests, ["interesting_id", "interesting_type", "interested_id", "interested_type"], 
    					unique: true, 
    					name: "index_interests_on_interested_and_interesting"
  end

  def down
  	drop_table :interests
  end
end

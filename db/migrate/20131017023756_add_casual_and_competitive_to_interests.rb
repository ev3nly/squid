class AddCasualAndCompetitiveToInterests < ActiveRecord::Migration
  def up
  	add_column :interests, :casual, :boolean
  	add_column :interests, :competitive, :boolean
  	remove_column :interests, :level
  	add_index :interests, [:interesting_id, :interesting_type, :interested_id, :interested_type], name: :index_interests_on_interested_and_interesting, unique: true
  end

  def down
  	remove_column :interests, :casual
  	remove_column :interests, :competitive
  	add_column :interests, :level, :string, null: false
  end
end

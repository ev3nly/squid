class CreateProviders < ActiveRecord::Migration
  def up
    create_table :providers do |t|
    	t.string :name, null: false
    	t.string :url, null: false
    	t.string :style

    	t.timestamps
    end

    add_index :providers, :name

    add_column :courses, :provider_id, :integer, null: false
  end

  def down
  	drop_table :providers
  	remove_column :courses, :provider_id
  end
end

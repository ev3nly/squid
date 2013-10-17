class AddShortCodeToActivities < ActiveRecord::Migration
  def up
  	add_column :activities, :short_code, :string, unique: true
  end

  def down
  	remove_column :activities, :short_code
  end
end

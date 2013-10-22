class CreateAvailabilityTimes < ActiveRecord::Migration
  def up
    create_table :availability_times do |t|
    	t.string :day, null: false
    	t.string :period, null: false
    	t.references :user, null: false
    end
  end

  def down
  	drop_table :availability_times
  end
end

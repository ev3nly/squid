class CreateActivitiesTable < ActiveRecord::Migration
  def up
    create_table :activities do |t|
    	t.string :name, null: false
    end

    Activity.create!(name: "Touch Football")
    Activity.create!(name: "Basketball")
    Activity.create!(name: "Whiffle Ball")
    Activity.create!(name: "Bowling")
    Activity.create!(name: "Golf")
    Activity.create!(name: "Tennis")
    Activity.create!(name: "Soccer")
    Activity.create!(name: "Ultimate Frisbee")
  end

  def down
  	drop_table :activities
  end
end

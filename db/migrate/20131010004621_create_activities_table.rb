class CreateActivitiesTable < ActiveRecord::Migration
  def up
    create_table :activities do |t|
    	t.string :name, null: false
    end

    Activity.create!(name: "Touch Football", short_code: "football")
    Activity.create!(name: "Basketball", short_code: "basketball")
    Activity.create!(name: "Whiffle Ball", short_code: "whiffle")
    Activity.create!(name: "Bowling", short_code: "bowling")
    Activity.create!(name: "Golf", short_code: "golf")
    Activity.create!(name: "Tennis", short_code: "tennis")
    Activity.create!(name: "Soccer", short_code: "soccer")
    Activity.create!(name: "Ultimate Frisbee", short_code: "ultimate")
  end

  def down
  	drop_table :activities
  end
end

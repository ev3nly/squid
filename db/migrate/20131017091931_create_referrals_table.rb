class CreateReferralsTable < ActiveRecord::Migration
  def up
    create_table :referrals do |t|
    	t.string :code, null: false, unique: true
    	t.integer :visits
    end
  end

  def down
  	drop_table :referrals
  end
end

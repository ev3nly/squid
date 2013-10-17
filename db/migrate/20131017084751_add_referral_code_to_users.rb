class AddReferralCodeToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :referral_code, :string, null: false, unique: true
  end

  def down
  	remove_column :users, :referral_code
  end
end

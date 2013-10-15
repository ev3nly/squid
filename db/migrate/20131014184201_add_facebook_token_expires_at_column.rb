class AddFacebookTokenExpiresAtColumn < ActiveRecord::Migration
  def up
  	add_column :users, :facebook_token_expires_at, :datetime
  end

  def down
  	remove_column :users, :facebook_token_expires_at
  end
end

class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
    	t.string :name, null: false
    	t.string :email
    	t.string :facebook_id, null: false
    	t.string :facebook_token, null: false
    	t.string :phone
    	t.string :profile_picture_url 
    end
  end

  def down
  	drop_table :users	
  end
end

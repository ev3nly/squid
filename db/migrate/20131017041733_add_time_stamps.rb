class AddTimeStamps < ActiveRecord::Migration
  def change
  	change_table :activities do |t|
  		t.timestamps
  	end

  	change_table :interests do |t|
  		t.timestamps
  	end

  	change_table :users do |t|
  		t.timestamps
  	end
  end
end

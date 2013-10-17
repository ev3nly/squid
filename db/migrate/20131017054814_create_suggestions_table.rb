class CreateSuggestionsTable < ActiveRecord::Migration
  def up
    create_table :suggestions do |t|
    	t.text :body, null: false
    	t.references :user

    	t.timestamps
    end
  end

  def down
  	drop_table :suggestions
  end
end

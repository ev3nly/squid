class CreateTagsAndTaggings < ActiveRecord::Migration
  def up
    create_table :tags do |t|
    	t.string :name, unique: true

    	t.timestamps
    end

    create_table :taggings do |t|
    	t.references :tag, null: false
    	t.references :taggable, null: false, polymorphic: true

    	t.timestamps
    end

    add_index :taggings, :tag_id
    add_index :taggings, [:taggable_id, :taggable_type]
  end

  def down
  	drop_table :taggings
  	drop_table :tags
  end
end

class Tagging < ActiveRecord::Base

	### ASSOCIATIONS:

	belongs_to :tag
	belongs_to :taggable, polymorphic: true

	### VALIDATIONS:

	validates_presence_of :tag_id
	validates_presence_of :taggable_id, :taggable_type

	validates_uniqueness_of :tag_id, scope: [:taggable_type, :taggable_id]

end
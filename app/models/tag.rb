class Tag < ActiveRecord::Base
	include Taggable

	# :name

	### ASSOCIATIONS:
	
	# Tagging.where(tag: self)
	has_many :tagged_taggings, class_name: "Tagging"

	### VALIDATIONS:

	validates_presence_of :name
	validates_uniqueness_of :name
	validates_length_of :name, maximum: 255

	def name=(value)
		super(value.downcase)
	end

end
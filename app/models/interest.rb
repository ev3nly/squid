class Interest < ActiveRecord::Base

	# Sean (interested) is interested in Basketball (interesting)
	# :interested_id
	# :interested_type
	# :interesting_id
	# :interesting_type
	# :casual
	# :competitive

	### ASSOCIATIONS:

	belongs_to :interested,  polymorphic: true
	belongs_to :interesting, polymorphic: true

	### VALIDATIONS:

	validates_presence_of :interested_id, :interested_type
	validates_presence_of :interesting_id, :interesting_type

	validates_uniqueness_of :interested_id, scope: [:interested_type, :interesting_id, :interesting_type]
end
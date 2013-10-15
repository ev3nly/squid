class Activity < ActiveRecord::Base

	# :name

	### ASSOCIATIONS

	has_many :interests, as: :interesting
	has_many :users, through: :interests, source: :interested, source_type: "User"

end
class AvailabilityTime < ActiveRecord::Base

	# :day
	# :period
	# :user_id

	### ASSOCIATIONS

	belongs_to :user, inverse_of: :availability_times

	### VALIDATIONS

	validates_presence_of :day, :period, :user_id
	validates_uniqueness_of :day, scope: [:period, :user_id]

end
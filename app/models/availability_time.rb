class AvailabilityTime < ActiveRecord::Base

	# :day
	# :period_of_day
	# :user_id

	### ASSOCIATIONS

	belongs_to :user, inverse_of: :availability_times

	### VALIDATIONS

	validates_presence_of :day, :period_of_day, :user_id

end
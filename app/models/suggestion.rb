class Suggestion < ActiveRecord::Base

	# :body
	# :user_id

	### ASSOCIATIONS

	belongs_to :user, inverse_of: :suggestions

	### VALIDATIONS

	validates_presence_of :body

end
class Provider < ActiveRecord::Base

	# :name, :url, :style

	### ASSOCIATIONS

	has_many :courses, inverse_of: :provider

	### VALIDATIONS

	validates_presence_of :name
	validates_presence_of :url

end
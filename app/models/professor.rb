class Professor < ActiveRecord::Base

	### ASSOCIATIONS

	has_many :teachings, inverse_of: :professor
	has_many :courses, through: :teachings

	### VALIDATIONS

	validates_presence_of :name

end
class Course < ActiveRecord::Base
	include Taggable

	# :name
	# :difficulty [:beginner, :intermediate, :advanced]
	# :price
	# :style [:structured, :"self-paced"]
	# :time_quantity
	# :time_unit [:hour, :day, :week, :month]
	# :url

	### ASSOCIATIONS

	has_many :teachings, inverse_of: :course
	has_many :professors, through: :teachings

	belongs_to :provider, inverse_of: :courses

	### VALIDATIONS

	validates_presence_of :name
	validates_presence_of :difficulty
	validates_presence_of :price
	validates_presence_of :style
	validates_presence_of :url
	validates_presence_of :provider_id

end
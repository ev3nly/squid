class Interest < ActiveRecord::Base

	# Sean (interested) is interested in Basketball (interesting)
	# :interested_id
	# :interested_type
	# :interesting_id
	# :interesting_type
	# :level

	### ASSOCIATIONS:

	belongs_to :interested,  polymorphic: true
	belongs_to :interesting, polymorphic: true

	### VALIDATIONS:

	validates_presence_of :interested_id, :interested_type
	validates_presence_of :interesting_id, :interesting_type

	validates_uniqueness_of :interested_id, scope: [:interested_type, :interesting_id, :interesting_type, :level]

	validates_presence_of :level
	validate :valid_level?

	def valid_level?
		return true if self.level == :casual or self.level == :competitive
		errors.add(:level, "must be either casual or competitive")
	end

	def level
		return self[:level].to_sym
	end

	def level=(string)
		self[:level] = string.to_s # if passed in a symbol value
	end
end
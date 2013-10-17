class Referral < ActiveRecord::Base

	# :code
	# :visits

	### VALIDATIONS

	validates_uniqueness_of :code

	### CALLBACKS

	after_initialize :initialize_visits

	def initialize_visits
		self.visits = 0 if self.visits.nil?
	end

end
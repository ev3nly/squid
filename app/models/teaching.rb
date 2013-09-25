class Teaching < ActiveRecord::Base

	### ASSOCIATIONS

	belongs_to :course, inverse_of: :teachings
	belongs_to :professor, inverse_of: :teachings

	### VALIDATIONS

	validates_presence_of :course_id
	validates_presence_of :professor_id

	validates_uniqueness_of :course_id, scope: :professor_id

end
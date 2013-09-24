module Taggable
	extend ActiveSupport::Concern

	included do
		has_many :taggings, as: :taggable
		has_many :tags, through: :taggings
	end

	module ClassMethods
	end

end
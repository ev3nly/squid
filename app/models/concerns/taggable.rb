module Taggable
	extend ActiveSupport::Concern

	included do
		has_many :taggings, as: :taggable
		has_many :tags, through: :taggings
	end

	module ClassMethods
		def tag_chain(tag)
			chain = Set.new
			chain << tag

			if not tag.tags.empty?
				tag.tags.each do |child|
					chain << child
					tag_chain(child).each { |t| chain << t }
				end
			end

			return chain
		end
	end

end
module Taggable
	extend ActiveSupport::Concern

	included do
		has_many :taggings, as: :taggable
		has_many :tags, through: :taggings
	end

	def tag_chain
		chains = self.tags.map { |tag| Tag.tag_chain(tag) }
		Set.new(chains.flatten).to_a
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

			return chain.to_a
		end
	end

end
class TagsController < ApplicationController

	def index
		@tags = Tag.all

		@chain = Set.new
		@tags.each do |tag|
			Tag.tag_chain(tag).each { |t| @chain << t }
		end
	end

end
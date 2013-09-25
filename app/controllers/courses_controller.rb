class CoursesController < ApplicationController

	# GET /search/:query
	def search
		@query = params[:query]

		@courses = [
			{ name: "#{@query} 101" },
			{ name: "#{@query} 201" },
			{ name: "#{@query} 301" },
			{ name: "#{@query} 401" }
		]
	end

	# GET /course/:name
	def show
		@course = Course.find_by(name: params[:name])
	end

end
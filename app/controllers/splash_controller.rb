class SplashController < ApplicationController

	# GET /
	def index

	end

	# GET /about
	def about
		@header_color = :blue
	end

	# GET /how-it-works
	def how_it_works
		@header_color = :blue
	end

	# GET /contact
	def contact
		@header_color = :blue
	end

end
class SplashController < ApplicationController

	# GET /
	def index
		if current_user
			if current_user.finished_signing_up?
				render template: "sign_up/sign_up_completed"
			else
				render template: "sign_up/select_sports"
			end
		else
			render template: "splash/index"
		end
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
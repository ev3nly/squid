class SplashController < ApplicationController

	# GET /
	def index
		if current_user
			if current_user.finished_signing_up?
				if current_user.is_approved?
					@events = ["soccer", "football", "football"]
					render template: "home/index"
				else
					render template: "home/waiting"
				end
			elsif !current_user.selected_sports?
				render template: "sign_up/select_sports"
			elsif !current_user.selected_times?
				render template: "sign_up/select_times"	
			end
		else
			render template: "splash/index"
		end

		if params[:referral]
			ref = Referral.where(code: params[:referral]).first_or_initialize
			ref.visits += 1
			ref.save!
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

	# GET /splash
	def splash
		render template: "splash/index"
	end

end
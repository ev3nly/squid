class UsersController < ApplicationController

	# POST /users
	def create
		render json: { hello: "world" }
	end

end
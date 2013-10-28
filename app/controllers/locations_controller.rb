class LocationsController < ApplicationController

	# GET /locations?q=
	def index
		response = HTTParty.get("http://gd.geobytes.com/AutoCompleteCity?callback=#{CGI.escape(params[:callback])}&filter=US&q=#{CGI.escape(params[:q])}")
		render text: response.body.gsub(", United States", "")
	end

end
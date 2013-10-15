class User < ActiveRecord::Base

	# :name
	# :email
	# :facebook_id
	# :facebook_token
	# :facebook_token_expires_at
	# :phone
	# :profile_picture_url

	### ASSOCIATIONS

	has_many :interests, as: :interested
	has_many :activities, through: :interests, source: :interesting, source_type: "Activity"

	### VALIDATIONS

	def self.from_omniauth(auth)
	  where(facebook_id: auth.uid).first_or_initialize.tap do |user|
	    # user.provider = auth.provider
	    user.name = auth.info.name
	    user.facebook_id = auth.uid
	    # user.facebook_token = auth.credentials.token
	    # user.facebook_token_expires_at = Time.at(auth.credentials.expires_at)
	    @oauth = Koala::Facebook::OAuth.new(ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_SECRET"])
	    extended_token_info = @oauth.exchange_access_token_info(auth.credentials.token)
	    user.facebook_token = extended_token_info["access_token"]
	    user.facebook_token_expires_at = Time.now + extended_token_info["expires"].to_i
	    user.save!
	  end
	end

	def add_interest_on_activity(activity)
		Interest.find_or_create_by!(
			interested_id: self.id,
			interested_type: self.class.to_s,
			interesting_id: activity.id,
			interesting_type: activity.class.to_s)
	end

end
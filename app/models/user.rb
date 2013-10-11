class User < ActiveRecord::Base

	# :name
	# :email
	# :facebook_id
	# :facebook_token
	# :phone
	# :profile_picture_url

	### ASSOCIATIONS

	### VALIDATIONS

	def self.from_omniauth(auth)
	  where(facebook_id: auth.uid).first_or_initialize.tap do |user|
	    # user.provider = auth.provider
	    user.name = auth.info.name
	    user.facebook_id = auth.uid
	    user.facebook_token = auth.credentials.token
	    # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    user.save!
	  end
	end

end
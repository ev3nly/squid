class User < ActiveRecord::Base

	# :name
	# :email
	# :facebook_id
	# :facebook_token
	# :facebook_token_expires_at
	# :phone
	# :profile_picture_url
	# :referral_code

	### ASSOCIATIONS

	has_many :interests, as: :interested, dependent: :destroy
	has_many :activities, through: :interests, source: :interesting, source_type: "Activity"

	has_many :suggestions, inverse_of: :user
	has_many :availability_times, inverse_of: :user, dependent: :destroy

	### VALIDATIONS

	validates_presence_of :name
	validates_presence_of :facebook_id, :facebook_token
	validates_presence_of :referral_code
	
	validates_uniqueness_of :referral_code

	### CALLBACKS

	before_validation :make_referral_code

	def self.from_omniauth(auth)
	  where(facebook_id: auth.uid).first_or_initialize.tap do |user|
	    # user.provider = auth.provider
	    user.name = auth.info.name
	    user.facebook_id = auth.uid
	    user.email = auth.info.email
	    # user.facebook_token = auth.credentials.token
	    # user.facebook_token_expires_at = Time.at(auth.credentials.expires_at)
	    @oauth = Koala::Facebook::OAuth.new(ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_SECRET"])
	    extended_token_info = @oauth.exchange_access_token_info(auth.credentials.token)
	    user.facebook_token = extended_token_info["access_token"]
	    user.facebook_token_expires_at = Time.now + extended_token_info["expires"].to_i
	    user.save!
	  end
	end

	def make_referral_code
		return if self.referral_code
		
		code = name.gsub(" ", "-").downcase

		count = User.where(name: self.name).count
		code = "#{code}-#{count + 1}" if count > 0

		self.referral_code = code
	end

	def add_interest(activity, level)
		interest = Interest.where(
			interested_id: self.id,
			interested_type: self.class.to_s,
			interesting_id: activity.id,
			interesting_type: activity.class.to_s).first_or_initialize
		interest.send :"#{level}=", true
		interest.save!
	end

	def first_name
		self.name.split(" ").first
	end

	def last_name
		self.name.split(" ").last
	end

	def phone=(value)
		return if value.nil?
		value.gsub!(/\D/, '')
    value.slice!("1") if value[0, 1] == "1"
		super(value)
	end

	def available?(day, period)
		AvailabilityTime
			.where(user_id: self.id, day: day.downcase, period: period.downcase)
			.any?
	end

	def finished_signing_up?
		selected_sports? and selected_times?
	end

	def selected_sports?
		!self.phone.blank? && !self.location.blank?
	end

	def selected_times?
		self.availability_times.count > 0
	end

end
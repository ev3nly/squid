OmniAuth.config.logger = Rails.logger
OmniAuth.config.on_failure = SplashController.action(:index)

ENV["FACEBOOK_APP_ID"] = "733657786650697"
ENV["FACEBOOK_SECRET"] = "2dac4a588734f75b6925ce654c608f8f"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_SECRET"],
  				 scope: "email,read_friendlists,user_education_history,user_interests,user_likes,user_location,user_subscriptions,user_work_history",
  				 display: "page"
end
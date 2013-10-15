OmniAuth.config.logger = Rails.logger

ENV["FACEBOOK_APP_ID"] = "733657786650697"
ENV["FACEBOOK_SECRET"] = "2dac4a588734f75b6925ce654c608f8f"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_SECRET"]
end
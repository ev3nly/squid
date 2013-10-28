if Rails.env.development?
	ENV["MIXPANEL_API_KEY"] = "3f38bcc11940014a548ed7da0197c545"
elsif Rails.env.production?
	ENV["MIXPANEL_API_KEY"] = "81e355a1263f8842ce2619bd89eb360a"
end
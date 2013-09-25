module CoursesHelper

	def uri_compliant_name(name)
		name.sub(" ", "-")
	end

end
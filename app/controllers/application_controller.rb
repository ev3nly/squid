class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_header_color, :set_title

private

	def set_header_color
		@header_color = :light # :light or :blue
	end

  def set_title
    @page_title = "Lightning"
  end

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      return nil
    end
  end
  helper_method :current_user
  
end

class SignUpController < ApplicationController 

  # GET /select-sports
  def select_sports

  end

  # POST /sign-up
  def sign_up
  	@errors = []

    if params[:email].blank?
      @errors << "Please enter a valid email address" 
    else
      @email = params[:email]
    end

  	if params[:phone].blank?
      @errors << "Please enter a 10 digit US phone number" 
    else
      @phone = params[:phone]
    end

    if params[:location].blank?
  	 @errors << "Please enter a city"
    else
      @location = params[:location]
    end

    if params[:sports].nil? or params[:sports].empty?
  	  @errors << "Please select at least 1 sport"
    else
      @sports = params[:sports]
    end

  	puts @errors

  	render template:"sign_up/select_sports" and return if @errors.count > 0

  	@user = current_user
    @user.email = @email
  	@user.phone = @phone
  	@user.location = @location
  	@user.save
    
  	@user.suggestions << Suggestion.new(body: params[:other_sports]) if !params[:other_sports].blank?

  	@sports.each do |sport_key|
  		sport = sport_key.split(":").first
  		level = sport_key.split(":").last

  		activity = Activity.find_by(short_code: sport)
  		@user.add_interest(activity, level)
  	end

  	redirect_to root_url
  end

  # GET /home
  def waiting
    
  end

  # GET /sign-up-completed
  def completed

  end

end
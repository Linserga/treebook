class ProfilesController < ApplicationController
  
  before_action :authenticate_user!

  def show
  	@user = User.find_by_profile_name(params[:profile_name])
  	if @user == current_user
  		@statuses = @user.statuses
  		render action: :show
  	else
  		render file: 'public/404', status: 404, formats: [:html]
  	end
  end
end

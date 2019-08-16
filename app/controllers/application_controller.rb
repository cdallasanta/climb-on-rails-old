class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # Helpers

  # The following are defined by Devise:
  # current_user
  # authenticate_user!
  # user_signed_in?
  # user_session

  def current_site
    current_user.site
  end

  #  TODO remove this with FB signup
  # This is the way around requiring a site and role for a user, but allowing
  # a signup via facebook, which doesn't specify that at creation.
  def check_user_data_complete
    if current_user.role == nil ||  current_user.site == nil
      flash[:alert] = "Please complete your profile details"
      redirect_to edit_user_path(current_user)
    end
  end
end

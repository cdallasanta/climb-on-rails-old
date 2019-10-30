class ApplicationController < ActionController::Base

  # Helpers

  # The following are defined by Devise:
  # user_signed_in?
  # current_user
  # user_session
  # destroy_user_session_path (Logout)
  # new_user_session_path (Login)
  # edit_user_registration_path (Edit registration)
  # new_user_registration_path (Register new user)

  def current_site
    current_user.site
  end

  def authenticate_admin_user
    if !user_signed_in?
      redirect_to new_user_session_path
    elsif !current_user.is_admin?
      redirect_to root_path
    end
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

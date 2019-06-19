class ApplicationController < ActionController::Base
  before_action :check_logged_in

  def logged_in?
    !!session[:user_id]
  end

  def check_logged_in
    if logged_in?
      check_user_data_complete
    else
      redirect_to '/login'
    end
  end

  def current_user
    if logged_in?
      User.find_by(id: session[:user_id])
    end
  end

  def current_site
    current_user.site
  end

  def check_user_data_complete
    if current_user.role == nil ||  current_user.site == nil
      flash[:alert] = "Please complete your profile details"
      redirect_to edit_user_path(current_user)
    end
  end
end

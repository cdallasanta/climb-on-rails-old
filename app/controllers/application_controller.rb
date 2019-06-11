class ApplicationController < ActionController::Base
  def logged_in?
    !!session[:user_id]
  end

  def check_logged_in
    unless logged_in?
      redirect_to '/login'
    end
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def current_site
    current_user.site
  end

  #TODO is this used yet?
  def check_owner(object)
    unless object.user == current_user || current_user.is_admin?
      flash[:alert] = "You must be logged in as that item's creator to view/edit it"
      redirect_to root_path
    end
  end
end

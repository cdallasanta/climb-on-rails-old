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
end

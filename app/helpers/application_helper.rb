module ApplicationHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    if logged_in?
      User.find(session[:user_id])
    end
  end

  def current_site
    current_user.site
  end
end

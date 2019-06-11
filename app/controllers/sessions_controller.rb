class SessionsController < ApplicationController
  def new
    render 'login'
  end

  def create
    user_params = params[:user]
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to site_elements_path(current_site)
    else
      render 'login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end

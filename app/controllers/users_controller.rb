class UsersController < ApplicationController
  def new
    render 'login'
  end

  def create
    user_params = params[:user]
    user = User.find_by(email: user_params[:email])
    # binding.pry
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      render 'login'
    end
  end
end

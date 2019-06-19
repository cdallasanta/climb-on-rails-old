class SessionsController < ApplicationController
  def new
    render :login
  end

  # directed here from /login or from facebook
  def create
    #if directed from facebook:
    if request.env["REQUEST_PATH"] == "/auth/facebook/callback"
      info = request.env["omniauth.auth"][:info]
      user = User.find_or_create_by(fullname:info[:name], email: info[:email])
      # if they were just created, they have no password, so are invalid
      if user.password == nil
        user.password = SecureRandom.hex(13)
        user.save
      end
      session[:user_id] = user.id
      redirect_to root_path
    #otherwise, they are signing in normally
    else
      user_params = params[:user]
      user = User.find_by(email: user_params[:email])
      if user && user.authenticate(user_params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
        render :login
      end
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end

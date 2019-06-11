class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = user.id
      redirect_to site_elements_path(current_site)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:fullname, :email, :password, :site_id, :role)
  end
end

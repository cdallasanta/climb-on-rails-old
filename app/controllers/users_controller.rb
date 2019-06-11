class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    binding.pry
    @user = User.find_by(id: params[:id])
    check_owner_of_user(@user)
  end

  def edit
    @user = User.find_by(id: params[:id])
    check_owner_of_user(@user)
  end

  def update
    @user = params[:user_id]
    check_owner_of_user(@user)
    binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:fullname, :email, :password, :site_id, :role)
  end

  def check_owner_of_user(user)
    if user != current_user
      flash[:alert] = "You must be logged in as that user to view their page"
      redirect_to root_path
    end
  end
end

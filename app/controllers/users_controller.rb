class UsersController < ApplicationController
  before_action :check_owner_of_user, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
    params[:user][:password] ||= @user.password
    
    if @user.update(user_params)
      #TODO "saved successfully message?"
      redirect_to user_path(@user)
    else
      render edit_user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:fullname, :email, :password, :site_id, :role)
  end

  def check_owner_of_user
    @user = User.find_by(id: params[:id])

    if @user != current_user
      flash[:alert] = "You must be logged in as that user to view their page"
      redirect_to root_path
    end
  end
end

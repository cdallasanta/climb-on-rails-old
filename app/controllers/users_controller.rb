class UsersController < ApplicationController
  before_action :check_owner_of_user, only: [:show, :edit, :update]
  skip_before_action :check_logged_in, except: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    # @user is set in the before_action, #check_owner_of_user
  end

  def edit
    # @user is set in the before_action, #check_owner_of_user
  end

  def update
    # if they left the password field blank, don't change their password
    params[:user][:password] ||= @user.password

    if @user.update(user_params)
      check_user_data_complete # found in application_controller.rb
      flash[:alert] = "Details saved successfully"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:fullname, :email, :password, :site_id, :role)
  end

  def check_owner_of_user
    @user = User.find_by(id: params[:id])

    unless @user == current_user || current_user.is_admin?
      flash[:alert] = "You must be logged in as that user to view their page"
      redirect_to root_path
    end
  end
end

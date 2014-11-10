class RegistrationsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for registering!"
      redirect_to dashboard_path(@user)
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :bio, :frequency, :avatar)
  end
end
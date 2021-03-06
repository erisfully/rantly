class RegistrationsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      Keen.publish(:signups, {username: @user.username, date: @user.created_at}) if Rails.env.production?
      UserMailer.registration_email(@user).deliver
      UserMailer.confirmation_email(@user).deliver
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for registering! Please confirm your email to sign in!"
      redirect_to signin_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :bio, :frequency, :avatar, :email)
  end
end
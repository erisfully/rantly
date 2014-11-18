class SessionsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password]) && !@user.disabled && @user.confirmed
      Keen.publish(:logins, {username: @user.username, date: Time.now}) if Rails.env.production?
      session[:user_id] = @user.id
      if current_user.admin
        redirect_to admin_dashboard_path
      else
        redirect_to dashboard_path(session[:user_id])
      end
    elsif @user && @user.authenticate(params[:user][:password]) && @user.disabled
      flash[:notice] = "Your account has been disabled"
      redirect_to signin_path
    elsif @user && @user.authenticate(params[:user][:password]) && !@user.confirmed
      flash[:notice] = "Please confirm your email"
      redirect_to signin_path

    else
      flash[:notice] = "Login Failed"
      redirect_to signin_path
    end
  end

  def destroy
    session.destroy
    redirect_to welcome_path
  end

end
class SessionsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path(session[:user_id])
    else
      @user = User.new(username: params[:user][:username])
      @user.errors[:base] << "Username / password is invalid"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to welcome_path
  end

end
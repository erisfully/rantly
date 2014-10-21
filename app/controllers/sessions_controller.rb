class SessionsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_path(session[:user_id])
    else
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to welcome_path
  end

end
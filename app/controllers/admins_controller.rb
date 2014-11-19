class AdminsController < ApplicationController
  before_action :ensure_admin

  def dashboard
  end

  def rants
    @rants = filtered(Rant.order(:created_at))
  end

  def users
    if params[:sort] == 'ASC'
      @users = User.where(admin: false).sort_by { |user| user.rants.count }.reverse
    elsif params[:sort] == 'DESC'
      @users = User.where(admin: false).sort_by { |user| user.rants.count }
    else
      @users = User.where(admin: false)
    end
  end

  def spam
    @rants = filtered(Rant.where(spam: 't').order(:created_at))
  end

  def disable
    @user = User.find(params[:id])
    @user.update_attribute(:disabled, true)
    redirect_to :back
  end

  def enable
    @user = User.find(params[:id])
    @user.update_attribute(:disabled, false)
    redirect_to :back
  end

  def impersonate
    session[:admin_id] = current_user.id
    session[:user_id] = params[:id]
    redirect_to dashboard_path(session[:user_id])
  end

  def unimpersonate
    session[:user_id] = session[:admin_id]
    session.delete(:admin_id)
    redirect_to admin_users_path
  end

  private

  def ensure_admin
    unless current_user.admin || session[:admin_id]
      redirect_to root_path
    end
  end

  def filtered(rants)
    start_date = params[:starts_on]
    end_date = params[:ends_on]
    if start_date == nil && end_date == nil
     rants
    elsif end_date == ""
      rants.where('created_at < ?', start_date)
    elsif start_date == ""
      rants.where('created_at > ?', end_date)
    else
        rants.where(:created_at => start_date..end_date)
    end
  end

end
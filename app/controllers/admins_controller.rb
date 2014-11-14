class AdminsController < ApplicationController
  before_action :ensure_admin

  def dashboard
  end

  def rants
    @rants = Rant.all.order(:created_at)
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

  private

  def ensure_admin
    unless current_user.admin
      redirect_to root_path
    end
  end
end
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

  private

  def ensure_admin
    unless current_user.admin
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
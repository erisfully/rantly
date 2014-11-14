class AdminsController < ApplicationController
  before_action :ensure_admin

  def dashboard
  end

  def rants
    @rants = Rant.all.order(:created_at)
  end

  def users
    @users = User.all
  end

  private

  def ensure_admin
    unless current_user.admin
      redirect_to root_path
    end
  end
end
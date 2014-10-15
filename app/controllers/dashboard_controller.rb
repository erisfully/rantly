class DashboardController < ApplicationController


  def show
    @user = User.find(session[:user_id])
    @rants = Rant.new
  end

end
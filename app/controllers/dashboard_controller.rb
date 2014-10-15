class DashboardController < ApplicationController


  def show
    @user = User.find(session[:user_id])
    @rant = Rant.new
    @rants = Rant.all
  end

end
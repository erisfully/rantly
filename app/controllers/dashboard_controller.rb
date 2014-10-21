class DashboardController < ApplicationController

  def show
    @user = User.find(session[:user_id])
    @rant = Rant.new
    @rants = Rant.all
    @follow = Follow.all
  end

end
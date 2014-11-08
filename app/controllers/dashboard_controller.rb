class DashboardController < ApplicationController

  def show
    @user = User.find(session[:user_id])
    @rant = Rant.new
    @rants = Rant.order('id DESC')
    @follow = Follow.all
    @favorite = Favorite.all
    @mentions = Rant.mentions(current_user)
  end

end
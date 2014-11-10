class SearchController < ApplicationController
  def index
    @rant = Rant.new
    @user = User.find(current_user.id)
    if params[:search]
      @search_results = Rant.search(params[:search])
    end
    @follow = Follow.all
    @favorite = Favorite.all
  end

end
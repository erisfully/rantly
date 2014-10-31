class FavoritesController < ApplicationController

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.create(user_id: params[:user_id], rant_id: params[:rant_id])
    if @favorite.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

end
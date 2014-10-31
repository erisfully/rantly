class FavoritesController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @rant = Rant.new
    @follow = Follow.new
  end

  def show
    @favorite = Favorite.find(id: params[:id])
  end

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

  def destroy
    @favorite = Favorite.find_by_rant_id(params[:rant_id])
    @favorite.destroy
    redirect_to :back
  end

end
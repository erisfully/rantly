class FollowsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @rant = Rant.new
    @follows = Follow.where(follower_id: current_user.id)
  end

  def new
    @follow = Follow.new
  end

  def create
    @follow = Follow.create(follower_id: current_user.id, followee_id: params[:id])
    if @follow.save
      redirect_to :back
    else
      render dashboard_path(params[:user_id])
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @follow = Follow.find_by_follower_id(current_user.id)
    @user.follows.destroy(@follow)
    redirect_to :back
  end

  private

  def follow_params
    params.require(:follow).permit({follower_id: current_user.id}, {followee_id: params[:user_id]})
  end

end
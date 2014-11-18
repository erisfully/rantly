class RantsController < ApplicationController

  def show
    @user = User.find(session[:user_id])
    @specific_rant = Rant.find(params[:id])
    @rant = Rant.new
    @favorites = Favorite.all
    @comment = Comment.new
    @commentable = Rant.find(params[:id])
  end

  def new
    @user = User.find(params[:id])
    @rant = Rant.new
  end

  def create
    @user = User.find(params[:user_id])
    @rant = Rant.create(rant_params)
    if @rant.save
      UserMailer.follower_email(current_user, @rant).deliver
      redirect_to dashboard_path(@user)
    else
      flash[:errors] = @rant.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    redirect_to :back
  end

  def spam
    @rant = Rant.find(params[:rant_id]).update!(spam: true)
    redirect_to :back
  end

  def unspam
    @rant = Rant.find(params[:rant_id]).update!(spam: false)
    redirect_to :back
  end

  private

  def rant_params
    params.require(:rant).permit(:topic, :rant).merge({user_id: @user.id})
  end

end
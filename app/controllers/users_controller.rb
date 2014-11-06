class UsersController < ApplicationController
  def index
  end

  def show
    @specific_user = User.find(params[:id])
    @user = User.find(current_user.id)
    @rant = Rant.new
    @specific_rants = Rant.order('favorites_count DESC')
    @follow = Follow.all
    @favorite = Favorite.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to dashboard_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :bio, :frequency)
  end
end
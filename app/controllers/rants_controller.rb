class RantsController < ApplicationController


  def new
    @user = User.find(params[:id])
    @rant = Rant.new
  end

  def create
    @user = User.find(params[:user_id])
    @rant = Rant.create(rant_params)
    if @rant.save
      redirect_to dashboard_path(@user)
    else
      redirect_to dashboard_path(@user)
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    redirect_to :back
  end

  private

  def rant_params
    params.require(:rant).permit(:topic, :rant).merge({user_id: @user.id})
  end

end
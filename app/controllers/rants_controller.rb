class RantsController < ApplicationController


  def new
    @user = User.find(params[:id])
    @rant = Rant.new
  end

  def create
    @user = User.find(params[:id])
    @rant = Rant.create(rant_params)
    if @rant.save
      redirect_to dashboard_path(@user)
    else
      redirect_to dashboard_path(@user)
    end
  end


  private

  def rant_params
    params.require(:rant).permit(:topic, :rant).merge({user_id: @user.id})
  end

end
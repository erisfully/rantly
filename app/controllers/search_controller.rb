class SearchController <  ApplicationController
  def index
    @rant = Rant.new
    @user = User.find(current_user.id)
    @users_results = User.find_by_first_name(params[:search])
  end

end
class SearchController <  ApplicationController
  def show
    @rant = Rant.new
    @user = User.find(current_user.id)
  end
end
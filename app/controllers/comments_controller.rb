class CommentsController < ApplicationController

  def create
    @comment = Comment.create(user_id: params[:user_id], rant_id: params[:rant_id], comment: params[:comment][:comment])
    redirect_to :back
  end
end
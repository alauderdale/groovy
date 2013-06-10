class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
    #If save succeeds return to list action
      redirect_to @comment.shot, :notice => "Comment Created"
    #if form fails, redisplay form so user can fix problems
    else
      redirect_to shots_path, :notice => "No"
    end
  end
end

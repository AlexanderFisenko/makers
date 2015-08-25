class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    if @comment.valid?
      redirect_to request.referrer, notice: 'You have added a new comment!'
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :authorable_type, :authorable_id, :commentable_type, :commentable_id)
  end
end

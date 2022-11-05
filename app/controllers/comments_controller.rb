class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = @post
    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @comment = Comment.new
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
class CommentsController < ApplicationController
  before_action :set_user, only: [:create]

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

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end

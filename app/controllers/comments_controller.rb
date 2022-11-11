class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @post = Post.find(params[:post_id])
    # @post = Post.includes(:author, comments: [:author]).find(params[:post_id])
    # @post = Post.includes(:author, comments: %i[author post]).find(params[:post_id])

    @comment.post = @post
    if @comment.save
      redirect_to user_posts_path(@post.author_id, @post.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    redirect_to user_post_path(@post.author, @post)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end

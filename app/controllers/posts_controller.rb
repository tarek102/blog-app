class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.includes(comments: [:author]).find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(current_user, @post), notice: 'Post deleted successfully'
  end

  def create
    # @post = Post.new(post_params)
    # @post = Post.new(title: post_params[:title], text: post_params[:text], author: current_user)
    # @post.author = current_user
    new_post = current_user.posts.new(post_params)
    new_post.likes_counter = 0
    new_post.comments_counter = 0

    if new_post.save
      redirect_to user_posts_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

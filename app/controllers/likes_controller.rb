class LikesController < ApplicationController
  def create
    @like = Like.new
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @like.author = current_user
    @like.post = @post
    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: @user)
    @comments = Comment.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comments = Comment.all
  end
end

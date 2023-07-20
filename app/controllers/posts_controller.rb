class PostsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(params[:user_id])
    @posts = Post.where(author: @user)
    @comments = Comment.all
  end

  def show
    @users = User.all
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.all
  end
end

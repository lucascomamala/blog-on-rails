class Api::V1::PostsController < Api::V1::ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    render json: @posts, status: 200
  end

  def show
    @post = Post.where(id: params[:id])
    render json: @post, status: 200
  end
end

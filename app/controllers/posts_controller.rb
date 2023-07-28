class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
    @user = User.find(params[:user_id])
    @posts = Post.includes([:author]).includes([:comments]).where(author: @user).order(updated_at: :desc)
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    @users = User.all
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.all
    @new_comment = Comment.new
    @like = Like.new
  end

  def new
    @new_post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to user_path(current_user.id), notice: 'You created a post!'
    else
      redirect_to root_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to user_path(@post.author), notice: 'You deleted a post!'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :author)
  end
end

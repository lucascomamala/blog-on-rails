class Api::V1::CommentsController < Api::V1::ApplicationController
  def index
    @comments = Post.find(params[:post_id]).comments
    render json: @comments, status: 200
  end

  def create
    post = Post.find(params[:post_id])
    @comment = Comment.new(text: comment_params, user: User.find(1), post:)
    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment)
  end
end

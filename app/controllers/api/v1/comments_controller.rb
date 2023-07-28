class Api::V1::CommentsController < Api::V1::ApplicationController
  before_action :check_auth, only: [:create]

  def index
    @comments = Post.find(params[:post_id]).comments
    render json: @comments, status: 200
  end

  def create
    post = Post.find(params[:post_id])
    @comment = Comment.new(text: comment_params, user: current_user, post:)
    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors }, status: :unprocessable_entity
    end
  end

  private

  def check_auth
    authenticate_or_request_with_http_basic do |username, password|
      resource = User.find_by_email(username)
      sign_in :user, resource if resource.valid_password?(password)
    end
  end

  def comment_params
    params.require(:comment)
  end
end

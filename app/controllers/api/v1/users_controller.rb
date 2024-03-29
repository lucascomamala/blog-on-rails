class Api::V1::UsersController < Api::V1::ApplicationController
  def index
    @users = User.all.order(created_at: :asc)
    render json: @users, status: 200
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: 200
  end
end

class LikesController < ApplicationController
  def create
    @like = Like.new(author: @current_user, post: Post.find(params[:post_id]))

    @like.save
    redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
  end
end

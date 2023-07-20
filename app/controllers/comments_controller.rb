class CommentsController < ApplicationController
  def create
    @comment = Comment.new(text: params.require(:comment).permit(:text)[:text], user: @current_user, post: Post.find(params[:post_id]))

    if @comment.save
      flash[:success] = "Comment created successfully"
      redirect_to  '/users/'+params[:user_id].to_s+'/posts/'+params[:post_id].to_s
    else
      render :new
    end
  end
end

class CommentsController < ApplicationController
  def create
    @comment = Comment.new(content: params.require(:comment).permit(:content)[:content], user: @current_user,
                           post: Post.find(params[:post_id]))

    if @comment.save
      flash[:success] = 'Comment created successfully'
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
    else
      render :new
    end
  end
end

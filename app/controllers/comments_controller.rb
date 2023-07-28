class CommentsController < ApplicationController
  load_and_authorize_resource
  
  def create
    @comment = Comment.new(text: params.require(:comment).permit(:text)[:text], user: current_user,
                           post: Post.find(params[:post_id]))

    if @comment.save
      flash[:success] = 'Comment created successfully'
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    redirect_to user_post_path(@comment.post.author, @comment.post), notice: 'You deleted a comment!'
  end
end

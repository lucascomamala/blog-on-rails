class CommentsController < ApplicationController
  def index
    @comments = Comment.includes([:post]).where(post: Post.find(params[:post_id])).order(created_at: :desc)
    render json: @comments
  end

  def create
    @comment = Comment.new(text: params.require(:comment).permit(:text)[:text], user: current_user,
                           post: Post.find(params[:post_id]))

    if @comment.save
      
      
      respond_to do |format|
        format.html do
          flash[:success] = 'Comment created successfully'
          redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
        end
          format.json { render json: @comments }
      end
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

class CommentsController < ApplicationController
  before_action :set_user_post
  load_and_authorize_resource :post
  load_and_authorize_resource :comment, through: :post
  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.author = current_user

    if @comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_to user_post_path(@post.author, @post)
    else
      # error message
      flash.now[:error] = 'Error: Comment could not be saved'
      # render new
      render :new
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment

    if @comment.destroy
      flash[:success] = 'Comment deleted successfully'
    else
      flash[:error] = 'Error: Comment could not be deleted'
    end
    redirect_to user_post_path(@user, @post)
  end
  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_user_post
    @user = current_user
    @post = Post.find(params[:post_id])
  end
end

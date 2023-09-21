class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_user
  def index
    @posts = @user.posts.includes(:comments, :likes, comments: :author)
  end

  def show
    @post = @user.posts.includes(:comments, :likes, comments: :author).find(params[:id])
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved successfully'
          redirect_to user_posts_path(current_user)
        else
          # error message
          flash.now[:error] = 'Error: Post could not be saved'
          # render new
          format.html { render :new, locals: { post: @post } }
        end
      end
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.comments.destroy_all
    @post.likes.destroy_all
    if @post.destroy
      flash[:success] = 'Post deleted successfully'
    else
      flash[:error] = 'Error: Post could not be deleted'
    end

    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end

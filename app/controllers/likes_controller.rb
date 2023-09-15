class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(author: current_user)

    if @like.save
      flash[:success] = 'Like added successfully'
    else
      flash[:error] = 'Error: Like could not be added'
    end

    redirect_to user_post_path(@post.author, @post)
  end
end

class CommentsController < ApplicationController
    before_action :set_user
    def new
        @comment = Comment.new
      end
      def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        @comment.author = current_user

            if @comment.save
              flash[:success] = "Comment saved successfully"
              redirect_to user_post_path(@post.author, @post)
            else
              # error message
              flash.now[:error] = "Error: Comment could not be saved"
              # render new
              render :new
            end
      end
      private
      
      def comment_params
        params.require(:comment).permit(:text)
      end
      def set_user
        @user = current_user
        @post = Post.find(params[:post_id])
      end

end
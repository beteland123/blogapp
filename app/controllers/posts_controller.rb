class PostsController < ApplicationController
    def index
        @posts = User.find(params[:id])
      end
    
      def show
        @Post = Post.find(params[:id])
      end

end
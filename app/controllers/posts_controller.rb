class PostsController < ApplicationController
    def add_index 
        @posts = Post.all
    end

    def show 
    @post = Post.find(params[:id])
    end

    def new 
        @post = Post.new
    end

    def create 
       @post = Post.new(post_params) 
       if @post.save 
        redirect_to @post
       else
        redirect_to @post.new
    end

    def edit 

        @post = Post.find(params[:id])
    end

    def update 
        @post = Post.find(params[:id])
        @post.update(post_params)
    end
    
    def destroy 
        @post = Post.find(params[:id])
        @post.destroy

    end

    private
    def post_params 
        params.require(:post).permit(:description, :location, :user_id)
    end
end

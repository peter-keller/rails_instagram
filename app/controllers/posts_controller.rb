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
       @post = Post.new(description: params[:post][:description], location: params[:post][:location], user_id: current_user.id)
       @post.picture.attach(params[:post][:picture])
       if @post.save 
        redirect_to @post
       else
        render :new
       end
    end

    def edit 
        @post = Post.find(params[:id])
    end

    def update 
        @post = Post.find(params[:id])
        @post.update(post_params)
        if @post.save
            redirect_to post_path(@post)
        else
            render :edit
        end
    end
    
    def destroy 
        Post.find(params[:id]).destroy
    end

    private
    def post_params 
        params.require(:post).permit(:description, :location, :user_id, :picture)
    end

end

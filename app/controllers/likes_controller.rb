class LikesController < ApplicationController
    def index 
        @likes = Like.all
    end

    def show 
        @like = Like.find(params[:id])
    end

    def new 
        @like = Like.new
    end

    def create 
        @like = Like.new(user_id: user_id, post_id: post_id)
        @like.save
    end

    def edit 
        @like = Like.find(params[:id])
    end

    def update 
        @like = Like.find(params[:id])
        @like.update(like_params)

        redirect_to like_path(@like)
    end

    def delete 
        @like= Like.find(params[:id])
        @like.destroy
    end

    def like_params
        params.require(:like).permit(:user_id, post_id)
    end
         
         
end

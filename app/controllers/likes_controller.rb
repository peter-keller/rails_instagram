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
        @like = Like.new(message: params[:message])
        @like.save 

        redirect_to @like
    end

    def edit 
        @like = Like.find(params[:id])
    end

    def update 
        @like = Like.find(params[:id])
        @like.update(like_params)
    end

    def destroy 
        Like.find(params[:id]).destroy
    end

    private
    def like_params 
        params.require(:like).permit(:message, :user_id, :post_id)
    end

end

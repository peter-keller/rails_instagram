class LikesController < ApplicationController
    skip_before_action :verify_authenticity_token

    
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
        @like = Like.new(user_id: current_user.id, post_id: params[:post_id])
        if @like.save
            render :json => {:status => "ok"}
        end
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

    private

    def like_params
        params.require(:like).permit(:user_id, post_id)
    end
         
         
end

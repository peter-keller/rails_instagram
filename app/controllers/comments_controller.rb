class CommentsController < ApplicationController
    def index 
        @comments = Comment.all
    end

    def show 
        @comment = Comment.find(params[:id])
    end

    def new 
        @comment = Comment.new
    end

    def create
        @post = Post.find(params[:post_id].keys.first.to_i)
        @comment = Comment.new({user_id: current_user.id, post_id: params[:post_id].keys.first.to_i, message: params[:message]})
        if @comment.save
            redirect_to user_path(@post.user)
        end
    end

    # def delete 
    #     @comment = Comment.find(params[:id])
    #     @comment.destroy(comment_params)
    # end

    private
    def comment_params 
        params.require(:comment).permit(:message, :user_id, :post_id)
    end
end

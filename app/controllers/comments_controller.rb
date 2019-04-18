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
        @comment = Comment.new(message: params[:message])
        @comment.save

        redirect_to comment_path(@comment)
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

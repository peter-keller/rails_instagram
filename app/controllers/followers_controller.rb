class FollowersController < ApplicationController

    def index
        @followers = Follower.all
    end

    def show
        @follower = Follower.find(params[:id])
    end

    def new
        @follower = Follower.new
    end


    def create
        @follower = Follower.new({follower_id: current_user.id, followee_id: params[:id]})
        if @follower.save
            redirect_to user_path(@follower.followee)
        end            
    end

    def destroy
        Follower.find_by({follower_id: current_user.id, followee_id: params[:id]}).destroy
        redirect_to user_path(params[:id])
    end

    private

    def follower_params
    end
end
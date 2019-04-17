class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

      if @user.save
        redirect_to user_path(@user)
      else
        render :new
    end
  end

  def update
    if params[:user][:avatar]
      @user.avatar.attach(params[:user][:avatar])
    end
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end




  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :full_name, :user_name, :user_bio, :avatar, :phone_number, :website, :gender)
    end
end

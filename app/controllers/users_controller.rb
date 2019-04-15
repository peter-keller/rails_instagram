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
    @user.avatar.attach(params[:user][:avatar])
    
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
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :full_name, :user_name, :user_bio, :avatar, :phone_number, :website, :gender)
    end
end

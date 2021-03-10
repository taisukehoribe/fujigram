class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.all
    @photo = Photo.new
  end

  def show
    @user = User.find(params[:id])
    @photo = Photo.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end

class PhotosController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @photo = Photo.new
    @photos = Photo.all
  end

  def create
    @user = current_user
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to photo_path(@photo.id)
    else
      @photos = Photo.all
      render "index"
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @photo_comment = PhotoComment.new
    @user = User.find(@photo.user_id)
  end

  def edit
    @photo = Photo.find(params[:id])
    if @photo.user_id != current_user.id
      redirect_to photo_path
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to photo_path(@photo)
    else
      render "edit"
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :body, :photo_image)
  end
end

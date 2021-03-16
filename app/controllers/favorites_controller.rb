class FavoritesController < ApplicationController

  def create
    current_user.favorites.create(photo_id: params[:photo_id])
    # photo = Photo.find(params[:photo_id])
    # favorite = current_user.favorites.new(photo_id: @photo.id)
    # favorite.save
    redirect_to request.referer
  end

  def destroy
    current_user.favorites.find_by(photo_id: params[:photo_id]).destroy
    # photo = Photo.find(params[:photo_id])
    # favorite = current_user.favorites.find_by(photo_id: @photo.id)
    # favorite.destroy
    redirect_to request.referer
  end
end

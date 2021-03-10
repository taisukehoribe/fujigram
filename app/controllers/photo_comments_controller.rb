class PhotoCommentsController < ApplicationController

  def create
    # 写真のデータを取得
    @photo = Photo.find(params[:photo_id])
    @comment = current_user.photo_comments.new(photo_comments_params)
    @comment.photo_id = @photo.id
    @comment.save
    redirect_to photo_path(@photo.id)
  end

  def destroy
    # PhotoComments.find_by(id: params[:id], photo__id: params[:photo_id]).destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy
    redirect_to photo_path(params[:photo_id])
  end

  private

  def photo_comments_params
    params.require(:photo_comment).permit(:comment)
  end
end

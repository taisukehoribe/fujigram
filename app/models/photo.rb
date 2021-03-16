class Photo < ApplicationRecord
  belongs_to :user

  attachment :photo_image

  has_many :favorites, dependent: :destroy
  has_many :photo_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :title, presence: true
  validates :body, presence: true
  validates :photo_image, presence: true
  validates :body, length: { maximum: 200}
end

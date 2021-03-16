
class User < ApplicationRecord

  attachment :profile_image

  has_many :photos, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :photo_comments, dependent: :destroy

  validates :name, presence: true, length: {minimum:2, maximum: 20}
  validates :introduction, length: { maximum: 50}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

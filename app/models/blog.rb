class Blog < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
    validates :title, length: {minimum:1}
    validates :title, length: {maximum:140}
    validates :content, length: {minimum:1}
    validates :content, length: {maximum:140}
  mount_uploader :image, ImageUploader
end

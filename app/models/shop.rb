class Shop < ApplicationRecord
  include StringNormalize
	validates :name,presence: true
  validates :url, presence: true, uniqueness: true

  has_many :beans, dependent: :destroy
  accepts_nested_attributes_for :beans, allow_destroy: true

	has_many :shop_likes, dependent: :destroy
	has_many :shop_liked_users, through: :shop_likes, source: :user
  mount_uploader :shop_image, ImageUploader
end

class Recipe < ApplicationRecord
	include StringNormalize
	belongs_to :user
  belongs_to :bean
  has_many :recipe_likes, dependent: :destroy

  has_one :taste, dependent: :destroy
	accepts_nested_attributes_for :taste

	mount_uploader :r_image, ImageUploader
end

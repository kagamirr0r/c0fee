class Shop < ApplicationRecord
	include StringNormalize

	validates :url, presence: true, uniqueness: true

	has_many :beans, dependent: :destroy
	accepts_nested_attributes_for :beans, allow_destroy: true

	mount_uploader :shop_image, ImageUploader
end

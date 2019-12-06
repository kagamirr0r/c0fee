class Recipe < ApplicationRecord
	include StringNormalize
	validates :hot_ice, presence: true
	validates :amount, length:{minimum:1, maximum:3}

  belongs_to :bean
  belongs_to :user

  has_one :taste, dependent: :destroy
  accepts_nested_attributes_for :taste

  has_many :recipe_likes, dependent: :destroy
  has_many :recipe_liked_users, through: :recipe_likes, source: :recipe

  mount_uploader :recipe_image, ImageUploader
end

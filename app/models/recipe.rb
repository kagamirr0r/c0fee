class Recipe < ApplicationRecord
  include StringNormalize

  belongs_to :bean
  belongs_to :user

  has_one :taste, dependent: :destroy
  accepts_nested_attributes_for :taste

  has_many :recipe_likes, dependent: :destroy
  has_many :recipe_liked_users, through: :recipe_likes, source: :recipe

  mount_uploader :recipe_image, ImageUploader
end

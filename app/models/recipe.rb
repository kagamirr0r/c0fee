class Recipe < ApplicationRecord
  include StringNormalize
  validates :hot_ice, presence: true
  validates :amount, length: { minimum: 1, maximum: 3 }

  belongs_to :bean
  belongs_to :user

  has_one :taste, dependent: :destroy
  accepts_nested_attributes_for :taste

  has_many :recipe_likes, dependent: :destroy
  has_many :recipe_liked_users, through: :recipe_likes, source: :recipe

  scope :search_recipe, ->(recipe_search_params) do
    joins(:taste)
      .search_hot_ice(recipe_search_params[:hot_ice])
      .search_extraction(recipe_search_params[:extraction])
      .merge(Taste.search_taste(recipe_search_params))
  end

  scope :search_hot_ice, ->(hot_ice) { where('hot_ice LIKE ?', hot_ice.to_s) if hot_ice.present? }
  scope :search_extraction, ->(extraction) { where('extraction LIKE ?', extraction.to_s) if extraction.present? }
  mount_uploader :recipe_image, ImageUploader
end

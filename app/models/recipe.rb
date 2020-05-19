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

	enum hot_ice: [:ホット, :アイス]
	enum grind: { 粗挽き: 0, 中挽き: 1, 中細挽き: 2, 細挽き: 3, 極細挽き: 4 }
	enum extraction: { ペーパーフィルター: 0, ネル: 1, 金属フィルター: 2, フレンチプレス: 3, ユーロプレス: 4, サイフォン: 5, コーヒーメーカー: 6, マキネッタ: 7, エスプレッソマシン: 8, 水出し: 9, 急冷: 10 }

  scope :search_recipe, ->(recipe_search_params) do
    joins(:taste)
      .search_hot_ice(recipe_search_params[:hot_ice])
      .search_extraction(recipe_search_params[:extraction])
      .merge(Taste.search_taste(recipe_search_params))
  end

  scope :search_hot_ice, ->(hot_ice) { where(hot_ice: hot_ice) if hot_ice.present? }
  scope :search_extraction, ->(extraction) { where(extraction: extraction) if extraction.present? }
  mount_uploader :recipe_image, ImageUploader
end

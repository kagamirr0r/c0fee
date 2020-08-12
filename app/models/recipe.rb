class Recipe < ApplicationRecord
  include StringNormalize

  default_scope -> { order(created_at: :desc) }

  validates :hot_ice, presence: true
	validates :amount, numericality: {less_than: 999}
	validates :extracted_amount, numericality: { less_than: 999,allow_nil: true }

  belongs_to :bean
  belongs_to :user

  has_one :taste, dependent: :destroy
  accepts_nested_attributes_for :taste

  has_many :recipe_likes, dependent: :destroy
  has_many :recipe_liked_users, through: :recipe_likes, source: :recipe

  enum hot_ice: [:hot, :ice]
  enum grind: { coarse: 0, medium_coarse: 1, medium: 2, medium_fine: 3, fine: 4, turkish: 5 }
  enum extraction: { paper_filter: 0, cloth_filter: 1, metal_filter: 2, french_press: 3, aero_press: 4,
                     siphon: 5, coffee_maker: 6, macchinetta: 7, espresso_machine: 8, cold_brew: 9, iced: 10 }

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

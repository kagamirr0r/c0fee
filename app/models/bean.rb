class Bean < ApplicationRecord
	include StringNormalize

	validates :country, presence: true
	translates :country, :area, :variety, :farm

  belongs_to :user
  belongs_to :shop

  has_one :impression, dependent: :destroy
  accepts_nested_attributes_for :impression

  has_many :recipes, dependent: :destroy

  has_many :bean_likes, dependent: :destroy
  has_many :bean_liked_users, through: :bean_likes, source: :user, dependent: :destroy

  enum process: { washed: 0, natural: 1, pulped_natural: 2, white_honey: 3, yellow_honey: 4, red_honey: 5, black_honey: 6, sumatera: 7 }
  enum roast: { light: 0, cinnamon: 1, medium: 2, high: 3, city: 4, fullcity: 5, french: 6, italian: 7 }

  scope :search_bean, ->(bean_search_params) do
    return if bean_search_params.blank?

    joins(:impression)
			.country_search(bean_search_params[:country])
      .roast_search(bean_search_params[:roast])
			.merge(Impression.search_impression(bean_search_params))
  end

  scope :country_search, ->(country) { where('bean_translations.country LIKE ?', "%#{country}%") if country.present? }
  scope :roast_search, ->(roast) { where(roast: roast) if roast.present? }
  mount_uploader :bean_image, ImageUploader
end

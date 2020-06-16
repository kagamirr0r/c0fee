class Bean < ApplicationRecord
  include StringNormalize
  default_scope -> { order(created_at: :desc) }

  validates :country, presence: true

  translates :area, :variety, :farm

  enum country: { Yemen: 0, Ethiopia: 1, Tanzania: 2, Kenya: 3, Rwanda: 4, Burundi: 5, India: 6,
                  Indonesia: 7, PNG: 8, Mexico: 9, Guatemala: 10, Costa_Rica: 11, El_Salvador: 12,
                  Nicaragua: 13, Honduras: 14, Panama: 15, Dominica: 16, Haiti: 17, Jamaica: 18, Brazil: 19,
                  Colombia: 20, Ecuador: 21, Peru: 22, Bolivia: 23, Hawaii: 24, Cuba: 25, Nepal: 26, China: 27,
                  Vietnam: 28, East_Timor: 29, Myanmar: 30 }
  enum process: { washed: 0, natural: 1, pulped_natural: 2, white_honey: 3, yellow_honey: 4, red_honey: 5, black_honey: 6, sumatera: 7 }
  enum roast: { light: 0, cinnamon: 1, medium: 2, high: 3, city: 4, fullcity: 5, french: 6, italian: 7 }

  belongs_to :user
  belongs_to :shop

  has_one :impression, dependent: :destroy
  accepts_nested_attributes_for :impression

  has_many :recipes, dependent: :destroy

  has_many :bean_likes, dependent: :destroy
  has_many :bean_liked_users, through: :bean_likes, source: :user, dependent: :destroy

  scope :search_bean, ->(bean_search_params) do
    return if bean_search_params.blank?

    joins(:impression)
      .country_search(bean_search_params[:country])
      .roast_search(bean_search_params[:roast])
      .merge(Impression.search_impression(bean_search_params))
  end

  scope :country_search, ->(country) { where(country: country) if country.present? }
  scope :roast_search, ->(roast) { where(roast: roast) if roast.present? }

  mount_uploader :bean_image, ImageUploader
end

class Bean < ApplicationRecord
  include StringNormalize
  default_scope -> { order(created_at: :desc) }

  validates :country, presence: true

  translates :area, :variety, :farm

  enum country: { Yemen: 0, India: 1, Indonesia: 2, Ecuador: 3, Ethiopia: 4, El_Salvador: 5, Cuba: 6,
                  Guatemala: 7, Kenya: 8, Costa_Rica: 9, Colombia: 10, Jamaica: 11, Tanzania: 12,
                  China: 13, Dominica: 14, Nicaragua: 15, Nepal: 16, PNG: 17, Panama: 18, Haiti: 19,
                  Hawaii: 20, East_Timor: 21, Brazil: 22, Burundi: 23, Vietnam: 24, Peru: 25, Bolivia: 26, Honduras: 27,
									Myanmar: 28, Mexico: 29, Rwanda: 30 }
	enum variety: { typica: 0, bourbon: 1, catura: 2, catuai: 3, mundonovo: 4, mandheling: 5, maragogype: 6, pacamara: 7, pacas:8, geisha: 9, ethiopian: 10, blue_mountain:11, SL28: 12, SL34:13 }
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

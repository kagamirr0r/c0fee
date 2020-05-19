class Bean < ApplicationRecord
  include StringNormalize
  validates :country, presence: true

  belongs_to :user
  belongs_to :shop

  has_one :impression, dependent: :destroy
  accepts_nested_attributes_for :impression

  has_many :recipes, dependent: :destroy

  has_many :bean_likes, dependent: :destroy
  has_many :bean_liked_users, through: :bean_likes, source: :user, dependent: :destroy

	enum process: { ウォッシュド: 0, ナチュラル: 1, パルプドナチュラル: 2, ホワイトハニー: 3, イエローハニー: 4, レッドハニー: 5, ブラックハニー: 6, スマトラ: 7 }
	enum roast: { ライト: 0, シナモン: 1, ミディアム: 2, ハイ: 3, シティ: 4, フルシティ: 5, フレンチ: 6, イタリアン: 7 }

  scope :search_bean, ->(bean_search_params) do
    return if bean_search_params.blank?

    joins(:impression)
      .country_search(bean_search_params[:country])
      .roast_search(bean_search_params[:roast])
      .merge(Impression.search_impression(bean_search_params))
  end

  scope :country_search, ->(country) { where( 'country LIKE ?', "%#{country}%" ) if country.present? }
  scope :roast_search, ->(roast) { where( roast: roast ) if roast.present? }
  mount_uploader :bean_image, ImageUploader
end

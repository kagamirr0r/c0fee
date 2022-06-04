class Shop < ApplicationRecord
  include StringNormalize

  default_scope -> { order(created_at: :desc) }

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :address, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :url, presence: true, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/, length: { maximum: 1000 }

  translates :name, :address

  has_many :beans, dependent: :destroy
  accepts_nested_attributes_for :beans, allow_destroy: true

  has_many :shop_likes, dependent: :destroy
  has_many :shop_liked_users, through: :shop_likes, source: :user

  scope :search_shop, ->(shop_search_params) do
    name_search(shop_search_params[:name])
      .address_search(shop_search_params[:address])
  end
  scope :name_search, ->(name) { where('shop_translations.name LIKE ?', "%#{name}%") if name.present? }
  scope :address_search, ->(address) { where('shop_translations.address LIKE ?', "%#{address}%") if address.present? }

  mount_uploader :shop_image, ImageUploader

  geocoded_by :address
  after_validation :geocode
end

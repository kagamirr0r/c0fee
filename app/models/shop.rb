class Shop < ApplicationRecord
  include StringNormalize

  validates :name, presence: true
  validates :url, presence: true, uniqueness: true

	translates :name, :address

  has_many :beans, dependent: :destroy
  accepts_nested_attributes_for :beans, allow_destroy: true

  has_many :shop_likes, dependent: :destroy
  has_many :shop_liked_users, through: :shop_likes, source: :user

  scope :search_shop, ->(shop_search_params) do
    name_search(shop_search_params[:name])
      .address_search(shop_search_params[:address])
  end
  scope :name_search, ->(name) { where('name LIKE ?', "%#{name}%") if name.present? }
  scope :address_search, ->(address) { where('address LIKE ?', "%#{address}%") if address.present? }

  mount_uploader :shop_image, ImageUploader

  geocoded_by :address
  after_validation :geocode
end

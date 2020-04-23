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


	scope :search_bean, -> (searched_params) do
		return if searched_params.blank?
		country_search(searched_params[:country])
			.roast_search(searched_params[:roast])
	end

	scope :country_search, -> (country) { where('country LIKE ?', "%#{country}%") if country.present? }
	scope :roast_search, -> (roast) { where('roast LIKE ?', "#{roast}") if roast.present? }
	mount_uploader :bean_image, ImageUploader
end

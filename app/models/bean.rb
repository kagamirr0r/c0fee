class Bean < ApplicationRecord
	has_many :impressions, dependent: :destroy
	has_many :bean_likes, dependent: :destroy
	has_many :recipe_likes, dependent: :destroy
	belongs_to :user
	belongs_to :shop
end

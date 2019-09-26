class Recipe < ApplicationRecord
	has_many :tastes, dependent: :destroy
	has_many :recipe_likes, dependent: :destroy
	belongs_to :bean
end

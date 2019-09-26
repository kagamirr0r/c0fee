class Recipe < ApplicationRecord
	belongs_to :bean
	has_one :taste, dependent: :destroy
	has_many :recipe_likes, dependent: :destroy
end

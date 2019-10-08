class Recipe < ApplicationRecord
	belongs_to :bean
	has_many :recipe_likes, dependent: :destroy

	has_one :taste, dependent: :destroy
	accepts_nested_attributes_for :taste

end

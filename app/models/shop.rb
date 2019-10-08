class Shop < ApplicationRecord
	has_many :beans, dependent: :destroy
	accepts_nested_attributes_for :beans
end

class Shop < ApplicationRecord
	validates :url, presence: true, uniqueness: true

	has_many :beans, dependent: :destroy
	accepts_nested_attributes_for :beans, allow_destroy: true
end

class Shop < ApplicationRecord
	has_many :beans, dependent: :destroy
end

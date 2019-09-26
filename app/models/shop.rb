class Shop < ApplicationRecord
	has_many :beans, dependent: :destory
end

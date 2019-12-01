class Impression < ApplicationRecord
	validates :i_sour,:i_sweet,:i_bitter, length: { minimum: 1, maximum: 5}
	validates :i_sour,:i_sweet,:i_bitter,	presence: true
  belongs_to :bean
end

class Taste < ApplicationRecord
	validates :t_sour,:t_sweet,:t_bitter,:t_aroma,:t_fullbody, presence: true
	validates :t_comment, length:{maximum: 50}
	belongs_to :recipe
end

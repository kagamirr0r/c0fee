class Taste < ApplicationRecord
	validates :t_sour,:t_sweet,:t_bitter,:t_aroma,:t_fullbody, length: { minimum: 1, maximum: 5}
  belongs_to :recipe, optional: true
end

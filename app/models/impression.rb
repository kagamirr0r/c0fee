class Impression < ApplicationRecord
  validates :i_sour, :i_sweet, :i_bitter,  presence: true
  validates :i_comment, length: { maximum: 50 }
  belongs_to :bean
end

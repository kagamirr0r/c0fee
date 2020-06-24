class Inquiry < ApplicationRecord
	validates :name, presence: true, length: { in: 3..30}
  validates :email, presence: true, length: { in: 3..30}, format: /\A\S+@\S+\.\S+\z/
	validates :message, presence: true, length: { in: 1..300}
end

class Inquiry < ApplicationRecord
  validates :name, presence: { message: 'お名前をご入力ください'}
  validates :email, presence: { message: 'メールアドレスをご入力ください'}, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'メールアドレスの形式をご確認ください'}
  validates :message, presence: { message: 'お問い合わせ内容をご入力ください'}, length: { in: 10..300, message: 'お問い合わせ内容は１0から300文字以内でご入力ください' }
end

class Inquiry < ApplicationRecord
  validates :name, presence: { message: I18n.t('errors.messages.Please_enter_your_name') }
  validates :email, presence: { message: I18n.t('errors.messages.Please_input_your_email_address') },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
                              message: I18n.t('errors.messages.Please_check_the_format_of_your_email_address') }
  validates :message, presence: { message: I18n.t('errors.messages.Please_enter_your_inquiry') },
                      length: { in: 10..300, message: I18n.t('errors.messages.Please_enter_your_inquiry_within_10_to_300_characters') }
end

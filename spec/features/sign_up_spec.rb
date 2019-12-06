require 'rails_helper'

RSpec.feature "SignUps", type: :feature do

  background do
    ActionMailer::Base.deliveries.clear
	end

	scenario"signup with a email and a password"do
		visit root_path
		expect(page).to have_http_status :ok

		click_link I18n.t('layouts.application.create_account')

		fill_in 'user_username', with: "ふー"
		fill_in 'user_email', with: "foo@example.com"
		fill_in 'user_password', with: "password"
		fill_in 'user_password_confirmation', with: "password"

		expect {click_button I18n.t('.devise.registrations.new.sign_up')}.to change{ActionMailer::Base.deliveries.size}.by(1)
		page.has_text?(I18n.t('devise.registrations.signed_up_but_unconfirmed'))
	end
end
